set nocompatible                 " vi互換モードの無効化

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set noswapfile                    " スワップファイルは使わない

set number                        " 行番号を表示する

set cursorline                    " カーソルラインの表示
let g:cursor_line_flag = 1
"set cursorcolumn                  " カーソルカラムの表示
let g:cursor_column_flag = 0

set laststatus=2                  " ステータスラインの表示
set showtabline=2                 " タブラインの表示
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

set diffopt=filler,context:10000  " difftoolでの表示行数の指定



" ==================================================================
" 汎用関数
" ==================================================================
" Error messageの表示
function! ErrorMessage(err)
    echohl ErrorMsg | echo a:err | echohl None
endfunction

" Separation
function! Separate(symbol, symbol_num)
	let l:symbol_line = ''
	for i in range(1,a:symbol_num)
		let l:symbol_line .= a:symbol
	endfor
	echo l:symbol_line
endfunction

" レジスタをクリアする関数
function! ClearRegs()
	let l:regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
	for r in l:regs
		call setreg(r, [])
	endfor
endfunction

" 任意のレジスタをクリアする関数
function! ClearReg(reg)
	call setreg(a:reg, [])
endfunction

" 現在のカーソル位置を記録
function! RecordCursorPos()
	let t:pos = getpos('.')
endfunction

" Reload message
function! ReloadMessage(message)
	echo '🌀: '.a:message
endfunction

" Toggle message
let g:noflag = 0
let g:targetNo_cursor_line   = 1
let g:targetNo_cursor_column = 2
let g:targetNo_color_mode    = 3
let g:targetNo_contrast_mode = 4
function! ToggleMessage(message, target, flag)

	if a:target <= 2

		if a:flag == 0
			echo '🐍 '.a:message.' ON'

			" フラグ変更
			if a:target == g:targetNo_cursor_line
				let g:cursor_line_flag = 1
			elseif a:target == g:targetNo_cursor_column
				let g:cursor_column_flag = 1
			endif

		elseif a:flag == 1
			echo '🐍 '.a:message.' OFF'

			" フラグ変更
			if a:target == g:targetNo_cursor_line
				let g:cursor_line_flag = 0
			elseif a:target == g:targetNo_cursor_column
				let g:cursor_column_flag = 0
			endif

		endif

	elseif a:target == 3
		echo '🐬: set '.a:message.' mode'

	elseif a:target == 4
		echo '🐬: set '.a:message.' contrast mode'

	endif

endfunction


" ==================================================================
" 特殊関数
" ==================================================================
" 指定の位置に存在するvimgrepの結果まで移動
function! VimGrepMovePos(pos)
	" 現在のカーソル位置を取得
	let l:vimgrep_pos = getpos(".")

	" カーソル位置とa:posが一致するまでcnext
	while l:vimgrep_pos[1] < a:pos[1]
		cnext
		let l:vimgrep_pos = getpos('.')
	endwhile

	" カーソル位置を指定位置に移動
	call setpos('.', a:pos)
endfunction


" ==================================================================
"   🦆 🦆   🦆    🦆 🦆   🦆   🦢    🦆     🦆 🦆
" ==================================================================
function! DuckSwim(duck_max, duck_space_max, swan_rate)

	" 1~duck_maxの乱数で🦆数を決定
	let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
	let l:duck_num = reltimestr(reltime())[l:match_end : ] % (a:duck_max -1 + 1) + 1

	" 🦆行列の取得
	let l:duck_line = ''
	while l:duck_num > 0

		" 0~duck_space_maxの乱数で🦆間隔を決定
		let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
		let l:duck_space_num = reltimestr(reltime())[l:match_end : ] % (a:duck_space_max + 1)

		" 🦆間隔の挿入
		let l:duck_space = ''
		for i in range(0,l:duck_space_num)
			let l:duck_space .= ' '
		endfor
		let l:duck_line .= l:duck_space . '🦆'

		" 🦆数のデクリメント
		let l:duck_num -= 1

		" swan_rateに応じて🦢が入る
		let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
		let l:swan_flag = reltimestr(reltime())[l:match_end : ] % (a:duck_space_max + 1)
		if l:swan_flag < a:duck_space_max * a:swan_rate
			" 🦢間隔の決定
			let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
			let l:swan_space_num = reltimestr(reltime())[l:match_end : ] % (a:duck_space_max + 1)

			" 🦢間隔の挿入
			let l:swan_space = ''
			for i in range(0,l:swan_space_num)
				let l:swan_space .= ' '
			endfor
			let l:duck_line .= l:swan_space . '🦢'
		endif

		" 最終🦆後の間隔
		let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
		let l:duck_space_num = reltimestr(reltime())[l:match_end : ] % (a:duck_space_max + 1)
		let l:duck_space = ''
		for i in range(0,l:duck_space_num)
			let l:duck_space .= ' '
		endfor
		let l:duck_line .= l:duck_space

	endwhile

	" 🦆行列の出力
	call DrawDuck(l:duck_line)

