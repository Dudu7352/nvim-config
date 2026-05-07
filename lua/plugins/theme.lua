return {
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	name = "ayu",
	-- 	priority = 1000,
	-- 	opts = {
	-- 		overrides = {
	-- 			Normal = { bg = "None" },
	-- 			-- NormalFloat = { bg = "none" },
	-- 			ColorColumn = { bg = "None" },
	-- 			SignColumn = { bg = "None" },
	-- 			Folded = { bg = "None" },
	-- 			FoldColumn = { bg = "None" },
	-- 			CursorLine = { bg = "None" },
	-- 			CursorColumn = { bg = "None" },
	-- 			VertSplit = { bg = "None" },
	-- 		}
	-- 	}
	-- }
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				local is_light = vim.o.background == "light"
				if is_light then
					-- Very subtle cursor line - just a faint underline or dim background
					-- hl.CursorLine = { bg = c.none, underline = true, sp = c.dark3 }
					-- Or use a very dim background:
					hl.CursorLine = { bg = "#dadbd6", blend = 20 }

					-- Subtle visual selection with transparency
					hl.Visual = { bg = "#dadbd6", blend = 20 }
				else
					-- Very subtle cursor line - just a faint underline or dim background
					-- hl.CursorLine = { bg = c.none, underline = true, sp = c.dark3 }
					-- Or use a very dim background:
					hl.CursorLine = { bg = "#1a1b26", blend = 20 }

					-- Subtle visual selection with transparency
					hl.Visual = { bg = "#1a1b26", blend = 20 }
				end

				-- Transparent backgrounds for various UI elements
				hl.NormalFloat = { bg = "none" }
				hl.FloatBorder = { bg = "none", fg = c.border_highlight }
				hl.Pmenu = { bg = "none" }
				hl.PmenuSel = { bg = c.bg_visual }

				-- Make folds transparent
				hl.Folded = { bg = "none", fg = c.comment }

				-- Adjust diff colors for transparency
				hl.DiffAdd = { bg = "none", fg = c.git.add }
				hl.DiffChange = { bg = "none", fg = c.git.change }
				hl.DiffDelete = { bg = "none", fg = c.git.delete }
				hl.DiffText = { bg = c.git.change, fg = c.bg }
			end,
		},
	},
	{
		"f-person/auto-dark-mode.nvim",
		config = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
			end,
		},
	},
}
