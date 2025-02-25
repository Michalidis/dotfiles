call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'iamcco/coc-angular'

" Color scheme "
Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Floaterm "
Plug 'voldikss/vim-floaterm'

" Startify "
Plug 'mhinz/vim-startify'

" MySQL "
" Plug 'https://github.com/kezhenxu94/vim-mysql-plugin.git'

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
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" LUA
Plug 'nvim-lua/plenary.nvim'

" ChatGPT
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Mason - LSP configuration interface
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" GitTimeLapse command - browse file commit history
Plug 'junkblocker/git-time-lapse'

" Spellchecker plugin
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'

" Copilot
Plug 'github/copilot.vim'

" ChatGPT
Plug 'robitx/gp.nvim'

call plug#end()

" Copilot mappings
imap <M-ä> <Plug>(copilot-next)
imap <M-ú> <Plug>(copilot-previous)
imap <C-l> <Plug>(copilot-dismiss)

" ChatGPT (gp.nvim Plugin)
let $OPENAI_API_KEY = 'TODO'

" gp.nvim mappings
" Check the bottom of file in the lua section for keymapping config

"inoremap <S-Down> <Esc>:m .+1<CR>==gi

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

" Fugitive gitlab config
let g:fugitive_gitlab_domains = ['https://gitlab.atteq.com']

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

call submode#enter_with('resize', 'n', '', '<C-W><Up>', '<C-W>+')
call submode#enter_with('resize', 'n', '', '<C-W><Down>', '<C-W>-')
call submode#enter_with('resize', 'n', '', '<C-W><Right>', '<C-W>>')
call submode#enter_with('resize', 'n', '', '<C-W><Left>', '<C-W><')

call submode#map('resize', 'n', '', '<Up>', '<C-W>+')
call submode#map('resize', 'n', '', '<Down>', '<C-W>-')
call submode#map('resize', 'n', '', '<Right>', '<C-W>>')
call submode#map('resize', 'n', '', '<Left>', '<C-W><')

" Disable submode timeouts
let g:submode_timeout = 0

" Do not consume submode-leaving key
let g:submode_keep_leaving_key = 1

" Show submode message
let g:submode_always_show_submode = 1

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
"nmap <leader>gc :call CocAction('runCommand', 'angular.goToComponentWithTemplateFile')<CR>
"nmap <leader>gt :call CocAction('runCommand', 'angular.goToTemplateForComponent')<CR>

" Quick file edits
nnoremap <silent> <leader>gc :edit %<.ts<CR>
nnoremap <silent> <leader>gt :edit %<.html<CR>
nnoremap <silent> <leader>gs :edit %<.scss<CR>

" git-time-lapse
nmap <Leader>gh <Plug>(git-time-lapse)

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

" Run build script
map <leader>g :!./scripts/build.sh<CR>

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>


" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" Show all available keymaps
nnoremap <leader>L :Telescope keymaps<CR>

" FILE SPECIFIC CONFIG "
""" Automatically reload .txt files when they change on disk
augroup auto_read
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold *.txt if getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost *.txt if getcmdwintype() == '' | echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None | endif
augroup END

""" TypeScript coding
autocmd FileType typescript set tabstop=2|set softtabstop=2|set expandtab|set shiftwidth=2

""" Python coding
set encoding=utf-8

au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

au FileType javascript,html,css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

""" Javascript coding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

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

" coc-css
autocmd FileType scss setl iskeyword+=@-@

" display filename in bottom bar at all times
" set statusline+=%t

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
let g:airline#extensions#branch#enabled = 0

" Buffer config
"map <C-W><C-Right> :bn<cr>
"map <C-W><C-Left> :bp<cr>
"map <C-W><C-d> :bd<cr>

call submode#enter_with('pr/ne', 'n', '', '<C-W><C-Left>', ':bp<CR>')
call submode#enter_with('pr/ne', 'n', '', '<C-W><C-Right>', ':bn<CR>')
call submode#enter_with('pr/ne', 'n', '', '<C-W><C-d>', ':bd<CR>')

call submode#map('pr/ne', 'n', '', '<C-Left>', ':bp<CR>')
call submode#map('pr/ne', 'n', '', '<C-Right>', ':bn<CR>')
call submode#map('pr/ne', 'n', '', '<C-d>', ':bd<CR>')

" Bufferline
set termguicolors
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("bufferline").setup()
require'lspconfig'.angularls.setup{}

require("modules")

require("gp").setup()

-- gp.nvim keymap config
local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end

-- Chat commands
vim.keymap.set({"n", "i"}, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({"n", "i"}, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({"n", "i"}, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

vim.keymap.set({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

-- Prompt commands
vim.keymap.set({"n", "i"}, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({"n", "i"}, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
vim.keymap.set({"n", "i"}, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))

vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))
vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))

vim.keymap.set({"n", "i"}, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
vim.keymap.set({"n", "i"}, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
vim.keymap.set({"n", "i"}, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
vim.keymap.set({"n", "i"}, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
vim.keymap.set({"n", "i"}, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))

vim.keymap.set("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
vim.keymap.set("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
vim.keymap.set("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
vim.keymap.set("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))

vim.keymap.set({"n", "i"}, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
vim.keymap.set("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))

vim.keymap.set({"n", "i", "v", "x"}, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
vim.keymap.set({"n", "i", "v", "x"}, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

-- optional Whisper commands with prefix <C-g>w
vim.keymap.set({"n", "i"}, "<C-g>ww", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
vim.keymap.set("v", "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions("Visual Whisper"))

vim.keymap.set({"n", "i"}, "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", keymapOptions("Whisper Inline Rewrite"))
vim.keymap.set({"n", "i"}, "<C-g>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions("Whisper Append (after)"))
vim.keymap.set({"n", "i"}, "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions("Whisper Prepend (before) "))

vim.keymap.set("v", "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions("Visual Whisper Rewrite"))
vim.keymap.set("v", "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions("Visual Whisper Append (after)"))
vim.keymap.set("v", "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions("Visual Whisper Prepend (before)"))

vim.keymap.set({"n", "i"}, "<C-g>wp", "<cmd>GpWhisperPopup<cr>", keymapOptions("Whisper Popup"))
vim.keymap.set({"n", "i"}, "<C-g>we", "<cmd>GpWhisperEnew<cr>", keymapOptions("Whisper Enew"))
vim.keymap.set({"n", "i"}, "<C-g>wn", "<cmd>GpWhisperNew<cr>", keymapOptions("Whisper New"))
vim.keymap.set({"n", "i"}, "<C-g>wv", "<cmd>GpWhisperVnew<cr>", keymapOptions("Whisper Vnew"))
vim.keymap.set({"n", "i"}, "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", keymapOptions("Whisper Tabnew"))

vim.keymap.set("v", "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", keymapOptions("Visual Whisper Popup"))
vim.keymap.set("v", "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", keymapOptions("Visual Whisper Enew"))
vim.keymap.set("v", "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", keymapOptions("Visual Whisper New"))
vim.keymap.set("v", "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions("Visual Whisper Vnew"))
vim.keymap.set("v", "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", keymapOptions("Visual Whisper Tabnew"))

EOF
