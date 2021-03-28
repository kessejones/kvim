local kvim_header = {
    '██╗  ██╗ ██╗   ██╗██╗███╗   ███╗',
    '██║ ██╔╝ ██║   ██║██║████╗ ████║',
    '█████╔╝  ██║   ██║██║██╔████╔██║',
    '██╔═██╗  ╚██╗ ██╔╝██║██║╚██╔╝██║',
    '██║  ██╗  ╚████╔╝ ██║██║ ╚═╝ ██║',
    '╚═╝  ╚═╝   ╚═══╝  ╚═╝╚═╝     ╚═╝'
}

local kvim_footer = {"Kesse Jones"}

local kvim_section_menu = {
    a = { description = {" Buscar Arquivo        "}, command = 'Telescope find_files' },
    -- b = { description = " Arquivos Recentes     ", command = 'Telescope oldfiles' },
    -- c = { description = " Carregar Ultima Sessão", command = 'SessionLoad' },
    -- d = { description = " Pesquisar Palavra     ", command = 'Telescope live_grep' },
    -- e = { description = " Favoritos             ", command = 'Telescope marks' }
}

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = kvim_header
vim.g.dashboard_custom_footer = kvim_footer
vim.g.dashboard_custom_section = kvim_section_menu
vim.g.dashboard_session_directory = '~/.cache/vim/session'

-- Open dashboard on open new tab
vim.cmd 'au! TabNewEntered * Dashboard'
