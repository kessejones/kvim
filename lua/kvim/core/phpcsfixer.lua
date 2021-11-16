local M = {  }

function M:init()
    vim.g.php_cs_fixer_level = 'symfony' 
    vim.g.php_cs_fixer_config = 'default' 
    vim.g.php_cs_rules = '@PSR12'
    vim.g.php_cs_using_cache = 0

    vim.g.php_fixer_dry_run = 0  
    vim.g.php_fixer_verbose = 0 

    vim.cmd[[autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()]]
end

return M

