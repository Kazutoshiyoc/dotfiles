scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set noswapfile                    " スワップファイルは使わない

set number                        " 行番号を表示する
set cursorline                    " カーソルラインの表示
set ruler                         " カーソルが何行目の何列目に置かれているかを表示する
set title                         " ウインドウのタイトルバーにファイルのパス情報等を表示する
set showcmd                       " 入力中のコマンドを表示する

set showmatch                     " 対応する括弧やブレースを表示する
set list                          " 不可視文字を表示す
"set nowrap                        " 行を折り返さない
set scrolloff=5                   " スクロール時の行のマージン

set wildmenu                      " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする

set smartcase                     " 小文字のみで検索したときに大文字小文字を無視する
set incsearch                     " 検索ワードの最初の文字を入力した時点で検索を開始する
set hlsearch                      " 検索結果をハイライト表示する
set wrapscan

set tabstop=4                     " タブ文字の表示幅
"set expandtab                     " タブ入力を複数の空白入力に置き換える
set listchars=tab:>\ ,extends:<   " タブと行の続きを可視化する

set shiftwidth=4                  " Vimが挿入するインデントの幅
set autoindent                    " 改行時に前の行のインデントを継続する
"set smartindent                  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab                      " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

set backspace=2                   " backspaceを有効にする
set visualbell t_vb=              " ビープ音/ビジュアルベルを無効化

set timeoutlen=500                " mapの入力の待ち時間



" ==================================================================
" 入力補助
" ==================================================================

