" David Lowry-Duda's .vimrc file configuration"
" :set foldlevel=1 for niceness
scriptencoding utf-8
set encoding=utf-8

" Vundle Startup {{{2 "
" Firstly, a few things for Vundle to automanage things
set nocompatible
filetype off                    " required for vundle!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
"Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'ervandew/supertab.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'noahfrederick/vim-noctu.git'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'luochen1990/rainbow'
"Plugin 'klen/python-mode'
Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete'
Plugin 'bling/vim-airline'
Plugin 'wellle/targets.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
" Plugin 'Raimondi/delimitMate'
" tabular is for vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'justinmk/vim-sneak'
Plugin 'l04m33/vlime', {'rtp': 'vim/'}

" vim-script
Plugin 'vim-scripts/TaskList.vim'

" In trial
Plugin 'mhinz/vim-startify'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'justmao945/vim-clang'

Plugin 'w0rp/ale'


call vundle#end()               " required
filetype plugin indent on       " required too!
"
" Brief help
" :PluginList           - list configured bundles
" :PluginInstall(!)     - install (update) bundles
" :PluginSearch(!) foo  - search(or refresh cache first) for foo
" :PluginClean(!)       - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}2

" General {{{2 "
set showcmd
set nu
set nocompatible
set autoindent
set mouse=a
"set hlsearch
set ruler
set title
set completeopt=menu,preview,longest
set tw=80
set wildmenu
set wildmode=list:longest
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set laststatus=2
" Make wordwraps occur on word
set lbr
set pastetoggle=<F3>
set undolevels=1000
set history=100
set autoread
set lazyredraw
set ttyfast
set backspace=start,indent,eol

set foldmethod=marker
set foldlevel=1
set foldopen+=insert

set nojoinspaces

"set showmatch
"set cursorline

" Keep 4 lines off edges when scrolling
set scrolloff=4

" Set up visible characters, but turn them off by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist

" Maintain undofiles
set undofile
set undodir=~/.vim/.undo,~/tmp,/tmp

set nobackup
set noswapfile

" These are default, but not on MAC (for whatever reason)
set modeline
set modelines=5


" Make arrowkey resize viewports
"nnoremap <Left> :vertical resize +1<CR>
"nnoremap <Right> :vertical resize -1<CR>
"nnoremap <Up> :resize +1<CR>
"nnoremap <Down> :resize -1<CR>

" Make arrow keys flip buffers
nnoremap <Left> :bp!<CR>
nnoremap <Right> :bn!<CR>

" Reasonable html tag indenting
let g:html_indent_inctags = "html,body,head,tbody"

" A few new movements: does overide the original
noremap j gj
noremap k gk
noremap H ^
noremap L $
noremap gj j
noremap gk k

noremap \ ,


" Automatically go inside delimiters if typed back to back
"inoremap () ()<ESC>i
"inoremap {} {}<ESC>i
"inoremap [] []<ESC>i
"inoremap <C-L> <C-O>a
"inoremap <C-H> <C-O>i

" Clear highlighting in normal mode
nnoremap <C-L> :noh<CR>:redr!<CR>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Set my leader key to , instead of \
let mapleader = ','
let maplocalleader = ','


" Make Y act like it should
nmap Y y$

" Highlight column 80 as warning and 120 as superdanger
" let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="80"
autocmd BufEnter *.html setlocal cc=

" Toggle Spell-check
nmap <silent> <leader>s :set spell!<CR>

" Skip to next and previous errors in quickreference list
nnoremap <leader>n :lne<cr>
nnoremap <leader>p :lp<cr>

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if $COLORTERM == 'xfce4-terminal'
    set t_Co=256
endif

syntax enable
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    if $COLORTERM == 'xfce4-terminal'
        colorscheme noctu
    else
        "let g:solarized_termcolors=256
        "set background=dark
        "colorscheme solarized
        colorscheme noctu
    endif
endif

" Two distinguished matchcolors for :match colorgroups
hi Match1 ctermbg=4 ctermfg=0
hi Match2 ctermbg=2 ctermfg=22
hi Match3 ctermbg=3 ctermfg=0

