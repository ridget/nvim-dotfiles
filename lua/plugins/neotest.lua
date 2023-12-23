return {
	"nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
		"olimorris/neotest-rspec",
  },
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rspec")
			}
		})
	end
}