" 括弧補完
inoremap {} {}<Left>
inoremap { {}<Left>

inoremap {}<Enter> {};<Left><Left>
inoremap {<Enter> {<CR><Tab><End><CR><Backspace>}<Up><End>

inoremap (<Space> ()<Space><Left><Left>
inoremap () ()<Left>
inoremap ( ()<Left>

inoremap ()<Enter> ();<Left><Left>
inoremap (<Enter> ();<Left><Left>

inoremap [] []<Left>
inoremap [ []<Left>

" <S-tab>で予測候補入力
inoremap <S-tab> <C-n>

" <Insert>無効、iに置き換え
inoremap <Insert> <Esc>i

" Visual modeの開始（Windowsでの<C-v>(貼り付け)に対応）
nnoremap <A-v> <C-v>

" re-do
nnoremap r <C-r>

" 便利ショートカットの設定
nnoremap <F3> :%s///gc<Left><Left><Left><Left>

" ハイライトOFF
nnoremap <F4> :noh<CR>:echomsg ""<CR>

" ~/.vimrcの明示的な読み込み
nnoremap <C-F5> :source ~/.vimrc<CR>:noh<CR>:echomsg "reloaded .vimrc"<CR>

" 新規タブ
nnoremap <F12> :tabnew 
nnoremap <C-F12> :tabnew<CR>:Explore<CR>:echomsg "Please push the \<Enter\> on the file you want to open."<CR>

" <S-Home>で行頭にカーソル合わせ
inoremap <S-Home> <Esc>^<Insert>
nnoremap <S-Home> ^

" <C-Home><C-End>でタブの切り替え
nnoremap <C-Home> :tabNext<CR>
nnoremap <C-End> :tabnext<CR>

vnoremap <C-Home> <Esc>:tabNext<CR>
vnoremap <C-End> <Esc>:tabnext<CR>

inoremap <C-Home> <Esc>:tabNext<CR>
inoremap <C-End> <Esc>:tabnext<CR>

" <Shift>押しながらだと5倍スクロール<Control>押しながらだと20倍スクロール（<Up><Down>のみ）
nnoremap <S-Up> <Up><Up><Up><Up><Up>
inoremap <S-Up> <Up><Up><Up><Up><Up>
nnoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
inoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nnoremap <S-Down> <Down><Down><Down><Down><Down>
inoremap <S-Down> <Down><Down><Down><Down><Down>
nnoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
inoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
nnoremap <S-Right> <S-Right><S-Right><S-Right><S-Right><S-Right>
inoremap <S-Right> <S-Right><S-Right><S-Right><S-Right><S-Right>
nnoremap <S-Left> <S-Left><S-Left><S-Left><S-Left><S-Left>
inoremap <S-Left> <S-Left><S-Left><S-Left><S-Left><S-Left>

" <PageUp><PageDown>で画面スクロール
nnoremap <PageUp> <C-Y>
inoremap <PageUp> <Esc><C-Y>i
nnoremap <PageDown> <C-E>
inoremap <PageDown> <Esc><C-E>i


" ==================================================================
" マウスの動作設定
" ==================================================================
set mouse=a
nnoremap <ScrollWheelUp> <Up><Up><Up>
inoremap <ScrollWheelUp> <Up><Up><Up>
nnoremap <ScrollWheelDown> <Down><Down><Down>
inoremap <ScrollWheelDown> <Down><Down><Down>

" 左クリックで対象ワードを検索
nnoremap <LeftMouse> <Esc>
nnoremap <2-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <3-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <4-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <5-LeftMouse> <S-LeftMouse>N<Esc>

vnoremap <LeftMouse> <Esc>
vnoremap <2-LeftMouse> <S-LeftMouse>N<Esc>
vnoremap <3-LeftMouse> <S-LeftMouse>N<Esc>
vnoremap <4-LeftMouse> <S-LeftMouse>N<Esc>
vnoremap <5-LeftMouse> <S-LeftMouse>N<Esc>

inoremap <2-LeftMouse> <S-LeftMouse><Esc>N<Esc>i
inoremap <3-LeftMouse> <S-LeftMouse><Esc>N<Esc>i
inoremap <4-LeftMouse> <S-LeftMouse><Esc>N<Esc>i
inoremap <5-LeftMouse> <S-LeftMouse><Esc>N<Esc>i

" 右クリックは動作が変になるので無効化
nnoremap <RightMouse> <Esc>
nnoremap <2-RightMouse> <Esc>
nnoremap <3-RightMouse> <Esc>
nnoremap <4-RightMouse> <Esc>
nnoremap <5-RightMouse> <Esc>

vnoremap <RightMouse> <Esc>
vnoremap <2-RightMouse> <Esc>
vnoremap <3-RightMouse> <Esc>
vnoremap <4-RightMouse> <Esc>
vnoremap <5-RightMouse> <Esc>

inoremap <RightMouse> <Esc>
inoremap <2-RightMouse> <Esc>
inoremap <3-RightMouse> <Esc>
inoremap <4-RightMouse> <Esc>
inoremap <5-RightMouse> <Esc>


" ==================================================================
" シンタックスの設定
" ==================================================================
syntax on
highlight LineNr ctermfg=95
highlight CursorLineNr cterm=bold ctermfg=94
highlight CursorLine cterm=bold ctermbg=254
nnoremap <F1> :set cursorline!<CR>:echomsg ""<CR>
nnoremap <F2> :set cursorcolumn!<CR>:echomsg ""<CR>
inoremap <F1> <Esc>:set cursorline!<CR>:echomsg ""<CR>i
inoremap <F2> <Esc>:set cursorcolumn!<CR>:echomsg ""<CR>i

highlight Normal cterm=bold ctermfg=0
highlight Error term=reverse cterm=bold ctermfg=129 ctermbg=9 guifg=White guibg=Red
highlight Comment ctermfg=67
highlight SpecialKey ctermfg=252

highlight Include ctermfg=54
highlight Macro ctermfg=54
highlight PreCondit ctermfg=104

highlight String ctermfg=19
highlight SpecialChar ctermfg=25
highlight Constant ctermfg=125
highlight Number ctermfg=160

highlight Type ctermfg=34
highlight Conditional ctermfg=57
highlight Repeat ctermfg=57


" ==================================================================
" ヤンクした文字列をクリップボードと連携
" ==================================================================
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed           " Windows, Macの場合はプライマリ("*)と共有
else
  set clipboard=unnamedplus       " Linuxの場合はクリップボード（"+）と共有
endif
