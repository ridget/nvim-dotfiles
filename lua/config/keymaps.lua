local M = {}

-- Maps four pairs:
-- [f, [F, ]f, ]F
-- for the given treesitter textobject
-- see: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local ts_move_keys = {
	f = { query = "@function.outer", desc = "goto function" },
	a = { query = "@attribute.inner", desc = "goto attribute" },
	b = { query = "@block.inner", desc = "goto block" },
	c = { query = "@class.outer", desc = "goto class" },
	x = { query = "@comment.outer", desc = "goto comment" },
	g = { query = { "@class.outer", "@function.outer" }, desc = "goto major" },
}

M.ts_goto_next_start = {}
M.ts_goto_next_end = {}
M.ts_goto_previous_start = {}
M.ts_goto_previous_end = {}

for k, v in pairs(ts_move_keys) do
	M.ts_goto_next_start["]" .. k] = v
	M.ts_goto_next_end["]" .. string.upper(k)] = v
	M.ts_goto_previous_start["[" .. k] = v
	M.ts_goto_previous_end["[" .. string.upper(k)] = v
end

-- Some symbolic keymaps that don't have a string.upper()
M.ts_goto_next_start["]="] = { query = "@statement.outer", desc = "goto statement" }
M.ts_goto_previous_start["[="] = { query = "@statement.outer", desc = "goto statement" }
M.ts_goto_next_start["],"] = { query = "@parameter.outer", desc = "goto parameter" }
M.ts_goto_previous_start["[,"] = { query = "@parameter.outer", desc = "goto parameter" }

M.ts_swap_next = {
	["<leader>s"] = { query = "@parameter.inner", desc = "Swap next parameter" },
}
M.ts_swap_previous = {
	["<leader>S"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
}

M.ts_select = {
	["af"] = { query = "@function.outer", desc = "Select outer function" },
	["if"] = { query = "@function.inner", desc = "Select inner function" },
	["ac"] = { query = "@class.outer", desc = "Select outer class" },
	["ic"] = { query = "@class.inner", desc = "Select inner class" },
	["aB"] = { query = "@block.outer", desc = "Select outer block" },
	["iB"] = { query = "@block.inner", desc = "Select inner block" },
	["aa"] = { query = "@attribute.outer", desc = "Select outer attribute" },
	["ia"] = { query = "@attribute.inner", desc = "Seect inner attribute" },
	["ax"] = { query = "@comment.outer", desc = "Select outer comment" },
	["ix"] = { query = "@comment.inner", desc = "Select inner comment" },
	["a="] = { query = "@statement.outer", desc = "Select outer statement" },
	["i="] = { query = "@statement.inner", desc = "Select inner statement" },
	["a,"] = { query = "@parameter.outer", desc = "Select outer parameter" },
	["i,"] = { query = "@parameter.inner", desc = "Select inner parameter" },
}

return M
