return {
	"folke/snacks.nvim",
	opts = {
		scroll = {
			enabled = false, -- Disable scrolling animations
		},
		picker = {
			win = {
				input = {
					keys = {
						["<M-h>"] = false, -- unmap the tmux-conflicting bind
						["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					},
				},
			},
		},
	},
}
