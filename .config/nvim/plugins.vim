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
Plug 'majutsushi/tagbar'

" Language syntax parser
Plug 'nvim-treesitter/nvim-treesitter'

" rainbow parenthesis for ts tree
Plug 'p00f/nvim-ts-rainbow'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Airline
Plug 'vim-airline/vim-airline'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" Window swapper
Plug 'wesQ3/vim-windowswap'

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

" Vim smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" ------------- R ------------- "
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" ---------- JAVASCRIPT -----------"

Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'

" --------- APPLESCRIPT ----------- "

Plug 'dearrrfish/vim-applescript'

" ----------- JAVA -------------"
Plug 'vim-test/vim-test'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" ---------- MARKDOWN -----------"
Plug 'godlygeek/tabular'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'gabrielelana/vim-markdown'

Plug 'shime/vim-livedown'

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'lvht/tagbar-markdown'

" ---------- TEX -----------"

Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'

" ---------- COLORSCHEME -----------"

" Material colorscheme
Plug 'hzchirs/vim-material'

" Gruvbox material theme for airline
Plug 'sainnhe/gruvbox-material'

" Gruvbox 8 theme
Plug 'lifepillar/vim-gruvbox8'

" Add filetype icons to vim plugins (NERDTree)
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" ------------------ INACTIVE PLUGINS ----------------- "
" Plug 'Xuyuanp/scrollbar.nvim'
" Plug 'neomutt/neomutt.vim'
" Plug 'vim-scripts/YankRing.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'sheerun/vim-polyglot'
" Plug 'uiiaoo/java-syntax.vim'
"  Plug 'Quramy/tsuquyomi'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'idanarye/vim-vebugger'
" Plug 'brianclements/vim-lilypond'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'dense-analysis/ale'
call plug#end()
" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" MARKDOWN -----------------
let g:markdown_enable_insert_mode_mappings = 0

" TREESITTER -----------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    rainbow = {
        enable = true,
        disable = {'bash'}
    },
    highlight = {
        enable = true,
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
EOF

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
" Using the custom window creation function
let g:fzf_layout = {
  \ 'window': {
  \   'width': 0.95,
  \   'height': 0.95,
  \   'yoffset': 0.25,
  \ }
  \ }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
  \ 'fg': ['fg', 'Normal'],
  \ 'bg': ['bg', 'Normal'],
  \ 'hl': ['fg', 'Comment'],
  \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+': ['fg', 'Statement'],
  \ 'info': ['fg', 'PreProc'],
  \ 'border': ['fg', 'Ignore'],
  \ 'prompt': ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker': ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment'],
  \ }

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'
if executable('rg')
  " Overriding fzf.vim's default :Files command.
  " Pass zero or one args to Files command (which are then passed to FzfFiles). Support file path completion too.
  command! -nargs=? -complete=file Files call FzfFiles(<q-args>)

  " Ripgrep setting with preview window
  command! -nargs=* -bang Rg call FzfRg(<q-args>, <bang>0)

endif

let $BAT_CMD = 'bat --style=numbers,changes --color always'

function! FzfFiles(qargs) abort
  let s:file_options = '--preview "' . $BAT_CMD . ' {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

  function! s:files(dir)
    let l:cmd = 'rg --files --hidden --glob "!{.git,node_modules,vendor}" --smart-case'
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:extension = fnamemodify(l:candidate, ':e')
      let l:icon = GetWebDevIcons(l:filename, l:extension)
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor
    return l:result
  endfunction

  function! s:edit_file(lines)
    if len(a:lines) < 2 | return | endif
    let l:action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
    let l:cmd = get(l:action, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:pos = stridx(l:item, ' ')
      let l:file_path = l:item[pos+1:-1]
      execute 'silent '. l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run(fzf#wrap({
    \ 'source': <sid>files(a:qargs),
    \ 'sink*': function('s:edit_file'),
    \ 'options': '-m' . ' ' . s:file_options,
    \ }))
endfunction

function! FzfRg(query, fullscreen)
  let command_fmt = 'rg --color=always --column --line-number --no-heading --smart-case -- %s | cut -d ":" -f 1,2,3'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'right:60%'), a:fullscreen)
endfunction

" Nvim-web-devicons --------------------------
lua << EOF
require'nvim-web-devicons'.setup {
   override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "json"
     }
    };
  -- globally enable default icons (default to false)
  default = true;
}
EOF

function! GetWebDevIcons(filename, extension)
  let s:fn = luaeval("require'nvim-web-devicons'.get_icon")
  return s:fn(a:filename, a:extension)
endfunction


" Window Swap -------------------------------

let g:windowswap_map_keys = 0

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

" Airline -------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox8'
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

function! CompileAndRun()
 let l:cmd = {
 \ 'c' : "gcc % -o %<; time ./%<",
 \ 'sh' : "time bash %",
 \ 'go' : "go run %",
 \ 'cpp' : "g++ -std=c++11 % -o %<; time ./%<",
 \ 'ruby' : "time ruby %",
 \ 'r' : "Rscript %",
 \ 'java' : "javac %; time java %<",
 \ 'rust' : "rustc % -o %<; time ./%<",
 \ 'python' : "time python3 -i %",
 \ 'typescript' : "./node_modules/ts-node %",
 \ 'javascript' : "node %",
 \ 'javascript.jsx' : "yarn start",
 \ 'html' : "chromium %",
 \ 'lilypond' : "lilypond %",
 \}
 let l:ft = &filetype
 if has_key(l:cmd, l:ft)
   exec 'w'
   exec "AsyncRun -mode=term -pos=bottom ".l:cmd[l:ft]
   " exec "AsyncRun! ".l:cmd[l:ft]
 else
   echoerr "AsyncRun not supported in current filetype!"
 endif

endfunction
" indentLine -----------------------------

let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['tex', 'markdown']
let g:indentLine_setColors = 0
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

function ShowConcealed()
    set concealcursor=""
    set updatetime=500
    setlocal spell
    set spelllang=en_us
    hi! link Conceal Normal
endfunction

let s:enabled = 1

function! ToggleAutoLine()
    if s:enabled
        set fo=cqt
        let s:enabled = 0
    else
        set fo+=a
        let s:enabled = 1
    endif
endfunction

" ALE --------------------------------

" let g:ale_linters = {
            " \ 'python': ['flake8'],
            " \ 'sh' : ['shellcheck'],
            " \ 'cs' : ['Omnisharp'],
            " \}
"
" let g:ale_fixers = {
            " \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            " \ 'python': ['autopep8'],
            " \ 'html': ['prettier'],
            " \ 'css': ['prettier'],
            " \ 'cs': ['uncrustify'],
            " \}
" let g:ale_lint_on_text_changed = 1

" ULTI-SNIPS -----------------------------
let g:UltiSnipsSnippetDirectories=["UltiSnips", "personal"]

if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" VIM-JSX-TYPESCRIPT
let g:mta_filetypes = {
    \ 'typescript' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" Gruvbox 8 ----------------------------------

let g:gruvbox_transp_bg = 1

" Indent Guides -----------------------

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#cf8ef4   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#89ccf7 ctermbg=4

" NVIMR ------------------------------------

let R_auto_start = 2
