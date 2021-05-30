local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter'
    use 'arcticicestudio/nord-vim'
    use 'chrisbra/Colorizer'
    use 'itchyny/lightline.vim'
    use 'jiangmiao/auto-pairs'
    use 'junegunn/goyo.vim'
    use 'junegunn/gv.vim'
    use 'mattn/emmet-vim'
    use 'plasticboy/vim-markdown'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'mcchrish/nnn.vim'
    use 'vim-jp/vimdoc-ja'
    use 'mechatroner/rainbow_csv'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    -- use "rafamadriz/friendly-snippets"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }
    use {
        'skywind3000/asynctasks.vim',
        requires = {'skywind3000/asyncrun.vim'}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- use {
    --     'hrsh7th/vim-vsnip',
	-- requires = {'hrsh7th/vim-vsnip-integ'}
    -- }
end)

-- Colors
vim.o.termguicolors = true
vim.cmd('colorscheme nord')
vim.g.lightline = {
    colorscheme = 'nord'
}

vim.o.shiftwidth = 4 -- # of spaces for autoindent
vim.o.softtabstop = 4 -- Pretend tab is removed when hitting <BS>
vim.o.expandtab = true -- Insert spaces when hitting <Tab> 
vim.o.autoindent = true-- Same indent as previous line

vim.wo.number = true -- Also show the current line instead of a 0
vim.wo.relativenumber = true -- Easier way to calculate lines

vim.o.hlsearch = false -- Turn off persistant highlighting
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- If first letter is uppercase, then make the search Case sensitive

vim.o.undofile = true -- Persistant backup file
vim.o.undolevels = 1000 -- Use a large number of undo levels
vim.o.undodir = '~/.config/nvim/undodir' 

vim.o.foldenable = false -- Disable folding
vim.o.foldmethod = 'manual' -- Fold by indent
vim.o.foldlevel = 1 -- Only fold one level deep
vim.o.foldclose = 'all' -- Close all fold

-- Misc
vim.o.helplang = 'ja,en' --Japanese help docs
vim.o.hidden = true -- Hide buffers instead of closing them
vim.o.mouse = 'a' -- Be able to use the mouse
vim.o.scrolloff = 8 -- So the cursor isn't all the way at the bottom
vim.o.splitbelow = true -- Split directions
vim.o.splitright = true 
vim.o.guicursor = 'i:block' -- Get rid of the ugly line cursor in insert mode
vim.o.wrap = true -- Wrap lines
vim.o.history = 1000 -- Bigger history size
vim.o.title = true -- Change title
vim.o.lazyredraw = true -- Don't redraw when executing macros
vim.o.showmode = false -- Since lightline already displays it
vim.o.completeopt = "menuone,noselect"
vim.o.updatetime=200 -- Inactive time for CursorHold

vim.g.mapleader = ' '

-- Edit vimrc
vim.api.nvim_set_keymap('n', '<Leader>ev', ':new ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

-- Copy all text to system clipboard
vim.api.nvim_set_keymap('n', '<Leader>Y', ':%y+<CR>', { noremap = true })
-- Copy text to system clipboard
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true })
-- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true })

-- Moving through tabs
vim.api.nvim_set_keymap('n', '<S-H>', 'gT', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-L>', 'gt', { noremap = true })

-- Faster scrolling
vim.api.nvim_set_keymap('n', '<C-E>', '2<C-E>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Y>', '2<C-Y>', { noremap = true })

-- Toggle spell check
vim.api.nvim_set_keymap('n', '<Leader>ts', ':set spell!', { noremap = true, silent = true })

-- Move between splits
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Open url in browser
vim.api.nvim_set_keymap('n', 'gx', ':silent execute "!xdg-open " . shellescape("<cWORD>")<CR>', { noremap = true })

-- Close current buffer
vim.api.nvim_set_keymap('n', '<Leader>q', ':bd<CR>', { noremap = true, silent = true })

-- Close current window
vim.api.nvim_set_keymap('n', '<Leader>cw', '<C-W>c', { noremap = true, silent = true })

-- Faster way to write changes
vim.api.nvim_set_keymap('n', '<Leader>w', ':update<CR>', { noremap = true })
-- Faster way to quit
vim.api.nvim_set_keymap('n', '\\q', ':quit<CR>', { noremap = true })

-- Use tab to match pairs
vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })

-- Faster way to get into command line mode
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>;', ';', { noremap = true })

-- Expected behavior when moving through wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Much easier way to get to normal mode
vim.api.nvim_set_keymap('n', '<C-C>', '<Esc>', { noremap = true })

-- Zen mode
vim.api.nvim_set_keymap('n', '<Leader>z', ':Goyo<CR>', { noremap = true, silent = true })
-- Strip whitespace of file
vim.api.nvim_set_keymap('n', '<Leader>ss', ':call StripWhitespace()<CR>', { noremap = true })
-- cd to the current file's folder
vim.api.nvim_set_keymap('n', '<Leader>c', ':cd %:p:h<CR>', { noremap = true })

-- Move through command line history
vim.api.nvim_set_keymap('c', '<C-N>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-P>', '<Up>', { noremap = true })

-- Quickly move current line
vim.api.nvim_set_keymap('n', '[e', ':<c-u>execute "move -1-". v:count1<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ']e', ':<c-u>execute "move +". v:count1<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<F4>', ':MarkdownPreview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':AsyncTask liveserver<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true })

-- Plugin-specific settings
vim.g.ftplugin_sql_omni_key = '<C-K>' -- Remap to different key since Ctrl-C is for escape
vim.g.sql_type_default = 'postgres' -- Change sql dialect to postgres
vim.g.goyo_width = 100 -- Increase zen mode width
vim.g.asyncrun_open = 6 -- Activate async task manager
vim.g.asynctasks_extra_config = { '~/.config/nvim/.tasks' } -- Global tasks
vim.g['nnn#layout'] = { window = { width = 0.9, height = 0.6, highlight = 'Debug' } }
vim.g['nnn#replace_netrw'] = 1

-- User commands
vim.api.nvim_exec([[
" Commonly mistyped commands
command! W w
command! Q q
" Delete all buffers except the current one
command! Bonly %bd|e#
" Format code
command! Format execute 'lua vim.lsp.buf.formatting()' 
]], false)

-- Autocommands
vim.api.nvim_exec([[
augroup mygroup
    autocmd!
    " Fixes airline bug when window goes out of focus
    autocmd! User GoyoEnter nested set eventignore=FocusGained
    autocmd! User GoyoLeave nested set eventignore=
    " Filetype corrections
    autocmd BufNewFile,BufRead .tasks set syntax=dosini
    " Format on save
    autocmd BufWritePost *.rs :Format
augroup end
]], false)

-- Plugin configuration
require'nvim-treesitter.configs'.setup {
   ensure_installed = { "c", "cpp", "java", "python", "rust", "typescript", "javascript", "toml"}, 
   link,
   highlight = {
     enable = true,
   },
}

-- Autocomplete
require'compe'.setup {
  enabled = true; autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    -- vsnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}
