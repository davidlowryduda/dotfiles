
set sw = 2

set iskeyword+=:

let g:Tex_DefaultTargetFormat 'pdf'
let g:Tex_CompileRule_pdf 'pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
