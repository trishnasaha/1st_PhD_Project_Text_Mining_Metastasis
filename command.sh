## identifying genes failed to retrive publication output due to time out
~/trishna/01_Text_Mining/18_All_Human_Genes_podosome$ cat human_genes.txt output_podosome_human_genes.ids | sort | uniq -c | sort -nr | grep " 1" > output_podosome_human_missing_genes.ids

## file processing for sorting out drug target for hub gene

~/Dropbox/Trishna_Projects/03_Text_Mining/analysis_of_genes/01_Updated_Oct_29/Drug_Repurposing$ while read id; do echo $id ; grep -w $id repurposing_drugs_20200324.txt ; done < hub_genes.txt > repurposing_drugs_20200324_hub_genes.txt  from the repurposing drug dataset


## file processing for sorting out drug target for hub gene from the drug TTD dataset

~/Dropbox/Trishna_Projects/03_Text_Mining/analysis_of_genes/Drug/TTD_db$ grep -e "TARGETID" -e "GENENAME" -e "DRUGINFO" P1-01-TTD_target_download.txt | grep -v -e "Phase" -e "Investigative" -e "Terminated" -e "Patented" -e "Withdrawn" -e "#NAME?" -e "Clinical trial" -e "Application submitted" -e "Registered" -e "Discontinued" | grep -v -e "^TARGETID" -e "^GENENAME" -e "^DRUGINFO" | cut -f2,3,4,5 | sed 's/TARGETID/\nTARGETID/g' > P1-01-TTD_target_download.tsv 

