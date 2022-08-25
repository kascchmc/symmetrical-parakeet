# Change permissions with 'chmod 777 readMapping.sh' 
# Run with './readMapping.sh'  
# This will begin the process of running each line of code in the shell script.

# Run fastqc:
fastqc *.gz -t 4

# Build an index
# The reference file used to create an index was "Mus_musculus.GRCm39.cdna.all.fa.gz" from here: http://ftp.ensembl.org/pub/release-106/fasta/mus_musculus/cdna/

kallisto index -i Mus_musculus.GRCm39.cdna.all.index Mus_musculus.GRCm39.cdna.all.fa.gz

# now map reads to the indexed reference host transcriptome
# t = threads
# Include '&>' at the end of each line to output log file 

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


# summarize outputs using MultiQC
multiqc -d . 

echo "Finished"

