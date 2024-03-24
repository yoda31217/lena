local pickers_entry_display = require("telescope.pickers.entry_display")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local Path = require("plenary.path")
local make_entry = require("telescope.make_entry")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local themes = require("telescope.themes")

---@diagnostic disable-next-line: undefined-field
local cwd = vim.fn.expand(vim.loop.cwd())

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
    { entry.index - 1, "TelescopeResultsNumber" },
    { entry.filename_tail, "TelescopeResultsNormal" },
    { entry.directory, "TelescopeResultsComment" },
  })
end

local function entry_maker(entry)
  local filename = entry.info.name ~= "" and entry.info.name or "[No Name]"
  local filename_tail = utils.path_tail(filename)
  local absolute_directory = Path:new(filename):parent()
  local relative_directory = Path:new(absolute_directory):normalize(cwd)

  return make_entry.set_default_entry_mt({
    value = entry,
    ordinal = filename,
    display = make_display,
    filename = filename,
    filename_tail = filename_tail,
    directory = relative_directory,
    bufnr = entry.bufnr,
  }, {})
end

local show_recent_buffers

local function get_selected_buffer_index()
  return actions_state.get_selected_entry().index
end

local function get_buffer_entries(prompt_bufnr)
  return actions_state.get_current_picker(prompt_bufnr).finder.results
end

local function get_buffers_count(prompt_bufnr)
  return #get_buffer_entries(prompt_bufnr)
end

local function select_buffer_by_index(target_buffer_index, prompt_bufnr)
  local selected_buffer_index = get_selected_buffer_index()
  local target_buffer_offset = target_buffer_index - selected_buffer_index
  action_set.shift_selection(prompt_bufnr, target_buffer_offset)
end

local function open_selected_buffer(prompt_bufnr)
  actions.select_default(prompt_bufnr)
end

local function open_buffer_by_index(target_buffer_index, prompt_bufnr)
  select_buffer_by_index(target_buffer_index, prompt_bufnr)
  open_selected_buffer(prompt_bufnr)
end

local function delete_selected_buffer(prompt_bufnr)
  local selected_buffer_index = get_selected_buffer_index()
  local buffers_count = get_buffers_count(prompt_bufnr)
  actions.delete_buffer(prompt_bufnr)
  actions.close(prompt_bufnr)
  show_recent_buffers({
    default_selection_index = math.min(
      selected_buffer_index,
      buffers_count - 1
    ),
  })
end

show_recent_buffers = function(opts)
  opts = vim.tbl_extend(
    "force",
    themes.get_dropdown({
      winblend = 10,
      previewer = false,
    }),
    {
      sort_mru = true,
      on_complete = {
        function()
          vim.cmd("stopinsert")
        end,
      },
      attach_mappings = function(prompt_bufnr, map)
        for i = 0, 9 do
          map("n", i .. "", function()
            open_buffer_by_index(i + 1, prompt_bufnr)
          end)
        end
        map("n", "x", function()
          delete_selected_buffer(prompt_bufnr)
        end)
        -- map("n", "d", function()
        --   print(vim.inspect(get_buffer_entries(prompt_bufnr)))
        -- end)
        return true
      end,
      entry_maker = entry_maker,
    },
    opts or {}
  )

  builtin.buffers(opts)
end

vim.keymap.set("n", "<tab>", function()
  show_recent_buffers()
end, { desc = "Show recent buffers" })

return {
  show = show_recent_buffers,
}
