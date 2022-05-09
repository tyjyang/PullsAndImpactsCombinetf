declare -a pdfs=("nnpdf31" "ct18" "mmht")
declare -a pseudo_datas=(
"NNPDF30Cen"
"NNPDF31Cen"
"CT18Cen"
"MMHTCen"
)
declare -a xvars=(
"etal_ptl_unrolled"
)

declare -i num_plot=(${#pdfs[@]}-1)*(${#pseudo_datas[@]})*${#xvars[@]}
 
