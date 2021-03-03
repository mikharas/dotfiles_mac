" Remap terminal exit
tnoremap <C-[> <C-\><C-n>

" adjust split screen size
noremap ¬ 8<C-W>>
noremap ˙ 8<C-W><
noremap ˚ 4<C-W>+
noremap ∆ 4<C-W>-


" move screen
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L
nnoremap <C-W>h <C-W>H
nnoremap <C-W>t <C-W>T

" tab navigation mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
inoremap <C-]> <C-X><C-O>
nnoremap <C-H> <C-W><C-H>

" Skip 5 lines at a time
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" write and delete all buffers except for current one
nnoremap <leader>bd :w \| %bd \| e#<CR>

" refreshes all buffers
nnoremap <leader>br :bufdo e<CR>

" map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>
map <M-Down> :tabclose<CR>

" window swap
nnoremap <silent> <leader>w : call WindowSwap#EasyWindowSwap()<CR>

" Toggle terminal on/off (neovim)
nnoremap <leader>r :call TermToggle(20)<CR>
tnoremap <leader>t <C-\><C-n>:call TermToggle(20)<CR>

" toggle tagbar display
map <leader>2 :TagbarToggle<CR>

" open nerdtree with the current file selected
nnoremap <leader>1 :NERDTreeFind<CR>

"run asyncrun
nnoremap gm :call CompileAndRun()<CR>

" mappings to jump to changed blocks for signify (git)
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

" change binding of folding (simpylfold)
nnoremap <space> za

" with spellcheck on, fix all spelling errors
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" file finder mapping
nmap <leader>l :Files<CR>

" general code finder in all files mapping
nmap <leader>F :Rg<CR>

" code finder in loaded buffers
nmap <leader>f :Lines<CR>

" search under the cursor
" nmap <leader>r :exec 'Rg' expand('<cword>')<CR>

" tags in all buffers
nmap <leader>G :Tags<CR>

" tags (symbols) in current file finder mapping
" nmap <leader>g :BTag<CR>

" list all files in buffer
nmap <leader>bb :Buffers<CR>

" commands finder mapping
nmap <leader>c :Commands<CR>

" fugitive shortcuts
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>gdf :G difftool
nmap <leader>gdd :Gdiff
nmap <leader>gb :Gblame %<CR>

function! s:markdownMappings()
    nmap <buffer> gm :LivedownToggle<CR>
    nmap <buffer> <localleader>tb :Tab/\|<CR>
    nmap <buffer> <localleader>mk :!pandoc % -o %:r.pdf --template=template.tex --pdf-engine=lualatex<CR>
endfunction

function! s:customNvimRMappings()
   nmap <buffer> <localleader>sr <Plug>RStart
   nmap <buffer> <localleader>cr <Plug>RSaveClose
   nmap <buffer> <localleader>sf <Plug>RSendFile
   nmap <buffer> <localleader>sc <Plug>RSendChunkFH
   vmap <buffer> <localleader>ss <Plug>RSendSelection
   nmap <buffer> gm <Plug>RMakeRmd
   nmap <buffer> <localleader>s <Plug>RSummary
endfunction

augroup markupLanguages
    au!
    autocmd filetype tex nmap <buffer> gm :VimtexCompile<CR>
    autocmd filetype tex,markdown,rmd nmap <localleader>j :call ShowConcealed()<CR>
    autocmd filetype tex,markdown,rmd nmap <buffer> <localleader>k :call ToggleAutoLine()<CR>
augroup end

augroup mappings
    au!
    autocmd filetype r,rmd call s:customNvimRMappings()
    autocmd filetype markdown,md call s:markdownMappings()
    autocmd filetype javascript,typescript,typescript.tsx nmap <buffer> <localleader>e :CocCommand eslint.executeAutofix<CR>
augroup end

" omnisharp
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>pd :OmniSharpPreviewDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>pi :OmniSharpPreviewImplementation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-'> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-;> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
    " autocmd FileType cs nnoremap <buffer> <Leader>e :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>e :Uncrustify<CR>
    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
augroup END
