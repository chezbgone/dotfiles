highlight texCmdClass guifg=#afffaf
highlight texCmdPackage guifg=#afffaf
"highlight texFileArg guifg=#00ffaf
highlight texFilesArg guifg=#00ffaf
highlight texFileOpt guifg=#aad7ff

highlight texDelim guifg=#888888
highlight texTabularChar guifg=#888888

highlight texCmd guifg=#55b5e6
highlight texCmdEnv guifg=#d787ff
highlight texEnvArgName guifg=#ffaf00

highlight texCmdStyle guifg=#ffaf00

highlight texMathCmd guifg=#55b5e6
highlight texMathSymbol guifg=#ffeb87
highlight texCmdGreek guifg=#ffeb87

highlight texMathZone guifg=#b8deff
highlight texMathSuperSub guifg=#b8deff

highlight texCmdPart guifg=#afffaf
highlight texPartArgTitle guifg=#ff87af

syntax include @ASY after/syntax/asy.vim
syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
syntax region asySnip matchgroup=Snip start="\\begin{asydef}" end="\\end{asydef}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
hi link Snip PreProc

syntax match texMathSymbol "\\subsetneq\>"

syntax match texCmdStyle	"\\vocab\>"

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

" Why don't these exist
" call TexNewMathZone("A", "align", 1)
" call TexNewMathZone("B", "alignat", 1)
" call TexNewMathZone("C", "displaymath", 1)
" call TexNewMathZone("D", "eqnarray", 1)
" call TexNewMathZone("E", "equation", 1)
" call TexNewMathZone("F", "flalign", 1)
" call TexNewMathZone("G", "gather", 1)
