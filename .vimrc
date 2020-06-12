" ================ THIS IS THE VIMRC CONF FILE ========================
let $PYTHONPATH='/usr/lib/python3.7/site-packages'
if !has('nvim')
    set nocompatible
    " First start pathogen
    execute pathogen#infect()
    set ttymouse=xterm2


    let g:ycm_min_num_of_chars_for_completion = 1
    let g:ycm_python_binary_path = 'python'
    let g:ycm_auto_trigger = 1
    let g:ycm_key_invoke_completion = '<C-space>'

    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key='<C-Z>'
    let g:user_emmet_mode='a'    "enable all function in all mode.
    "Disable event-handler attributes support:
    let g:html5_event_handler_attributes_complete = 0
    "Disable RDFa attributes support:
    let g:html5_rdfa_attributes_complete = 0
    "Disable microdata attributes support:
    let g:html5_microdata_attributes_complete = 0
    "Disable WAI-ARIA attribute support:
    let g:html5_aria_attributes_complete = 0

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    " Disable auto popup, use <Tab> to autocomplete
    let g:clang_complete_auto = 0
    " Show clang errors in the quickfix window
    let g:clang_complete_copen = 1
    " ================ Syntastic ========================
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
    let g:ycm_confirm_extra_conf = 0
    nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
    set background=dark
    colo badwolf
    " make the gutters darker than the background.
    let g:badwolf_darkgutter = 1
    " Make the tab line lighter than the background.
    let g:badwolf_tabline = 2
    " Turn off HTML link underlining
    let g:badwolf_html_link_underline = 1
    " Turn on CSS properties highlighting
    let g:badwolf_css_props_highlight = 1

    set cursorline
else

endif

syntax on
let mapleader = ","

set clipboard=unnamedplus
filetype plugin indent on
set rnu
set ruler
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>n :next<cr>
nnoremap <leader>p :previous<cr>
nnoremap <c-d> yyp
" ================ Abbrevation ========================
iabbrev @@ ascherm97@gmail.com
iabbrev mnc Michel Jordan Valencia Rangel

set laststatus=2
set showtabline=2

" ================ Scrolling ========================
"
set scrolloff=8        "Start scrolling when we're 8 lines away from margins
set sidescrolloff=8
set sidescroll=5
"
" ================ Utilities ========================
" Move the current line down
nmap <leader>- ddp
" Move the current line up
nmap <leader>= dd2kp
" Toggle case of the word
imap <c-u> <esc>viw~wi
nmap <leader><c-u> viw~
" Surround word in doble quotes
nnoremap <leader>' viw<esc>a"<esc>hbi"<esc>lel
" Move better in normal mode
nnoremap L $
nnoremap H ^
nnoremap j gj
nnoremap k gk
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

set rtp+=/usr/bin/fzf

" ================ Better Look and Feel ========================
set whichwrap=b,s,<,>,[,]
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
highlight ExtraWhitespace ctermbg=192
nnoremap <F12> :ToggleWhitespace<CR>



""""""""""""""""""""" better searching""""""
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>


"""" Folding
set foldenable
set foldlevelstart=5
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent


" Don't ever use arrow keys

map <up> <nop>
map <right> <nop>
map <down> <nop>
map <left> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" Rezize panes

set winheight=30
set winminheight=5
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" better movement throuut splits
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" fixing some warp movement issues
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
    endif
endfunction


" For not messing up the indentation of pasted code
set pastetoggle=<F3>


map <leader><F2> :echo 'Current time is ' . strftime('%c')<CR>

" Switch nu and rnu in normal and insert mode

function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType html,css EmmetInstall
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd FocusLost * call ToggleRelativeOn()
    autocmd FocusGained * call ToggleRelativeOn()
    autocmd InsertEnter * call ToggleRelativeOn()
    autocmd InsertLeave * call ToggleRelativeOn()
    autocmd BufWritePre,BufRead *.html,*.c,*.cpp,*.java :normal gg=G
    autocmd BufWritePre * StripWhitespace
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    au FileType mail let b:delimitMate_autoclose = 0
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END


