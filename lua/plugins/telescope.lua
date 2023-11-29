local keys = function()
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>f", builtin.find_files, {silent = true, desc = "Find files"})
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = keys,
}
