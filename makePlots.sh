#!/usr/bin/bash
# 2 input parameters: $1 = -g for grouped impacts, $2 for the key of the study
#cd $pdf_unc_dir/CMSSW_12_0_1/src && cmsenv && cd -
#. $plot_impact_dir/env/bin/activate
declare -a pdfs=("nnpdf31" "ct18" "mmht")
#declare -a pdfs=("nnpdf30")
declare -a pseudo_datas=(
"NNPDF30Cen"
"NNPDF31Cen"
"CT18Cen"
"MMHTCen"
)
declare -a xvars=(
"etal_ptl_unrolled"
)
<< "HERE"
declare -a pdfs=("nnpdf31")
declare -a pseudo_datas=(
"CT18Cen"
)
declare -a xvars=(
"etal_ptl_unrolled"
"ptl_smear"
"etal_ptl_smear_unrolled"
)
HERE
declare -i i=0
if [[ "$2" == "pulls" ]]; then
    declare -i num_plot=(${#pdfs[@]}-1)*(${#pseudo_datas[@]})*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/${xvar}" ]; then
                mkdir -p /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/${xvar}
            fi
            for pseudo_data in "${pseudo_datas[@]}"; do
                if [[ "${pdf^^}Cen" == "$pseudo_data" ]]; then
                    continue
                else
                    i=i+1
                    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
                    echo "producing ", $2, " pni plots for ", $pdf, $xvar, $pseudo_data
                    echo "this is the" $i"/"$num_plot "plot to be made by the script"
                    python ${plot_impact_dir}pullsAndImpacts.py \
                    -f ${combine_files_dir}/$2/${pseudo_data}/${xvar}_${pdf}/fitresults_123456789.root -s pull \
                    output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}/${pseudo_data}-${pdf}.html\
                    -t "Mass pull and impact ${xvar} ${pseudo_data} ${pdf}"
                fi
            done
        done
    done
elif [[ "$2" == "pulls-group" ]]; then
    declare -i num_plot=(${#pdfs[@]}-1)*(${#pseudo_datas[@]})*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/${xvar}" ]; then
                mkdir -p /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/${xvar}
            fi
            for pseudo_data in "${pseudo_datas[@]}"; do
                if [[ "${pdf^^}Cen" == "$pseudo_data" ]]; then
                    continue
                else
                    i=i+1
                    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
                    echo "producing ", $2, " pni plots for ", $pdf, $xvar, $pseudo_data
                    echo "this is the" $i"/"$num_plot "plot to be made by the script"
                    python ${plot_impact_dir}pullsAndImpacts.py \
                    -f ${combine_files_dir}/pulls/${pseudo_data}/${xvar}_${pdf}/fitresults_123456789.root -g \
                    output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}/${pseudo_data}-${pdf}-g.html\
                    -t "Mass pull and impact ${xvar} ${pseudo_data} ${pdf}"
                fi
            done
        done
    done
elif [[ "$2" == "impacts" ]]; then
declare -i num_plot=${#pdfs[@]}*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
                mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
            fi
            i=i+1
            echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            echo "producing ", $2, " pni plots for ", $pdf, $xvar
            echo "this is the" $i"/"$num_plot "plot to be made by the script"
            python ${plot_impact_dir}pullsAndImpacts.py \
            -f ${combine_files_dir}/$2/${xvar}_${pdf}/fitresults_123456789.root $1 \
            output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}-${pdf}${1}.html\
            -t "Mass impact ${xvar} ${pdf}"
        done
    done

elif [[ "$2" == "impacts_w_pulls" ]]; then
declare -i num_plot=${#pdfs[@]}*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
                mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
            fi
            i=i+1
            echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            echo "producing ", $2, " pni plots for ", $pdf, $xvar
            echo "this is the" $i"/"$num_plot "plot to be made by the script"
            python ${plot_impact_dir}pullsAndImpacts.py \
            -f ${combine_files_dir}/impacts/${xvar}_${pdf}/fitresults_123456789.root \
            output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}-${pdf}${1}.html\
            -t "Mass impact ${xvar} ${pdf}"
        done
    done

elif [[ "$2" == "impacts_asimov" ]]; then
declare -i num_plot=${#pdfs[@]}*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
                mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
            fi
            i=i+1
            echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            echo "producing ", $2, " pni plots for ", $pdf, $xvar
            echo "this is the" $i"/"$num_plot "plot to be made by the script"
            python ${plot_impact_dir}pullsAndImpacts.py \
            -f ${combine_files_dir}/impacts/${xvar}_${pdf}/fitresults_123456789.root $1 \
            output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}-${pdf}${1}.html\
            -t "Mass impact ${xvar} ${pdf}"
        done
    done
elif [[ "$2" == "half_lumi" ]] || [[ "$2" == "eta2p0" ]] || [[ "$2" == "half_lumi-eta2p0" ]]; then
declare -i num_plot=${#pdfs[@]}*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
                mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
            fi
            i=i+1
            echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            echo "producing ", $2, " pni plots for ", $pdf, $xvar
            echo "this is the" $i"/"$num_plot "plot to be made by the script"
            python ${plot_impact_dir}pullsAndImpacts.py \
            -f ${combine_files_dir}/$2/${xvar}_${pdf}/fitresults_123456789.root $1\
            output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}-${pdf}$1.html\
            -t "Mass impact ${xvar} ${pdf}"
        done
    done
elif [[ "$2" == "eta_cut_prevfp" ]]; then
declare -i num_plot=${#pdfs[@]}*${#xvars[@]}
    for pdf in "${pdfs[@]}"; do
        for xvar in "${xvars[@]}"; do
            if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
                mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
            fi
            i=i+1
            echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            echo "producing ", $2, " pni plots for ", $pdf, $xvar
            echo "this is the" $i"/"$num_plot "plot to be made by the script"
            python ${plot_impact_dir}pullsAndImpacts.py \
            -f ${combine_files_dir}/$2/${xvar}_${pdf}/fitresults_123456789.root $1\
            output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${xvar}-${pdf}$1.html\
            -t "Mass impact ${xvar} ${pdf}"
        done
    done

elif [[ "$2" == "impacts_wremnants" ]]; then
declare -i num_plot=${#pdfs[@]}
    for pdf in "${pdfs[@]}"; do
        if [ ! -d "/eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/" ]; then
            mkdir /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/${2}/
        fi
        i=i+1
        echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        echo "producing ", $2, " pni plots for ", $pdf
        echo "this is the" $i"/"$num_plot "plot to be made by the script"
        python ${plot_impact_dir}pullsAndImpacts.py \
        -f ${combine_files_dir}/$2/${pdf}/fitresults_123456789.root $1 \
        output -o /eos/user/t/tyjyang/www/plots/wmass/pdf_unc/pni/$2/${pdf}${1}.html\
        -t "Mass impact ${pdf}"
    done

fi
deactivate

