local pickers_entry_display = require("telescope.pickers.entry_display")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local Path = require("plenary.path")
local make_entry = require("telescope.make_entry")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local themes = require("telescope.themes")

local displayer = pickers_entry_display.create({
  separator = " ",
  items = {
    { width = 2 },
    { remaining = true },
    { remaining = true },
  },
})

local make_display = function(entry)
  return displayer({
    { entry.index, "TelescopeResultsNumber" },
    { entry.filename_tail, "TelescopeResultsNormal" },
    { entry.directory, "TelescopeResultsComment" },
  })
end

local function entry_maker(filename)
  ---@diagnostic disable-next-line: undefined-field
  local cwd = vim.fn.expand(vim.loop.cwd())

  local filename_tail = utils.path_tail(filename)
  local absolute_directory = Path:new(filename):parent()
  local relative_directory = Path:new(absolute_directory):normalize(cwd)

  return make_entry.set_default_entry_mt({
    value = filename,
    ordinal = filename,
    display = make_display,
    filename = filename,
    filename_tail = filename_tail,
    directory = relative_directory,
  }, {})
end

local show_recent_files

local function get_selected_entry()
  return actions_state.get_selected_entry()
end

local function get_selected_entry_index()
  return get_selected_entry().index
end

local function select_entry_by_index(target_entry_index, prompt_bufnr)
  local selected_entry_index = get_selected_entry_index()
  local target_entry_offset = target_entry_index - selected_entry_index
  action_set.shift_selection(prompt_bufnr, target_entry_offset)
end

local function open_selected_entry(prompt_bufnr)
  actions.select_default(prompt_bufnr)
end

local function open_entry_by_index(target_entry_index, prompt_bufnr)
  select_entry_by_index(target_entry_index, prompt_bufnr)
  open_selected_entry(prompt_bufnr)
end

show_recent_files = function(opts)
  builtin.oldfiles(vim.tbl_extend(
    "force",
    themes.get_dropdown({
      winblend = 10,
      previewer = false,
    }),
    {
      on_complete = {
        function()
          vim.cmd("stopinsert")
        end,
      },
      include_current_session = true,
      cwd_only = false,
      entry_maker = entry_maker,
      attach_mappings = function(prompt_bufnr, map)
        for i = 1, 9 do
          map("n", i .. "", function()
            open_entry_by_index(i, prompt_bufnr)
          end)
        end
        return true
      end,
    },
    opts or {}
  ))
end

vim.keymap.set("n", "<tab>", function()
  show_recent_files()
end, { desc = "Show recent files" })

return {
  show = show_recent_files,
}
