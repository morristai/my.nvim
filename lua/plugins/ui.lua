-- UI plugins: theme, statusline, and visual improvements.

return {
	-- catppuccin: warm, eye-friendly colorscheme with great Treesitter support
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = false,
			color_overrides = {
				mocha = {
					base = "#11111b", -- darker background (was #1e1e2e)
					mantle = "#0b0b14", -- darker sidebars/floats (was #181825)
					crust = "#070710", -- darkest layer (was #11111b)
				},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				mason = true,
				native_lsp = { enabled = true },
				notify = true,
				aerial = true,
				telescope = { enabled = true },
				treesitter = true,
				which_key = true,
				mini = { enabled = true },
				dap = true,
				dap_ui = true,
				neotest = true,
			},
		},
	},

	-- lualine.nvim: statusline (LazyVim configures it; add Rust-relevant info)
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			-- Add LSP server name to statusline
			local function lsp_name()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return ""
				end
				local names = {}
				for _, client in ipairs(clients) do
					table.insert(names, client.name)
				end
				return " " .. table.concat(names, ", ")
			end

			-- Insert LSP info into section x
			table.insert(opts.sections.lualine_x, 1, { lsp_name, color = { fg = "#89b4fa" } })
			return opts
		end,
	},

	-- indent-blankline v3: show indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = true },
		},
	},

	-- noice.nvim: override for cleaner command line (LazyVim includes this)
	{
		"folke/noice.nvim",
		opts = {
			presets = {
				bottom_search = true, -- Classic bottom search bar
				command_palette = true, -- Command popup
				long_message_to_split = true, -- Long messages go to split
				lsp_doc_border = true, -- Bordered LSP docs
			},
		},
	},

	-- dressing.nvim: improved vim.ui.select and vim.ui.input
	{
		"stevearc/dressing.nvim",
		opts = {
			input = { enabled = true },
			select = { enabled = true },
		},
	},
}
