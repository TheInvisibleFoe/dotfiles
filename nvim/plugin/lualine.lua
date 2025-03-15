local line = require("lualine")
line.setup({
    options = {
        theme = 'ayu_dark'
    },

    inactive_sections = {
        lualine_a = { function()
            return [[It's never lupus]]
        end },
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },

})
