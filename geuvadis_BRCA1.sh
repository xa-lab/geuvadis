#!/bin/bash
samtools=/home/software/samtools-bcftools-htslib-1.0_x64-linux/bin/samtools
#List Geuvadis RNAseq BAMs
LIST=$(ls *.bam)
echo name, d, q
for j in $LIST; do
#Full length = ENSE00003522602 to ENSE00003547126 (intron CIGAR: 402N)
full=$($samtools view $j chr17:41243049-41243049 | awk '{print $6}'|grep 402N|wc -l)
#delta11q = ENSE00001936588 to ENSE00003547126 (intron CIGAR: 3711N)
q=$($samtools view $j chr17:41243049-41243049 | awk '{print $6}'|grep 3711N|wc -l)
#delta11= ENSE00003463944 to ENSE00003547126 (intron CIGAR: 4813N)
d=$($samtools view $j chr17:41243049-41243049 | awk '{print $6}'|grep 4813N|wc -l)

echo $j, $full, $d, $q
done
