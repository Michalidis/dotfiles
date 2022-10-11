call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color scheme "
Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Floaterm "
Plug 'voldikss/vim-floaterm'

" Startify "
Plug 'mhinz/vim-startify'

" MySQL "
Plug 'https://github.com/kezhenxu94/vim-mysql-plugin.git'

" GhostText - Edit Websites "
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

" Python Indetation Fix "
Plug 'vim-scripts/indentpython.vim'

" Python PEP8 Check "
Plug 'nvie/vim-flake8'

" Python Syntax Highlighting "
Plug 'numirias/semshi'

" Tmux switching between nvim and panes "
Plug 'christoomey/vim-tmux-navigator'

" Submode "
Plug 'kana/vim-submode'

" Syntax Highlighting for Perl/Template Toolkit "
Plug 'vim-perl/vim-perl'

" Javascript, TypeScript and React support (bundle intended for react development)
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" HTML generate closing tags
Plug 'alvan/vim-closetag'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Buffer line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" LUA
Plug 'nvim-lua/plenary.nvim'

" Mason - LSP configuration interface
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Visual Multi config
let g:VM_maps = {}
let g:VM_maps['Add Cursor Up'] = ''
let g:VM_maps['Add Cursor Down'] = ''

" JSX pretty config
let g:vim_jsx_pretty_highlight_close_tag = 1

" Vim prettier config
let g:prettier#autoformat = 0
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Remap leader
let mapleader = "\<space>"

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tmux panel x Nvim split switching
let g:tmux_navigator_no_mappings = 1

" Display line numbers
set number
set relativenumber

" Display line at cursor
set cursorline

" Enable gruvbox color scheme
colorscheme gruvbox
set background=dark  " Setting dark mode

set listchars=tab:␉·,trail:␠
set list

" MAPPING "
" Save file. Press ENTER to confirm . . .
nmap <C-s> :w

" Resize panes
" map <C-W><C-Up> <C-W>-
" map <C-W><C-Down> <C-W>+
" map <C-W><C-Left> <C-W><
" map <C-W><C-Right> <C-W>>

call submode#enter_with('grow/shrink', 'n', '', '<C-W><Up>', '<C-W>+')
call submode#enter_with('grow/shrink', 'n', '', '<C-W><Down>', '<C-W>-')
call submode#enter_with('grow/shrink', 'n', '', '<C-W><Right>', '<C-W>>')
call submode#enter_with('grow/shrink', 'n', '', '<C-W><Left>', '<C-W><')

call submode#map('grow/shrink', 'n', '', '<Up>', '<C-W>+')
call submode#map('grow/shrink', 'n', '', '<Down>', '<C-W>-')
call submode#map('grow/shrink', 'n', '', '<Right>', '<C-W>>')
call submode#map('grow/shrink', 'n', '', '<Left>', '<C-W><')

" Disable submode timeouts
let g:submode_timeout = 0

" Do not consume submode-leaving key
let g:submode_keep_leaving_key = 1

" Move per paragraphs in normal mode
nnoremap <silent> í {
nnoremap <silent> é }

" Navigation between nvim splits and tmux panes
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Move per paragraphs in visual mode
vnoremap <silent> í {
vnoremap <silent> é }

" Move line up and down
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" dont use Q for Ex mode
map Q :q

" make tab in normal mode indent code (Commented out - added to Coc config)
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" make tab in v mode indent code (Commented out - added to Coc config)
vmap <tab> >gv
vmap <s-tab> <gv

" Git Gutter Config "

" Navigate to next hunk
nmap äh <Plug>(GitGutterNextHunk)
" Navigate to previous hunk
nmap úh <Plug>(GitGutterPrevHunk)

" Stage hunk
nmap ths <Plug>(GitGutterStageHunk)
" Revert hunk
nmap thr <Plug>(GitGutterUndoHunk)

" Preview hunk changes
nmap thp <Plug>(GitGutterPreviewHunk)

" coc-angular
nmap <leader>gc :call CocAction('runCommand', 'angular.goToComponentWithTemplateFile')
nmap <leader>gt :call CocAction('runCommand', 'angular.goToTemplateForComponent')

" Floaterm config
nmap ff :FloatermNew<CR>
nmap ft :FloatermToggle<CR>
nmap fn :FloatermNext<CR>
"nmap fp :FloatermPrev<CR>

" Remap Ctrl-y for easier terminal mode cancel combo (<C-\><C-n>)
tnoremap <C-y> <C-\>

" Floaterm + Ranger 
map <leader>r :FloatermNew ranger<CR>

" FZF
nmap <leader>e :FZF<CR>
"nmap <leader>e :GFiles<CR>
nmap <leader>f :Rg 

" Mason 
map <leader>m :Mason<CR>

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>


" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" FILE SPECIFIC CONFIG "
""" TypeScript coding
autocmd FileType typescript set tabstop=2|set softtabstop=2|set expandtab|set shiftwidth=2

""" Python coding
set encoding=utf-8

au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

au FileType javascript,html,css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

""" Perl coding

" autoindent
autocmd FileType perl set autoindent|set smartindent

" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set noexpandtab|set softtabstop=4

" show matching brackets
autocmd FileType perl set showmatch

""" Template Toolkit
au BufNewFile,BufRead *.tt2 
    \ set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 
" Syntax highlighting using vim-perl plugin
autocmd BufNewFile,BufRead *.tt2 setf tt2html

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" display filename in bottom bar at all times
"set statusline+=%F

" Redefine semshi color scheme to match gruvbox
hi semshiGlobal          ctermfg=167 guifg=#fb4934
hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
hi semshiParameter       ctermfg=142  guifg=#98971a
hi semshiParameterUnused ctermfg=106 guifg=#665c54
hi semshiBuiltin         ctermfg=208 guifg=#fe8019
hi semshiAttribute       ctermfg=108  guifg=fg
hi semshiSelf            ctermfg=109 guifg=#85a598
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

" Airline config
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Buffer config
"map <C-W><C-Right> :bn<cr>
"map <C-W><C-Left> :bp<cr>
"map <C-W><C-d> :bd<cr>

call submode#enter_with('prev/next', 'n', '', '<C-W><C-Left>', ':bp<CR>')
call submode#enter_with('prev/next', 'n', '', '<C-W><C-Right>', ':bn<CR>')
call submode#enter_with('prev/next', 'n', '', '<C-W><C-d>', ':bd<CR>')

call submode#map('prev/next', 'n', '', '<C-Left>', ':bp<CR>')
call submode#map('prev/next', 'n', '', '<C-Right>', ':bn<CR>')
call submode#map('prev/next', 'n', '', '<C-d>', ':bd<CR>')

" Bufferline
set termguicolors
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()

require("bufferline").setup()

require("modules")
EOF
