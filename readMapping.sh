# This script checks the qualitiy of our fastq files and performs an alignment to the human cDNA transcriptome reference with Kallisto.
# To run this 'shell script' you will need to open your terminal and navigate to the directory where this script resides on your computer.
# This should be the same directory where you fastq files and reference fasta file are found.
# Change permissions on your computer so that you can run a shell script by typing: 'chmod 777 readMapping.sh' (without the quotes) at the terminal prompt 
# Then type './readMapping.sh' (without the quotes) at the prompt.  
# This will begin the process of running each line of code in the shell script.

# Build an index from our reference fasta file 
# The reference file used to create an index was "Mus_musculus.GRCm39.cdna.all.fa.gz" from here: http://ftp.ensembl.org/pub/release-106/fasta/mus_musculus/cdna/

# now map reads to the indexed reference host transcriptome
# use as many 'threads' as your machine will allow in order to speed up the read mapping process.
# note that we're also including the '&>' at the end of each line
# this takes the information that would've been printed to our terminal, and outputs this in a log file that is saved in /data/course_data

# Run Kallisto
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2048_1 -t 6 Polr_2048_1_1.fq.gz Polr_2048_1_2.fq.gz &> Polr_2048_1.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2048_2 -t 6 Polr_2048_2_1.fq.gz Polr_2048_2_2.fq.gz &> Polr_2048_2.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2048_3 -t 6 Polr_2048_3_1.fq.gz Polr_2048_3_2.fq.gz &> Polr_2048_3.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2048_11 -t 6 Polr_2048_11_1.fq.gz Polr_2048_11_2.fq.gz &> Polr_2048_11.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_1 -t 6 Polr_2138_1_1.fq.gz Polr_2138_1_2.fq.gz &> Polr_2138_1.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_2 -t 6 Polr_2138_2_1.fq.gz Polr_2138_2_2.fq.gz &> Polr_2138_2.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_3 -t 6 Polr_2138_3_1.fq.gz Polr_2138_3_2.fq.gz &> Polr_2138_3.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_4 -t 6 Polr_2138_4_1.fq.gz Polr_2138_4_2.fq.gz &> Polr_2138_4.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_6 -t 6 Polr_2138_6_1.fq.gz Polr_2138_6_2.fq.gz &> Polr_2138_6.log
kallisto quant -i mus_musculus.cdna.all.index -o Polr_2138_7 -t 6 Polr_2138_7_1.fq.gz Polr_2138_7_2.fq.gz &> Polr_2138_7.log


# summarize fastqc and kallisto mapping results in a single summary html using MultiQC
multiqc -d . 

echo "Finished"

