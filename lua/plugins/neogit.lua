local keys = function()
  local neogit = require('neogit')
  vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")
end

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true,
  cmd = "Neogit",
  keys = keys,
}
