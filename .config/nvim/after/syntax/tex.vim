highlight texDocType guifg=#afffaf
highlight texInputFile guifg=#00ffaf
highlight Delimiter guifg=#888888

highlight texBeginEnd guifg=#d787ff
highlight texBeginEndName guifg=#ffaf00

highlight texType guifg=#ffaf00

highlight texStatement guifg=#4cb3e6
highlight texMathSymbol guifg=#ffeb87
highlight texGreek guifg=#ffeb87

highlight texMath guifg=#aad7ff
highlight texSuperscript guifg=#aad7ff
highlight texSubscript guifg=#aad7ff

highlight texSection guifg=#ff87af

" Why don't these exist
call TexNewMathZone("A", "align", 1)
call TexNewMathZone("B", "alignat", 1)
call TexNewMathZone("C", "displaymath", 1)
call TexNewMathZone("D", "eqnarray", 1)
call TexNewMathZone("E", "equation", 1)
call TexNewMathZone("F", "flalign", 1)
call TexNewMathZone("G", "gather", 1)

syntax include @ASY after/syntax/asy.vim
syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
syntax region asySnip matchgroup=Snip start="\\begin{asydef}" end="\\end{asydef}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
hi link Snip PreProc

syntax match texMathSymbol "\\subsetneq\>"

syntax match texTypeStyle	"\\vocab\>"

syntax match texMathSymbol "\\half\>"
syntax match texMathSymbol "\\eps\>"
syntax match texMathSymbol "\\nullset\>"
"syntax match texMathSymbol "\\EE\>"
"syntax match texMathSymbol "\\PP\>"
"syntax match texMathSymbol "\\FF\>"
"syntax match texMathSymbol "\\NN\>"
"syntax match texMathSymbol "\\ZZ\>"
"syntax match texMathSymbol "\\QQ\>"
"syntax match texMathSymbol "\\RR\>"
"syntax match texMathSymbol "\\CC\>"
"syntax match texMathSymbol "\\HH\>"
syntax match texMathSymbol "\\intersect\>"
syntax match texMathSymbol "\\bigintersect\>"
syntax match texMathSymbol "\\union\>"
syntax match texMathSymbol "\\bigunion\>"
syntax match texMathSymbol "\\dang\>"
syntax match texMathSymbol "\\iso\>"
