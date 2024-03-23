local pickers_entry_display = require("telescope.pickers.entry_display")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local Path = require("plenary.path")
local make_entry = require("telescope.make_entry")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

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
    { entry.filename, "TelescopeMatching" },
    entry.directory,
  })
end

local function entry_maker(entry)
  local absolute_file_path = entry.info.name ~= "" and entry.info.name
    or "[No Name]"
  local filename = utils.path_tail(absolute_file_path)
  local absolute_directory_path = Path:new(absolute_file_path):parent()
  local relative_directory_path = Path:new(absolute_directory_path)
    :normalize(cwd)

  return make_entry.set_default_entry_mt({
    value = entry,
    ordinal = absolute_file_path,
    display = make_display,
    filename = filename,
    directory = relative_directory_path,
    bufnr = entry.bufnr,
  }, {})
end

local function select_buffer_by_index(target_buffer_index, prompt_bufnr)
  local selected_buffer_entry = actions_state.get_selected_entry()
  local selected_buffer_index = selected_buffer_entry.index
  local target_buffer_offset = selected_buffer_index - target_buffer_index
  action_set.shift_selection(prompt_bufnr, target_buffer_offset)
  actions.select_default(prompt_bufnr)
end

local function delete_selected_buffer(prompt_bufnr)
  -- local selected_buffer_entry = actions_state.get_selected_entry()
  -- local selected_buffer_index = selected_buffer_entry.index
  -- local target_buffer_offset = selected_buffer_index
  --   - target_buffer_index
  -- action_set.shift_selection(prompt_bufnr, target_buffer_offset)
  -- actions.select_default(prompt_bufnr)
  -- action_set.edit(prompt_bufnr, "drop")

  actions.delete_buffer(prompt_bufnr)
  actions.close(prompt_bufnr)
  -- vim.cmd("<leader><leader>")
  -- local current_picker =
  --   actions_state.get_current_picker(prompt_bufnr)
  -- current_picker:delete_selection(function(selection)
  --   -- local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"
  --   -- local ok = pcall(vim.api.nvim_buf_delete, selection.bufnr, { force = force })
  --   -- return ok
  --   return true
  -- end)
end

local function show_recent_buffers()
  builtin.buffers({
    sort_mru = true,
    on_complete = {
      function()
        vim.cmd("stopinsert")
      end,
    },
    attach_mappings = function(prompt_bufnr, map)
      for i = 0, 9 do
        map("n", i .. "", function()
          select_buffer_by_index(i + 1, prompt_bufnr)
        end)
      end
      map("n", "x", function()
        delete_selected_buffer(prompt_bufnr)
        show_recent_buffers()
      end)
      return true
    end,
    entry_maker = entry_maker,
  })
end

return {
  show = show_recent_buffers,
}
