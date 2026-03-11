function neo_tree_line_number(arg)
  vim.cmd [[
    setlocal relativenumber
  ]]
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = neo_tree_line_number,
      },
    },
  },
}
