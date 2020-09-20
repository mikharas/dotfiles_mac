let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better fileviewer
Plug 'scrooloose/nerdtree'

" Git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Startify
Plug 'mhinz/vim-startify'

" Class/module browser
Plug 'majutsushi/tagbar', { 'for': ['python', 'cs'] }

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Gruvbox theme for airline
Plug 'morhetz/gruvbox'

" Gruvbox 8 theme
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Narrow range
Plug 'chrisbra/NrrwRgn'

" Rainbow-parentheses
" Plug 'frazrepo/vim-rainbow'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'junegunn/rainbow_parentheses.vim'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'

" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Intellisense engine with full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Surround and repeat
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" TODO is there a better option for neovim?

" Window chooser
Plug 't9md/vim-choosewin'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Code snippets for productivity
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" Window swapper
Plug 'wesQ3/vim-windowswap'

" Syntax highlighting for neomutt
Plug 'neomutt/neomutt.vim'

" Folding
Plug 'tmhedberg/simpylfold'

" Asyncrun
Plug 'skywind3000/asyncrun.vim'

" Relative line numbers
Plug 'myusuf3/numbers.vim'

" Indent line
Plug 'yggdroot/indentLine'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Text objects
Plug 'b4winckler/vim-angry'

" Highlight other uses of word
Plug 'RRethy/vim-illuminate'

" HTML

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Generate html in a simple way
Plug 'mattn/emmet-vim'

" Bracey
Plug 'turbio/bracey.vim'
" Plug 'jaxbot/browserlink.vim'

" Color wheel
Plug 'KabbAmine/vCoolor.vim'

" Vim smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

"------------ PYTHON --------------"
" Python Syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Better language packs
Plug 'sheerun/vim-polyglot'

" ---------- JAVASCRIPT -----------"

" Plug 'neoclide/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" ----------- JAVA -------------"
Plug 'uiiaoo/java-syntax.vim'

"  Plug 'Quramy/tsuquyomi'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" DEBUGGER
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'

" LILYPOND
Plug 'brianclements/vim-lilypond'

" ---------- MARKDOWN -----------"
Plug 'godlygeek/tabular'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'gabrielelana/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'lvht/tagbar-markdown'


" ---------- TEX -----------"

Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'

" ----------- CSHARP --------------- "

Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'dense-analysis/ale'

" ---------- COLORSCHEMES -----------"

" Colorscheme Masterlist
Plug 'flazz/vim-colorschemes'

Plug 'sainnhe/gruvbox-material'
" Gruvbox Colorscheme
Plug 'morhetz/gruvbox'

Plug 'xero/nord-vim-mod'

Plug 'hzchirs/vim-material'

" vim-devicons
Plug 'ryanoasis/vim-devicons'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()
" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" JSDOC
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions	= 1
let g:jsdoc_enable_es6 = 1

" Emmett ----------------------------

let g:user_emmet_leader_key=',,'

" Tagbar -----------------------------

set tags+=tags;

let g:tagbar_type_html = {
\ 'ctagstype' : 'html',
\ 'kinds' : [
\ 'i:identifiers',
\ 'c:classes',
\ ],
\ }

" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_map_closefold = '0'

" Debugger -----------------------------

let g:vebugger_leader = '\'

" NERDTree -----------------------------

" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.class$', '\.o$']

" no more ? for help
let NERDTreeMinimalUI=1

" nerdtree starts when file opens
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close nerdtree if only it remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDCommenter ---------------------------
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Fzf ------------------------------

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

" open the new window, floating, and enter to it
call nvim_open_win(buf, v:true, opts)
endfunction

func! Test(a)
    echom "cword: "."\"".a:a."\""
endfunction

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)

" Ripgrep setting with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --no-heading --fixed-strings --line-number --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:60%'),
  \   <bang>0)

" Window Swap -------------------------------

let g:windowswap_map_keys = 0

" Window Chooser ------------------------------

" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

" Airline -------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#whitespace#enabled = 1

" enable/disable ale integration
let g:airline#extensions#ale#enabled = 1
" ale error_symbol
let airline#extensions#ale#error_symbol = 'E:'
" ale warning
let airline#extensions#ale#warning_symbol = 'W:'
" ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1
" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = '(L'
" ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"

" Asyncrun ---------------------------“

augroup spacevimAsyncRun
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(9, 1)
augroup END

" indentLine -----------------------------

let g:indentLine_enabled = 1
" let g:indentLine_setColors = 0
let g:indentLine_char = '║'

" VIMTEX -----------------------------------

let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '.build',
    \}

" Markdown -------------------------------
let g:mkdp_browser = ''
let g:markdown_mapping_switch_status = '<leader>s'

" ALE --------------------------------

let g:ale_linters = {
            \ 'python': ['flake8'],
            \ 'sh' : ['shellcheck'],
            \ 'cs' : ['Omnisharp'],
            \}

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ 'cs': ['uncrustify'],
            \}
let g:ale_lint_on_text_changed = 1

" ULTI-SNIPS -----------------------------
if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

" VIM-JSX-TYPESCRIPT
let g:mta_filetypes = {
    \ 'typescript' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

function TypescriptHighlights()
    hi typescriptDotNotation guifg=#d05964
    hi typescriptFuncCallArg guifg=#ebcb8b
    hi typescriptVariable guifg=#d05964
endfunction

autocmd FileType typescript.tsx call TypescriptHighlights()

" Pymode ------------------------------
" turn off warnings
let g:pymode_warnings = 0
let g:pymode_lint = 0

" Rainbow Parentheses ----------------------
" active by default
let g:rainbow_active = 1

" OMNISHARP --------------------------
let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_path = '/Users/snowpipe/omnisharp-linux-x64/run'

" SEMSHI --------------------------

function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ed8824
    hi semshiGlobal          ctermfg=214 guifg=#c6aa69
    hi semshiImported        ctermfg=214 guifg=#ed8824 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#6f8d7a
    hi semshiParameterUnused ctermfg=117 guifg=#b84138 cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#939c69
    hi semshiBuiltin         ctermfg=207 guifg=#448487
    hi semshiAttribute       ctermfg=49  guifg=#76968b
    hi semshiSelf            ctermfg=249 guifg=#ed8824
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
endfunction
autocmd FileType python call MyCustomHighlights()

" Gruvbox 8 ----------------------------------

let g:gruvbox_transp_bg = 1

" Ultisnippets/Vim-snippets ----------------------

let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal"]
