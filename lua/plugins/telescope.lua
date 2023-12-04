return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist, -- move to next result
					}
				}
			}
		})
	end,
	keys = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		telescope.load_extension("fzf")

		-- set keymaps

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {silent = true, desc = "Find files in cwd"})
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles,  {desc = "Find recent files in cwd"})
		vim.keymap.set("n", "<leader>fs", builtin.live_grep,  {desc = "Find string in cwd"})
		vim.keymap.set("n", "<leader>*", builtin.grep_string,  {desc = "Find string under cursor in cwd"})
	end
}
