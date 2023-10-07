
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"       Thanks to - @amix3k :https://github.com/amix/vimrc
"       online vim: https://vimmer.io/
"       online book: https://learnvimscriptthehardway.stevelosh.com/
" Inspiration {{{
" -----------
" Videos:
" - http://www.youtube.com/watch?v=aHm36-na4-4 
"
" Articles:
"
" - http://alexpounds.com/blog/2014/06/06/the-vimrc-antiques-roadshow
"
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"
" - https://vimways.org/2018/from-vimrc-to-vim/ - Good article on storing your
"   config in your .vim folder rather than putting everything in one massive
"   .vimrc
"
" - https://www.reddit.com/r/vim/wiki/vimrctips
"
" Notable RC files:
" - https://bitbucket.org/sjl/dotfiles/src/562b7094aad5c602c6228c1d89f69d0abb3bab6b/vim/vimrc?at=default&fileviewer=file-view-default 
" - https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"
" Note, you can use K within this file to open the relevant help page
" }}}
"
" Sections:
"    -> Help
"    -> Vital Commands
"    -> General
"    -> VIm searcing
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C:\Users\mohammadi\vimfiles/vimrc



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vital Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :h Notation
" crtl + ] , (ctrl+ o , ctrl + i), gf, ctrl+w+gf ,helpg: word1.*word2 ===> follow links
" docs ==> :h how-to | user-manual | quickref | :h  | vert help
" :E , :ter , ls , mks name.vim, so name.vim







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open this vimrc file in new tab when execute ':Vimrc'
command! Vimrc tabe C:\Users\mohammadi\vimfiles/vimrc " windows
" command! Vimrc tabe ~/.vimrc " linux

" Sets how many lines of history VIM has to remember. default is 50
set history=500

" Enable filetype plugins ==> this is good for syntax highlighting and set options
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" default leader is backslash in vim
let mapleader = ","


" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
    command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set mouse=a                " Enables use of mouse in all modes
set mousehide              " Hide mouse when typing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
" /ali will find ALI but not the other way around
set smartcase

" Highlight search results
set hlsearch

set synmaxcol=200   " Don't try to highlight long lines (for performance)

" Makes search act like search in modern browsers ==> highlight by typing
" for see dont use colon ==> :/word for search ==> just /word
set incsearch

" Disable highlight when <leader><cr> is pressed
" <cr> means carrage return: ENTER key
map <silent> <leader><cr> :noh<cr>

" For REGEX
" in nomagic you can write ^,$,\ for using Reg so you should useing a lot of backslashes
" for wrting regex patterns like \* or \d or etc
" but in magic mode you can use * without backslash
" vim also have Very magic mode by \v in this mode most of chars have special meaning
set magic

" Turn on the Wild menu ===> compandline compeletion on pressing wildchar usually <tab>
" opens a popup and allows you to use <Left> or <Right> to navigate through the completion lists.
set wildmenu

" Ignore compiled files ===> a list of file patterns that is ignored when expanding
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set scrolloff= 7=> 7 lines to the cursor - when moving vertically using j/k
" Minimal number of screen lines to keep above/bottom the cursor
set so=7

set title    " Set window title to filename

set number 
set relativenumber

" lightly highlight the current line on which the cursor is placed
" set cursorcolumn is annoying
set cursorline

"place a very helpful 'status-bar' at the bottom of the window
" Always show current position in bottom-left example: 17,10
set ruler

" Always show the status line
set laststatus=2

" Format the status line with showing path of files
" HasPaste is Helper function 
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act ===> before this command backsapce does nothing in insert mode
set backspace=eol,start,indent

" setting to make h and l wrap around the start and end of individual lines
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
" this option will buffer screen uodates instead of updating all the time
set lazyredraw


" brifely jump to the matching one and come back again
set showmatch
" set time for showmatch
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell          " Rather than beeps
set t_vb=
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark " effect when set synatx enable or set number ==> light | dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e   
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
" when os crashes swapfile will usefull
set swapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs so you can use backspace for deleting
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4  " number of spaces for auto-indent
set tabstop=4     " number of space for using tab

" Linebreak on 500 characters
set wrap "Wrap lines depend your screen and delete horizental scroll
set lbr " do not break words
set tw=500 " gggqG
" gggqG to apply the new text width to the whole buffer.
" gq means : reformat the text included in the motion



" if a given file type (perl, ruby, python, c, etc) has its own special auto-indentation rules, use them
filetype plugin indent on
 
" turn on auto-indenting (use this if you turn off option ':filetype plugin indent on')
" copy indent from current line when start a new line
":set ai
    
" make smart-indenting 'smarter' (use this if you turn off option ':filetype plugin indent on')
" works for c-like programs when start a new line
":set si


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" VisualSelection is Helper Function
" select a word in visual mode then press * or #
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Alt + j moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Smart way to move between windows
" use ctrl + j instead of ctrl+ w + j
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bclose is Helper Function
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
" tabonly is the oposite of :tab ba
" tabonly convert all tabs into buffers
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab (previos tab)
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The custom dict lives in ~/.vim/spell/
" set spell
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" the next two lines use the F5 key to toggle paste mode on/off
:nnoremap <F5> :set invpaste paste?<CR>
:set pastetoggle=<F5>








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        endif
        return ''
    endfunction
    
    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
    function! <SID>BufcloseCloseIt()
        let l:currentBufNum = bufnr("%")
        let l:alternateBufNum = bufnr("#")
    
        if buflisted(l:alternateBufNum)
            buffer #
        else
            bnext
        endif
    
        if bufnr("%") == l:currentBufNum
            new
        endif
    
        if buflisted(l:currentBufNum)
            execute("bdelete! ".l:currentBufNum)
        endif
    endfunction
    
    function! CmdLine(str)
        call feedkeys(":" . a:str)
    endfunction
    
    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"
    
        let l:pattern = escape(@", "\\/.*'$^~[]")
        let l:pattern = substitute(l:pattern, "\n$", "", "")
    
        if a:direction == 'gv'
            call CmdLine("Ack '" . l:pattern . "' " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        endif
    
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction