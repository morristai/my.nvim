vim.api.nvim_set_keymap('n', '<leader>sc',
    '<cmd>lua require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown({enable_preview=true}))<CR>',
    { noremap = true, silent = true })

local catppuccin = require("catppuccin")
catppuccin.setup {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
    },
    color_overrides = {
        mocha = {
            base = "#000000",
        },
    },
    highlight_overrides = {
        mocha = function(C)
            return {
                TabLineSel = { bg = C.pink },
                NvimTreeNormal = { bg = C.none },
                CmpBorder = { fg = C.surface2 },
                Pmenu = { bg = C.none },
                NormalFloat = { bg = C.none },
                TelescopeBorder = { link = "FloatBorder" },
            }
        end,
    },
}
