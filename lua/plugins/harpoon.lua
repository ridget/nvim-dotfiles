
return {
    "ThePrimeagen/harpoon",
		lazy = false,
		dependencies = {
      "nvim-lua/plenary.nvim",         -- required
		},
		config = function() 
			require("harpoon"):setup()
		end,
		branch = "harpoon2",
		keys = function()
			local harpoon = require("harpoon")

			-- set keymaps

			vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add current file to harpoon list"})
			vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Clear all items in harpoon list"})
			vim.keymap.set("n", "<leader>fhl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "List all files in harpoon list"})
		end
}
