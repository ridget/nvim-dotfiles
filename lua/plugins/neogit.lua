local keys = function()
  local neogit = require('neogit')
  vim.keymap.set("n", "<leader>gs", neogit.open({cwd = "%:p:h", kind = "split"}), {})
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
}
