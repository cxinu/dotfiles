return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'pywal16-nvim',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    {
                        'branch',
                        icon = '',
                        separator = { left = '', right = '' },
                    },
                    'diff',
                    'diagnostics'
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1,                   -- 0 = just filename, 1 = relative path, 2 = absolute path
                        color = { fg = '#888888' }, -- dimmed gray color
                        -- color = 'Comment'        -- Alternatively use a highlight group: color = 'Comment'
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        }
    end,
}