autocmd CursorMoved * exe printf('match WordUnder /\V\<%s\>/', escape(expand('<cword>'), '/\'))
highlight WordUnder ctermfg=8
"WordUnder actually gets clobbered by my colorscheme

autocmd ColorScheme *
      \ highlight WordUnder ctermfg=7 ctermbg=23 guifg='LightCyan' |
      \ hi Match1 ctermbg=4 ctermfg=0  |
      \ hi Match2 ctermbg=2 ctermfg=22 |
      \ hi Match3 ctermbg=3 ctermfg=0

" Add trailing whitespace deliberately on mailfiles.
augroup mutt_mail
  autocmd!
  " One could add the w format option if one wants to use mutt's 'text_flowed'
  " option to automatically reflow text appropriately. Or one can hardwrap.
  autocmd BufNewFile,BufRead *.mail setlocal ft=mail
  autocmd FileType mail setlocal formatoptions+=watqc
  autocmd FileType mail setlocal tw=72
  " autocmd FileType mail HideBadWhitespace
augroup END

" Automatically uses plugins, and enables auto indentation
filetype plugin indent on
"}}}2

" Limelight Settings {{{2 "
let g:limelight_conceal_ctermfg = "gray"
let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1
" how many paragraphs to color on each side
let g:limelight_paragraph_span = 0
nnoremap ,G :Goyo 100<CR>
nnoremap ,L :Limelight!!<CR>
"}}}2

" SuperTab Settings {{{2 "
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0
"}}}2

" Markdown Settings {{{2 "
" relevant plugin is vim-markdown
autocmd Filetype mkd setlocal ft=markdown
autocmd BufNewFile,BufRead *.note setlocal ft=markdown
highlight mkdListItem ctermbg=1
let g:vim_markdown_new_list_item_indent = 2
"}}}2

" Ultisnips Settings {{{2 "
" TODO This has to change - but default ruins SuperTab
let g:UltiSnipsExpandTrigger='<leader>E'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
"let g:UltiSnipsJumpForwardTrigger='<NUL>'
"map <expr><c-j> UltiSnips#ExpandSnippetOrJump()
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" }}}2

" vim-latex aka latex-suite Settings {{{2 "
" maps <C-space> to IMAP_JumpForward, which is usually <C-j>.
" imap <NUL> <Plug>IMAP_JumpForward
" remember that this might not work in terminals (but should in gui)
" DEPRECATED --- ONLY FOR USE WITH LATEX-SUITE
"nmap <c-space> <Plug>IMAP_JumpForward
"imap <c-space> <Plug>IMAP_JumpForward
"vmap <c-space> <Plug>IMAP_JumpForward
"nmap <NUL> <Plug>IMAP_JumpForward
"imap <NUL> <Plug>IMAP_JumpForward
"vmap <NUL> <Plug>IMAP_JumpForward

" Compile to pdf
"let g:Tex_DefaultTargetFormat="pdf"

" grep will sometimes skip displaying file name if you
" search in a single file, confusing vim-latex. Set grep to always generate
" file-name.
"set grepprg=grep\ -nH\ $*

" Set filetype of empty .tex files to 'tex' instead of 'plaintex', which is
" the default
let g:tex_flavor='latex'

" Reset leader2 away from ',' which is my actual leader. In other words,
" banish visual three letter things to hell, because they're not useful.
"let g:Tex_Leader2 = ''

" }}}2

" HTML Settings {{{2 "
autocmd Filetype html setlocal tabstop=2|set shiftwidth=2|set softtabstop=2

" }}}2

" LaTeX Settings {{{2 "
autocmd Filetype tex setlocal tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd Filetype tex setlocal colorcolumn=""
autocmd Filetype tex hi Search ctermfg=3 ctermbg=0

let g:vimtex_fold_enabled = 1
let g:vimtex_imaps_enabled = 0
let g:vimtex_indent_enabled = 0
let g:vimtex_indent_bib_enabled = 0

" }}}2

" Sage Settings {{{2 "
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
" autocmd Filetype python set makeprg=sage\ -b\ &&\ sage\ -t\ %

let g:SimpylFold_docstring_preview = 1
" }}}2

" ALE Settings {{{2
let g:ale_enabled=1
let g:ale_lint_on_text_changed=0
let g:ale_cpp_gcc_options = '--std=c++14 -Wall -Wextra -pedantic'
let g:ale_cpp_clangcheck_options='-Wall -std=c++14'

" }}}

" airline Settings {{{2 "
"set laststatus=2 is always good to ensure
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" Don't show git branch
let g:airline_section_b = ''

" Replace file encoding and file format info with file position
"let g:airline_section_y = '[TYPE=%Y] [Format=%{&ff}] [ASCII=%03.3b] [HEX=%02.2B] [R%04l,C%04v] [LEN=%L]'

" Don't show default position
"let g:airline_section_z = ''
"let g:airline_section_x = ''

"let g:airline_theme=solarized
"let g:airline_exclude_preview = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'

"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.linenr = '¶'
" }}}2

" NerdTree Settings {{{2 "
" Add a toggle, to a lousy key now, though
map <Leader>a <plug>NERDTreeTabsToggle<CR>
" Make it so that NERDTree plays nicely with Startify on startup

"autocmd VimEnter *
"            \ if !argc() |
"            \   Startify |
"            \   NERDTree |
"            \   execute "normal \<c-w>w" |
"            \ endif

" }}}2

" TaskList Settings {{{2 "
" Remap <Leader>t to <Leader><Leader>t, removing conflict with EasyMotion
map <Leader><Leader>t <Plug>TaskList
" }}}2

" Rainbow Parens Settings {{{2 "
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

"let g:rainbow_active = 1
"let g:rainbow_conf = {
"\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"\   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
"\   'operators': '_,_',
"\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
"\   'separately': {
"\       '*': {},
"\       'lisp': {
"\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
"\           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
"\       },
"\       'html': {
"\           'parentheses': [['(',')'], ['\[','\]'], ['{','}'], ['<\a[^>]*[^/]>\|<\a>','</[^>]*>']],
"\       },
"\       'tex': {
"\           'operators': '',
"\           'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
"\       },
"\   }
"\}

let g:rainbow_active = 1
" GUI usually can use any color, so we devide a color circle into parts:
" 5-based circle, use order: 24130(mod 5); for 6-based, use 241-530(mod 6)
" A standard color wheel or rainbow can be obtained via: (3: RGB)
" R 255, G 0->255, B 0; #FF0000->#FF4000->#FF8000->#FFC000->
" R 255->0, G 255, B 0; #FFFF00->#C0FF00->#80FF00->#40FF00->
" R 0, G 255, B 0->255; #00FF00->#00FF40->#00FF80->#00FFC0->
" R 0, G 255->0, B 255; #00FFFF->#00C0FF->#0080FF->#0040FF->
" R 0->255, G 0, B 255; #0000FF->#4000FF->#8000FF->#C000FF->
" R 255, G 0, B 255->0; #FF00FF->#FF00C0->#FF0080->#FF0040->
" I'll use the Munsell color wheel (5-based):
" #F0EA00, #B1D700, #00CA24, #00A877, #EE3338, #F26C36, #F89734, #FFC32D,
" #00A78A, #00A59C, #00A3AC, #0093AF, #FFF215, #CCDC3C, #90C84B, #47B754,
" #0082B2, #006EBD, #7D00F8, #9F00C5, #00A85A, #008F71, #007683, #2A5D8F,
" #B900A6, #D00081, #E20064, #F2003C, #3F4096, #6D3D94, #953993, #BE3291,
" #F85900, #F28800, #F2AB00, #EFCC00, #ED2790, #ED2B78, #EE2F62, #EE324C,
" cterm colors: DarkRed, Brown, DarkGreen, DarkCyan, DarkBlue, DarkMagenta;
" (Black Gray) Red, Yellow, Green, Cyan, Blue, Magenta; (DarkGray, White)
let munsell5 = ['#00EA42', '#E700F8', '#FECC00', '#00A3EA', '#E20064']
let basic5 = ['DarkCyan','DarkMagenta','DarkGreen','DarkBlue','DarkRed']
let enpairs = [ ['(',')'], ['\[','\]'], ['{','}'], ]
scriptencoding utf-8 " For utf8 characters.
let zhpairs = [['（','）'],['【','】'],['“','”'],['‘','’'],['《','》'],]
scriptencoding
let separators = ',\|;'
let operators = '&&\|||\|==\|!=\|>=\|<='
let xhtml_ignore = '\<script\>\|\<style\>' " prevent highlight errors
let html_ignore = xhtml_ignore.'\|\<area\>\|\<base\>\|\<br\>\|\<col\>\|\<embed\>\|\<hr\>\|\<img\>\|\<input\>\|\<link\>\|\<meta\>\|\<param\>\|\<source\>'
let tex_ignore = '\<equation\>\|\<eqnarray\>\|\<multline\>\|\<split\>\|\<gather\>\|\<align\>\|\<verbatim\>'

let g:rainbow_conf = {
\ 'guifgs': munsell5,
\ 'ctermfgs': basic5,
\ 'operators': '_'.separators.'\|'.operators.'_',
\ 'parentheses': zhpairs + enpairs,
\ 'separately': { '*': {}, }
\ }

let g:rainbow_conf.separately['xml'] = {
\ 'parentheses': [
\ ['<\z(\a\w*\)\%(\_s*\| \_[^>]*\%(\/\)\@1<!\)>', '</\z1>'],
\ ] + enpairs,
\ }

let g:rainbow_conf.separately['xhtml'] = {
\ 'parentheses': [
\ [ '<\z(\%('.xhtml_ignore.'\)\@!\a\w*\)\%(\_s*\| \_[^>]*\%(\/\)\@1<!\)>',
\ '</\z1>'
\ ],
\ ] + enpairs,
\ }

let g:rainbow_conf.separately['html'] = {
\ 'parentheses': [
\ [ '<\z(\%('.html_ignore.'\)\@!\a\w*\)\%(\_s*\| \_[^>]*\%(\/\)\@1<!\)>',
\ '</\z1>'
\ ],
\ ] + enpairs,
\ }

let g:rainbow_conf.separately['vim'] = {
\ 'parentheses': [
\ ['\<fu\%[nction][!]\{,1}\ze\s\+.*)', '\<endf\%[unction]\>'],
\ ['\<for\>', '\<endfo\%[r]\>'],
\ ['\<wh\%[ile]\>', '\<endw\%[hile]\>'],
\ ['\<if\>', '_\<elsei\%[f]\>\|\<el\%[se]\>_', '\<en\%[dif]\>'],
\ ['\<try\>', '_\<cat\%[ch]\>\|\<fina\%[lly]\>_', '\<endt\%[ry]\>'],
\ ] + enpairs,
\ }

let g:rainbow_conf.separately['tex'] = {
\ 'parentheses': [
\ [ '\\begin{\z(\%('.tex_ignore.'\)\@![^}]*\)}',
\ '_\\item\|\\bibitem_',
\ '\\end{\z1}'
\ ],
\ ['\\left\\\{,1}.','\\right\\\{,1}.'],
\ ['\\langle', '\\rangle'],
\ ] + enpairs + zhpairs,
\ }
" }}}2

" pymode Settings {{{2 "
" Disable pymode autocheck - use syntastic instead
let g:pymode_lint_write = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
" Banish pymode rope to hell, necessary for unknown reasons
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" Banish breakpoints to hell for interrupting easymotion
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader><leader><leader>b'
" Autofolding?
let g:pymode_folding = 1

" }}}2

" EasyMotion Settings {{{2 "
" Set up two-character bidirectional sneak
"nmap s <Plug>(easymotion-s2)
"xmap s <Plug>(easymotion-s2)
"omap z <Plug>(easymotion-s2)

" And repeat vim-sneak style
"nmap <Leader>; <Plug>(easymotion-next)
"nmap <Leader>, <Plug>(easymotion-prev)

" Remap default leader to <Leader> instead of <Leader><Leader>
"let g:EasyMotion_leader_key = '<Leader>'
" }}}2
"
" neocomplete Settings {{{2 "
" Use neocomplete
let g:neocomplete#enable_at_startup=1
" Use smartcase
let g:neocomplete#enable_smart_case=1
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_auto_select=0
let g:neocomplete#max_list=30

" I don't fully understand how this works, but omni is necessary for preview
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" Make the preview window appear at bottom
" set splitbelow

inoremap <expr><c-g> neocomplete#undo_completion()
inoremap <expr><c-e> neocomplete#cancel_popup()

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#usages_command = '<leader>k'
" Maybe useful to make compatible with jedi, to prevent double offers
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
" Consider setting up a dictionary?

" Toggle neocomplete
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>NC :call ToggleNeoComplete()<CR>

" Generic omni completion
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" }}}2

" syntastic settings {{{2 "
let g:syntastic_check_on_open=1
let g:syntastic_loc_list_height=5
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_python_flake8_post_args='--ignore=E501'

let g:syntastic_text_checkers = ['language-check']
let g:syntastic_text_language_check_args = '--language=en-US'

let g:syntastic_tex_chktex_post_args='-n3'

let g:syntastic_mode_map = {"passive_filetypes": ["python"]}

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'
" }}}2

" ctrlp settings {{{2
let g:ctrlp_extensions = ['dir', 'line']

" }}}2

" delimitMate Settings {{{2 "
"let loaded_delimitMate=1
""let delimitMate_autoclose=0
""let delimitMate_expand_space=1

"au FileType tex unlet loaded_delimitMate
"au FileType tex let b:delimitMate_autoclose=0

""inoremap <C-J> <C-r>=delimitMate#JumpAny()<CR>
"
" au FileType python,text,markdown,html,css,c inoremap <NUL> @<C-r>=delimitMate#JumpAny()<CR>
" inoremap <NUL> <C-r>=delimitMate#JumpAny()<CR>

""au FileType html,css let delimitMate_autoclose=1
""au FileType html,css let b:delimitMate_expand_space=1
""au FileType html,css let b:delimitMate_expand_cr=1

""let delimitMate_quotes = ""
" }}}2

" Startify settings {{{2 "
hi StartifyHeader ctermfg=76
let g:startify_custom_header = [
    \ '/\::/\:\///_/ /_//:\:\:\     David Lowry-Duda    \  \/\\\/+/\  /\  /   /   /+/',
    \ '\/::\ \:/__  __ /:\:\:\:\_________________________\ ///\\\/  \/  \/___/___/ /_',
    \ '::/\:\///_/ /_//:\:\:\:\/_David.j.lowry@gmail.com_////::\\\  /\  /   /   /+/',
    \ '::\ \:/__  __ /:\:\:\:\/_________________________/:\/____\\\/  \/___/___/ /___',
    \ '/\:\///_/ /_//:\:\:\:\/_________________________/:::\    /\/\  /   /   /+/   /',
    \ '\ \:/__  __ /:\:\:\:\/_________________________/:::::\  ///  \/___/___/ /___/_',
    \ ':\///_/ /_//:\:\:\:\/_________________________/:\:::::\///\  /   /  __________',
    \ '',
    \]
let g:startify_bookmarks = [ '~/Dropbox/TODO.markdown', '~/.vimrc']

let g:startify_list_order = [
      \ ['   Bookmarks <("<)'],
      \ 'bookmarks',
      \ ['   Recently Updated Files (>")>'],
      \ 'files',
      \ ['   Sessions'],
      \ 'sessions',
      \ ['   Files in this directory <(")> '],
      \ 'dir',
      \ ]

"}}}2

" vimtex settings {{{2 "
let g:vimtex_fold_manual=1
autocmd Filetype tex setlocal indentexpr=
" }}}2

" vim-clang settings {{{2
let g:clang_auto=0
let g:clang_cpp_optinos='=std=c++14'


" }}}2


" handy functions
"
function! FastTexToggle()
  if g:vimtex_quickfix_mode
    let g:vimtex_quickfix_mode = 0
    nnoremap ,A :VimtexCompileSS<CR>
    execute "ALEDisable"
  else
    let g:vimtex_quickfix_mode = 2
    nunmap ,A
    execute "ALEEnable"
  endif
endfunction

set showcmd
