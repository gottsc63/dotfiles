return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        fuzzy_finder_mappings = {
          ["<C-j>"] = "move_cursor_down",
          ["<C-k>"] = "move_cursor_up",
          ["<down>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
        },
      },
    },
  },
}
