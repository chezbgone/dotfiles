$pdf_mode = 1;

$pvc_timeout = 1;
$pdf_previewer = 'zathura %O %S';

$clean_ext = 'pre asy synctex.gz';

sub asy {return system("asy \"$_[0]\"");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");
