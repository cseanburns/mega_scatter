#!/bin/bash

# locate lines in WoS exported files that contain the cited references
# this locates all lines between those beginning with ^CR and those beginning 
# with ^NR
sed -n '/^CR /,/^NR /p' plosone.txt > plosone_cr.txt
sed -n '/^CR /,/^NR /p' bmjopen_1-500.txt > bmj_cr.txt
sed -n '/^CR /,/^NR /p' bmjopen_501-541.txt >> bmj_cr.txt
sed -n '/^CR /,/^NR /p' jama.txt > jama_cr.txt
sed -n '/^CR /,/^NR /p' lancet.txt > lancet_cr.txt
sed -n '/^CR /,/^NR /p' nejm.txt > nejm_cr.txt