endfunction

" DrawDuck🦆関数
function! DrawDuck(duck)
	call s:setHighlight("DuckSwim", "", s:darkBlue2, "cterm=bold")
    echohl DuckSwim | echo a:duck | echohl None
endfunction


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
inoremap (<Enter> ("\n");<Left><Left><Left><Left><Left>

inoremap [] []<Left>
inoremap [ []<Left>

" <S-tab>で予測候補入力
inoremap <S-tab> <C-n>

" <Insert>無効、iに置き換え
inoremap <Insert> <Esc>li

" Visual modeの開始（Windowsでの<C-v>(貼り付け)に対応）
nnoremap <C-A-v> <C-v>

" CapsLockキー警告
nnoremap J :call ErrorMessage("😓: Jが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap K :call ErrorMessage("😓: Kが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap H :call ErrorMessage("😓: Hが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap L :call ErrorMessage("😓: Lが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap D :call ErrorMessage("😓: Dが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap U :call ErrorMessage("😓: Uが入力されました。CapsLockキーを確認して下さい。")<CR>
nnoremap R :call ErrorMessage("😓: Rが入力されました。CapsLockキーを確認して下さい。")<CR>

" インデントの調整
vnoremap < <gv
vnoremap > >gv

" 無名レジスタ""にヤンクレジスタ"0の内容をコピー
nnoremap <C-p> :let @"=@0<CR>

" re-do
nnoremap r <C-r>

" 検索時にマッチ数を表示する
nnoremap ? :call RecordCursorPos()<CR>:vimgrep //g %<Left><Left><Left><Left>

" カーソル下の単語検索の際にvimgrepで検索
nnoremap * :call RecordCursorPos()<CR>*N:vimgrep /<C-r><C-w>/g %<CR>:call VimGrepMovePos(t:pos)<CR>zz

" Terminal
if has('nvim')
else
	set termwinsize=15x0
endif
tnoremap <C-v> <C-w>N

" vimdiffの変更行検索
if &diff
	nnoremap c ]c]ckzz
	nnoremap <S-c> [ckzz

" vimgrepの検索
else
	nnoremap c :cnext<CR>
	nnoremap <S-c> :cprev<CR>
	nnoremap ! :call VimGrepMovePos(t:pos)<CR>zz:echo'🐸: move to saved position (line '.t:pos[1].')'<CR>
endif

" <S-Left>, <S-Right>でVisual選択
inoremap <S-Left> <Esc><C-v><Left>
nnoremap <S-Left> <C-v><Left>
inoremap <S-Right> <Esc><C-v><Right>
nnoremap <S-Right> <C-v><Right>

" <S-Home>で行頭までVisual選択
inoremap <S-Home> <Esc><C-v>^
nnoremap <S-Home> <C-v>^
vnoremap <S-Home> ^

" <C-Home><C-End>でタブの切り替え
nnoremap <C-Home> :tabNext<CR>
nnoremap <C-End> :tabnext<CR>

vnoremap <C-Home> <Esc>:tabNext<CR>
vnoremap <C-End> <Esc>:tabnext<CR>

inoremap <C-Home> <Esc>l:tabNext<CR>
inoremap <C-End> <Esc>l:tabnext<CR>

" <Control>押しながらだと3倍スクロール
nnoremap <C-Left> 3<S-Left>
nnoremap <C-Right> 3<S-Right>

inoremap <C-Left> <Esc>l3<S-Left>i
inoremap <C-Right> <Esc>l3<S-Right>i

" <Shift>押しながらだと5倍スクロール<Control>押しながらだと20倍スクロール
nnoremap <S-Up> 5k
nnoremap <C-Up> 20k
nnoremap <S-Down> 5j
nnoremap <C-Down> 20j

inoremap <S-Up> <Esc>l5ki
inoremap <C-Up> <Esc>l20ki
inoremap <S-Down> <Esc>l5ji
inoremap <C-Down> <Esc>l20ji

" <Control><Alt>押しながら方向キーで画面位置を変更
nnoremap <C-A-Up> zt
nnoremap <C-A-Down> zb
nnoremap <C-A-Left> zz
nnoremap <C-A-Right> zz

inoremap <C-A-Up> <Esc>lzti
inoremap <C-A-Down> <Esc>lzbi
inoremap <C-A-Left> <Esc>lzzi
inoremap <C-A-Right> <Esc>lzzi

vnoremap <C-A-Up> zb
vnoremap <C-A-Down> zt
vnoremap <C-A-Left> :<Backspace><Backspace><Backspace><Backspace><Backspace>'<<CR>V
vnoremap <C-A-Right> :<Backspace><Backspace><Backspace><Backspace><Backspace>'><CR>V

" <PageUp><PageDown>で画面スクロール
nnoremap <PageUp> <C-Y>
nnoremap <PageDown> <C-E>

inoremap <PageUp> <Esc>l<C-Y>i
inoremap <PageDown> <Esc>l<C-E>i

" <Control>押しながら<PageUp><PageDown>で5倍ページ送り
nnoremap <C-PageUp> 5<S-PageUp>
nnoremap <C-PageDown> 5<S-PageDown>

inoremap <C-PageUp> <Esc>l5<S-PageUp>i
inoremap <C-PageDown> <Esc>l5<S-PageDown>i


" ==================================================================
" Fnキーショートカットの設定
" ==================================================================
" ハイライトOFF＆カーソル位置の記録
if has('reltime')
	nnoremap <F1> :noh<CR>:set mouse=a<CR>:call RecordCursorPos()<CR>:call DuckSwim(t:pos[1]/100,10,0.01)<CR>
else
	nnoremap <F1> :noh<CR>:set mouse=a<CR>:call RecordCursorPos()<CR>:echo'🦆'<CR>
endif

" カーソル行ハイライトのON/OFF
nnoremap <F2> :set cursorline!<CR>:call ToggleMessage("↔: cursor line has toggled to", g:targetNo_cursor_line, g:cursor_line_flag)<CR>
inoremap <F2> <Esc>l:set cursorline!<CR>:call ToggleMessage(1, "↔: cursor line has toggled to", g:targetNo_cursor_line, g:cursor_line_flag)<CR>i

" カーソル列ハイライトのON/OFF
nnoremap <F3> :set cursorcolumn!<CR>:call ToggleMessage("↕: cursor column has toggled to", g:targetNo_cursor_column, g:cursor_column_flag)<CR>
inoremap <F3> <Esc>l:set cursorcolumn!<CR>:call ToggleMessage("↕: cursor column has toggled to", g:targetNo_cursor_column, g:cursor_column_flag)<CR>i

" 置換ショートカットの設定
nnoremap <F4> :%s///gc<Left><Left><Left><Left><C-r><C-w><Right>
vnoremap <F4> :s///gc<Left><Left><Left><Left>

" Neovim/Vimで動作を分岐
if has('nvim')
	" ~/.config/nvim/init.vimの明示的な読み込み
	nnoremap <F5> :source ~/.config/nvim/init.vim<CR>:noh<CR>:call ReloadMessage("reload init.vim")<CR>
else
	" ~/.vimrcの明示的な読み込み
	nnoremap <C-F5> :source ~/.vimrc<CR>:noh<CR>:call ReloadMessage("reload .vimrc")<CR>
endif

" git difftoolにvimdiffを設定している場合に差分情報を表示/終了
nnoremap <F6> :!git difftool %:p<CR><CR>
if &diff
	nnoremap <F6> :qa<CR>
	nnoremap :q :qa<CR>
endif

" カラーテーマ／コントラストの切替
nnoremap <F7> :call InitHighlight(g:mode)<CR>:noh<CR>:call ReloadMessage("reset highlight")<CR>
nnoremap <S-F7> :call ToggleContrast(g:contrast_mode)<CR>:call ToggleMessage(g:contrast_mode, g:targetNo_contrast_mode, g:noflag)<CR>
nnoremap <C-F7> :call ToggleHighlight(g:mode)<CR>:call ToggleMessage(g:mode, g:targetNo_color_mode, g:noflag)<CR>

inoremap <F7> <Esc>l:call InitHighlight(g:mode)<CR>:noh<CR>:call ReloadMessage("reset highlight")<CR>i
inoremap <S-F7> <Esc>l:call ToggleContrast(g:contrast_mode)<CR>:call ToggleMessage(g:contrast_mode, g:targetNo_contrast_mode, g:noflag)<CR>i
inoremap <C-F7> <Esc>l:call ToggleHighlight(g:mode)<CR>:call ToggleMessage(g:mode, g:targetNo_color_mode, g:noflag)<CR>i

" ハイライトグループの確認
nnoremap <F8> g<C-g>
nnoremap <S-F8> :echo'🦖: '.synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

" Terminal
nnoremap <F9> <C-w>w
tnoremap <F9> <C-w>w
nnoremap <C-F9> :bo terminal<CR>
inoremap <C-F9> <Esc>l:bo terminal<CR>
tnoremap <C-F9> exit<CR>

" レジスタ
nnoremap <F10> :reg<CR>:call Separate('-',40)<CR>:echo'🌼: <C-F10>  clear any select register'<CR>:echo'🌼: <S-F10>  clear ALL registers'<CR>:call Separate('-',40)<CR>
nnoremap <C-F10> :call ClearReg('')<Left><Left>
nnoremap <S-F10> :call ClearRegs()<CR>:echo'🌼: all register has been cleared.'<CR>

" 新規タブ
nnoremap <F12> :tabnew 
nnoremap <C-F12> :tabnew<CR>:Explore<CR>:echo'📁: Please push the \<Enter\> on the file you want to open.'<CR>
nnoremap <S-F12> :Explore<CR>


" ==================================================================
" カーソルの設定
" ==================================================================
if has('vim_starting')

	" 挿入モード -> 非点滅 縦棒
	let &t_SI .= "\e[6 q"

	" ノーマルモード -> 非点滅 ブロック
	let &t_EI .= "\e[2 q"

	" 置換モード -> 非点滅 下線
	let &t_SR .= "\e[4 q"
endif


" ==================================================================
" 色の定義
" ==================================================================
" 白/黒
let s:white255 = { "cterm": "255", "gui": "#eeeeee"}
let s:white254 = { "cterm": "254", "gui": "#e4e4e4"}
let s:white253 = { "cterm": "253", "gui": "#dadada"}
let s:white252 = { "cterm": "252", "gui": "#d0d0d0"}
let s:white251 = { "cterm": "251", "gui": "#c6c6c6"}
let s:white    = { "cterm": "250", "gui": "#d7d7d7"}
let s:black    = { "cterm": "235", "gui": "#262626"}
let s:black234 = { "cterm": "234", "gui": "#1c1c1c"}
let s:black016 = { "cterm": "16", "gui": "#000000"}
" 灰
let s:gray  = { "cterm": "237", "gui": "#3a3a3a"}
let s:gray2 = { "cterm": "238", "gui": "#444444"}
let s:gray3 = { "cterm": "239", "gui": "#4e4e4e"}
let s:gray4 = { "cterm": "240", "gui": "#585858"}
let s:gray5 = { "cterm": "241", "gui": "#606060"}
let s:gray6 = { "cterm": "242", "gui": "#666666"}
let s:gray7 = { "cterm": "243", "gui": "#767676"}
let s:gray8 = { "cterm": "244", "gui": "#808080"}
let s:gray9 = { "cterm": "245", "gui": "#8a8a8a"}
let s:lightGray  = { "cterm": "246", "gui": "#949494"}
let s:lightGray2 = { "cterm": "247", "gui": "#9e9e9e"}
let s:lightGray3 = { "cterm": "248", "gui": "#a8a8a8"}
let s:lightGray4 = { "cterm": "249", "gui": "#b2b2b2"}
" 青
let s:blue        = { "cterm": "32", "gui": "#0087d7"}
let s:darkBlue    = { "cterm": "19", "gui": "#0000af"}
let s:darkBlue2   = { "cterm": "24", "gui": "#005f87"}
let s:lightBlue   = { "cterm": "67", "gui": "#5f87af"}
let s:diluteBlue  = { "cterm": "24", "gui": "#0087d7"}
let s:diluteBlue2 = { "cterm": "25", "gui": "#005faf"}
let s:blueGreen   = { "cterm": "37", "gui": "#00afaf"}
let s:darkCyan   = { "cterm": "73", "gui": "#5fafaf"}
let s:darkCyan2  = { "cterm": "66", "gui": "#5f8787"}
let s:lightCyan  = { "cterm": "123", "gui": "#87ffff"}
let s:lightCyan2 = { "cterm": "152", "gui": "#afd7d7"}
" 緑
let s:green       = { "cterm": "35", "gui": "#00af5f"}
let s:darkGreen   = { "cterm": "22", "gui": "#005f00"}
let s:lightGreen  = { "cterm": "157", "gui": "#afffaf"}
let s:lightGreen2 = { "cterm": "121", "gui": "#87ffaf"}
let s:leafGreen   = { "cterm": "34", "gui": "#00af00"}
" 紫
let s:purple       = { "cterm": "135", "gui": "#af5fff"}
let s:darkPurple   = { "cterm": "54", "gui": "#5f0087"}
let s:lightPurple  = { "cterm": "104", "gui": "#8787d7"}
let s:dilutePurple = { "cterm": "60", "gui": "#0087d7"}
let s:redPurple    = { "cterm": "141", "gui": "#af87ff"}
let s:bluePurple   = { "cterm": "104", "gui": "#8787d7"}
let s:bluePurple2  = { "cterm": "57", "gui": "#5f00ff"}
let s:lightPink = { "cterm": "225", "gui": "#ffd7ff"}
" 赤
let s:red     = { "cterm": "160", "gui": "#d70000"}
let s:darkRed = { "cterm": "95", "gui": "#875f5f"}
let s:magenta      = { "cterm": "125", "gui": "#af005f"}
let s:lightMagenta = { "cterm": "201", "gui": "#ff00ff"}
let s:vermilion      = { "cterm": "203", "gui": "#ff5f5f"}
let s:lightVermilion = { "cterm": "217", "gui": "#ffafaf"}
" 黄
let s:yellow      = {"cterm":"11", "gui":"#ffff00"}
let s:orange       = { "cterm": "130", "gui": "#af5f00"}
let s:orange2      = { "cterm": "172", "gui": "#d75f00"}
let s:diluteOrange = { "cterm": "94", "gui": "#af5f00"}


" ==================================================================
" ステータスラインの設定
" ==================================================================
" 改行コード
let ff_table = {'dos' : 'DOS:CR+LF', 'unix' : 'UNIX:LF', 'mac' : 'MAC:CR' }

" ステータスラインを設定する関数
function! SetMyStatusLine()

	if mode() =~ 'n'
		let mode_emoji = '😎'
		let mode_name  = 'Normal'
		let mode_color = 1

	elseif mode() =~ 'c'
		let mode_emoji = '👻'
		let mode_name  = 'Command'
		let mode_color = 1

	elseif mode() =~ 'i'
		let mode_emoji = '💣'
		let mode_name  = 'Insert'
		let mode_color = 2

	elseif mode() =~ 'R'
		let mode_emoji = '💣💥'
		let mode_name  = 'Replace'
		let mode_color = 3

	elseif mode() =~ 'v'
		let mode_emoji = '👀'
		let mode_name  = 'Visual'
		let mode_color = 4

	elseif mode() =~ 'V'
		let mode_emoji = '👀'
		let mode_name  = 'Visual Line'
		let mode_color = 4

	elseif mode() =~ ''
		let mode_emoji = '👀'
		let mode_name  = 'Visual Block'
		let mode_color = 4

	elseif mode() =~ 't'
		let mode_emoji = '💻'
		let mode_name  = 'Terminal'
		let mode_color = 7

	else
		let mode_emoji = ''
		let mode_name  = 'Mode: ' . mode()
		let mode_color = 5

	endif

	let mode_status   = '%'.mode_color.'* '.mode_emoji.' '.mode_name.'  '
	let file_name     = '%6*  %<%F  ' 
	let file_status   = '%7* %M %R'
	let status_emoji  = '👻👻👻  '
	let file_encoding = '%7*  %{&fileencoding}  '
	let LF_code       = '%7*  %{ff_table[&ff]}  '
	let file_type     = '%8*  %{toupper(&ft)}  '
	let cursor_col    = '%9*  %c/'.strlen(getline(".")).'列  '
	let cursor_row    = '%'.mode_color.'*  %p％ | %L行 '
	let status_line   = mode_status . file_name . file_status . '%=' . status_emoji .'| '. file_encoding . LF_code . file_type . cursor_col . cursor_row

	return status_line

endfunction


" ==================================================================
" シンタックスの設定
" ==================================================================
" ユーザ定義シンタックス
function! SetMySyntax()
	" Operators
	syntax match cUserOperator "&&\|||"
	syntax match cUserOperator2 "<=\|>=\|<\|>\|==\|!=\|->"
	syntax match cUserOperator3 "(\|)\|{\|}\|\[\|\]"
	syntax match cUserOperator3 ",\|;"

	"UserFunction
	syntax match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
endfunction

" 動作モード
let g:mode = "dark"

" ---------------------------------
" シンタックス設定関数
" ---------------------------------
function! s:setHighlight(group, fg, bg, attribute)
	" a:fgが辞書型の場合
	if type(a:fg) == type({})
		execute "highlight " . a:group
			\. " ctermfg=" . a:fg.cterm . " guifg="   . a:fg.gui
			\. " "         . a:attribute
	" a:fgが辞書型以外の場合
	else
		execute "highlight " . a:group
			\. " ctermfg=NONE guifg=NONE"
			\. " "         . a:attribute
	endif
	" a:bgが辞書型の場合
	if type(a:bg) == type({})
		execute "highlight " . a:group
			\. " ctermbg=" . a:bg.cterm . " guibg=" . a:bg.gui
			\. " "         . a:attribute
	" a:bgが辞書型以外の場合
	else
		execute "highlight " . a:group
			\. " ctermbg=NONE guibg=NONE"
			\. " "         . a:attribute
	endif

endfunction
" --------------------------
function! InitHighlight(mode)

	let g:contrast_mode = "low"

	" ダークモード
	if a:mode == "dark"
		call SetDefaultDark()
	endif

	" ライトモード
	if a:mode == "light"
		call SetDefaultLight()
	endif

endfunction
" --------------------------
function! ToggleHighlight(mode)

	" ダークモード -> ライトモード
	if a:mode == "dark"
		let g:mode = "light"
		call InitHighlight(g:mode)
	endif

	" ライトモード -> ダークモード
	if a:mode == "light"
		let g:mode = "dark"
		call InitHighlight(g:mode)
	endif

endfunction
" --------------------------
function! SetHighContrast(mode)

	" ダークモード
	if a:mode == "dark"
		call SetHighContrastDark()
	endif

	" ライトモード
	if a:mode == "light"
		call SetHighContrastLight()
	endif

endfunction
" --------------------------
function! ToggleContrast(contrast_mode)

	" high -> low
	if a:contrast_mode == "high"
		let g:contrast_mode = "low"
		call InitHighlight(g:mode)
	endif

	" low -> high
	if a:contrast_mode == "low"
		let g:contrast_mode = "high"
		call SetHighContrast(g:mode)
	endif

endfunction

" ---------------------------------
" カラースキーム
" ---------------------------------
function! SetDarkTheme(fg, bg, cursorBg, statuslineFg, statuslineBg, commandlineFg, commandlineBg)

	let g:mode = "dark"

	" カラーテーマの設定
	set background=dark
	highlight clear

	" ステータスラインの設定
	set statusline=%!SetMyStatusLine()

	" 行番号
	call s:setHighlight("LineNr", s:gray4, a:bg, "cterm=bold")
	call s:setHighlight("CursorLineNr", s:orange, a:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", a:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", a:cursorBg, "cterm=bold")
	call s:setHighlight("MatchParen", s:black234, s:lightGreen2, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", a:fg, a:bg, "")
	call s:setHighlight("Visual", "", s:gray, "cterm=bold")

	" 文字列
	call s:setHighlight("Comment", s:gray7, a:bg, "")
	call s:setHighlight("String",  s:blue, a:bg, "")

	" 記号／特殊文字
	call s:setHighlight("Special", s:lightGray, a:bg, "")
	call s:setHighlight("SpecialKey", s:gray2, a:bg, "")
	call s:setHighlight("SpecialChar", s:blueGreen, a:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("PreProc", s:dilutePurple, a:bg, "")
	call s:setHighlight("Include", s:purple, a:bg, "")
	call s:setHighlight("Macro",   s:purple, a:bg, "")
	call s:setHighlight("PreCondit", s:bluePurple, a:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:redPurple, a:bg, "")
	call s:setHighlight("Repeat", s:redPurple, a:bg, "")

	" 型
	call s:setHighlight("Type", s:green, a:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, a:bg, "")
	call s:setHighlight("Number", s:vermilion, a:bg, "")

	" C言語
	call s:setHighlight("cUserOperator", s:orange2, a:bg, "")
	call s:setHighlight("cUserOperator2", s:yellow, a:bg, "")
	call s:setHighlight("cUserOperator3", s:gray9, a:bg, "")
	call s:setHighlight("cUserOperator4", s:white255, a:bg, "")
	call s:setHighlight("cUserFunction", s:lightCyan2, a:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, a:bg, "")
	call s:setHighlight("shSetList", s:green, a:bg, "")

	" Pmenu
	call s:setHighlight("Pmenu", s:black016, s:gray3, "")
	call s:setHighlight("PmenuSel", s:black016, s:lightGreen2, "")

	" 検索
	call s:setHighlight("Search", a:bg, s:lightVermilion, "term=reverse")

	" Directory
	call s:setHighlight("Directory", s:darkCyan2, a:bg, "")

	" Vim statusline
	call s:setHighlight("User1", a:statuslineFg, s:blue, "cterm=bold gui=bold")
	call s:setHighlight("User2", a:statuslineFg, s:green, "cterm=bold gui=bold")
	call s:setHighlight("User3", a:statuslineFg, s:vermilion, "cterm=bold gui=bold")
	call s:setHighlight("User4", a:statuslineFg, s:orange, "cterm=bold gui=bold")
	call s:setHighlight("User5", a:statuslineFg, s:bluePurple, "cterm=bold gui=bold")
	call s:setHighlight("User6", a:statuslineFg, s:gray3, "cterm=bold gui=bold")
	call s:setHighlight("User7", a:statuslineFg, a:statuslineBg, "cterm=bold gui=bold")
	call s:setHighlight("User8", s:black, s:lightGray4, "cterm=bold gui=bold")
	call s:setHighlight("User9", s:black, s:white253, "cterm=bold gui=bold")

	" Vim commandline
	call s:setHighlight("MsgArea", a:commandlineFg, a:commandlineBg, "")
	call s:setHighlight("ModeMsg", a:commandlineFg, a:commandlineBg, "term=bold")
	call s:setHighlight("MoreMsg", a:commandlineFg, a:commandlineBg, "term=bold")
	call s:setHighlight("WarningMsg", s:vermilion, a:commandlineBg, "")
	call s:setHighlight("ErrorMsg", s:white255, s:red, "term=standout")
	call s:setHighlight("Question", s:white255, a:commandlineBg, "term=standout")

	" Vim Tabline
	call s:setHighlight("TabLine", a:fg, a:commandlineBg, "cterm=bold")
	call s:setHighlight("TabLineSel", a:fg, a:bg, "cterm=bold")
	call s:setHighlight("TabLineFill", a:bg, a:commandlineBg, "cterm=bold")

	" vimdiff
	call s:setHighlight("DiffAdd", s:lightGreen, s:darkGreen, "")
	call s:setHighlight("DiffDelete", s:lightPink, s:darkRed, "")
	call s:setHighlight("DiffChange", s:black016, s:darkCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:blue, a:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:green, a:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, a:bg, "cterm=bold")

endfunction

" --------------------------
function! SetLightTheme(fg, bg, cursorBg, statuslineFg, statuslineBg, commandlineFg, commandlineBg)

	let g:mode = "light"

	" カラーテーマの設定
	set background=light
	highlight clear

	" ステータスラインの設定
	set statusline=%!SetMyStatusLine()

	" 行番号
	call s:setHighlight("LineNr", s:darkRed, a:bg, "")
	call s:setHighlight("CursorLineNr", s:orange, a:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", a:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", a:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", a:fg, a:bg, "")
	call s:setHighlight("Visual", "", s:white251, "")

	" 文字列
	call s:setHighlight("Comment", s:lightBlue, a:bg, "")
	call s:setHighlight("String",  s:darkBlue, a:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:white251, a:bg, "")
	call s:setHighlight("SpecialChar", s:diluteBlue2, a:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("Include", s:darkPurple, a:bg, "")
	call s:setHighlight("Macro",   s:darkPurple, a:bg, "")
	call s:setHighlight("PreCondit", s:lightPurple, a:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:bluePurple2, a:bg, "")
	call s:setHighlight("Repeat", s:bluePurple2, a:bg, "")

	" 型
	call s:setHighlight("Type", s:leafGreen, a:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, a:bg, "")
	call s:setHighlight("Number", s:red, a:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, a:bg, "")
	call s:setHighlight("shSetList", s:blue, a:bg, "")

	" Vim statusline
	call s:setHighlight("User1", a:statuslineFg, s:blue, "cterm=bold gui=bold")
	call s:setHighlight("User2", a:statuslineFg, s:green, "cterm=bold gui=bold")
	call s:setHighlight("User3", a:statuslineFg, s:vermilion, "cterm=bold gui=bold")
	call s:setHighlight("User4", a:statuslineFg, s:orange, "cterm=bold gui=bold")
	call s:setHighlight("User5", a:statuslineFg, s:bluePurple, "cterm=bold gui=bold")
	call s:setHighlight("User6", a:statuslineFg, s:gray3, "cterm=bold gui=bold")
	call s:setHighlight("User7", a:statuslineFg, a:statuslineBg, "cterm=bold gui=bold")
	call s:setHighlight("User8", s:black, s:lightGray4, "cterm=bold gui=bold")
	call s:setHighlight("User9", s:black, s:white253, "cterm=bold gui=bold")

	" vimdiff
	call s:setHighlight("DiffAdd", "", s:lightGreen2, "")
	call s:setHighlight("DiffDelete", "", s:lightVermilion, "")
	call s:setHighlight("DiffChange", "", s:lightCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:darkBlue, a:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:leafGreen, a:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, a:bg, "cterm=bold")

endfunction

" --------------------------
function! SetDefaultDark()

	" デフォルトカラーの定義
	let l:fg    = s:white
	let l:bg    = s:black
	let l:cursorBg = s:gray
	let l:statuslineFg  = s:white255
	let l:statuslineBg  = s:gray
	let l:commandlineFg = s:lightGray4
	let l:commandlineBg = s:gray7

	call SetDarkTheme(l:fg, l:bg, l:cursorBg, l:statuslineFg, l:statuslineBg, l:commandlineFg, l:commandlineBg)

endfunction

" --------------------------
function! SetDefaultLight()

	" デフォルトカラーの定義
	let l:fg    = s:black016
	let l:bg    = s:white253
	let l:cursorBg = s:white252
	let l:statuslineFg  = s:white255
	let l:statuslineBg  = s:gray
	let l:commandlineFg = s:lightGray4
	let l:commandlineBg = s:gray

	call SetLightTheme(l:fg, l:bg, l:cursorBg, l:statuslineFg, l:statuslineBg, l:commandlineFg, l:commandlineBg)

endfunction

" ---------------------------------
" ハイコントラストテーマ
" ---------------------------------
function! SetHighContrastDark()

	" デフォルトカラーの定義
	let l:fg    = s:white
	let l:bg    = s:black234
	let l:cursorBg = s:gray
	let l:statuslineFg  = s:white255
	let l:statuslineBg  = s:gray
	let l:commandlineFg = s:lightGray4
	let l:commandlineBg = s:gray4

	call SetDarkTheme(l:fg, l:bg, l:cursorBg, l:statuslineFg, l:statuslineBg, l:commandlineFg, l:commandlineBg)

endfunction

" --------------------------
function! SetHighContrastLight()

	" デフォルトカラーの定義
	let l:fg    = s:black016
	let l:bg    = s:white255
	let l:cursorBg = s:white254
	let l:statuslineFg  = s:white255
	let l:statuslineBg  = s:gray
	let l:commandlineFg = s:lightGray4
	let l:commandlineBg = s:gray

	call SetLightTheme(l:fg, l:bg, l:cursorBg, l:statuslineFg, l:statuslineBg, l:commandlineFg, l:commandlineBg)

endfunction

" ---------------------------------
" 初期化処理
" ---------------------------------
call InitHighlight(g:mode)
autocmd syntax * call SetMySyntax()


" ==================================================================
" ヤンクした文字列をクリップボードと連携
" ==================================================================
if has('win32') || has('win64') || has('mac')
	set clipboard=unnamed           " Windows, Macの場合はプライマリ("*)と共有
else
	set clipboard=unnamedplus       " Linuxの場合はクリップボード（"+）と共有
endif


" ==================================================================
" マウスの動作設定
" ==================================================================
set mouse=a

" ホイールスクロールで3行移動
nnoremap <ScrollWheelUp> 3k
nnoremap <ScrollWheelDown> 3j

inoremap <ScrollWheelUp> <Esc>l3ki
inoremap <ScrollWheelDown> <Esc>l3ji

" 左クリックで対象ワードを検索
nnoremap <LeftMouse> <Esc>
nnoremap <2-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <3-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <4-LeftMouse> <S-LeftMouse>N<Esc>

" 右クリックは動作が変になるので無効化
nnoremap <RightMouse> <Esc>
nnoremap <2-RightMouse> <Esc>
nnoremap <3-RightMouse> <Esc>
nnoremap <4-RightMouse> <Esc>

vnoremap <RightMouse> <Esc>
vnoremap <2-RightMouse> <Esc>
vnoremap <3-RightMouse> <Esc>
vnoremap <4-RightMouse> <Esc>

inoremap <RightMouse> <Esc>l
inoremap <2-RightMouse> <Esc>l
inoremap <3-RightMouse> <Esc>l
inoremap <4-RightMouse> <Esc>l
