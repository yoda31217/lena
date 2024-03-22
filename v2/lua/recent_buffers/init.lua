local entry_display = require("telescope.pickers.entry_display")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local path = require("plenary.path")
local make_entry = require("telescope.make_entry")
local builtin = require("telescope.builtin")

local displayer = entry_display.create({
  separator = " ",
  items = {
    { width = 2 },
    { remaining = true },
  },
})

local make_display = function(entry)
  return displayer({
    { entry.index - 1, "TelescopeResultsNumber" },
    entry.filename,
  })
end

local cwd = vim.fn.expand(vim.loop.cwd())

local function show_recent_buffers()
  builtin.buffers({
    sort_mru = true,
    on_complete = {
      function()
        vim.cmd("stopinsert")
      end,
    },
    attach_mappings = function(prompt_bufnr, map)
      local function select_buffer_by_index(target_buffer_index)
        local selected_buffer_entry = actions_state.get_selected_entry()
        local selected_buffer_index = selected_buffer_entry.index
        local target_buffer_offset = selected_buffer_index - target_buffer_index
        action_set.shift_selection(prompt_bufnr, target_buffer_offset)
        actions.select_default(prompt_bufnr)
      end

      local function delete_selected_buffer()
        -- local selected_buffer_entry = actions_state.get_selected_entry()
        -- local selected_buffer_index = selected_buffer_entry.index
        -- local target_buffer_offset = selected_buffer_index
        --   - target_buffer_index
        -- action_set.shift_selection(prompt_bufnr, target_buffer_offset)
        -- actions.select_default(prompt_bufnr)
        -- action_set.edit(prompt_bufnr, "drop")

        actions.delete_buffer(prompt_bufnr)
        actions.close(prompt_bufnr)
        show_recent_buffers()
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

      for i = 0, 9 do
        map("n", i .. "", function()
          select_buffer_by_index(i + 1)
        end)
      end

      map("n", "x", function()
        delete_selected_buffer()
      end)

      return true
    end,
    entry_maker = function(entry)
      local filename = entry.info.name ~= "" and entry.info.name or "[No Name]"
      filename = path:new(filename):normalize(cwd)

      return make_entry.set_default_entry_mt({
        value = entry,
        ordinal = entry.bufnr .. " : " .. filename,
        display = make_display,
        filename = filename,
        bufnr = entry.bufnr,
      }, {})
    end,
  })
end

return {
  show_recent_buffers = show_recent_buffers,
}
