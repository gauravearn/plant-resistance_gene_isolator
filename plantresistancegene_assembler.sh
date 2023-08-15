#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Author: Gaurav Sablok
# date: 2023-08-09
# MIT License
# a complete workflow for the plant NLR resiatance genome
# mining from the long reads.
echo "I am the complete plant NLR resistance gene miner and i do the assembly of the long reads
and also predicts the NLR gene position through the comparative genome mining approach, there 
are two types of the assembler available in this workspace canu or the flye assembler"

echo "This is only for those which have only the long reads and not the illumina ones
, if you have the long reads and the illumina ones then please use the plant resistance
gene with polisher which has multiple polisher and also performs a consensus approach
for assemble consolidation"

echo "please install the conda environment"
echo "conda create -n resistancegene -y && conda install -n resistancegene canu -y"
echo "conda install -n resistancegene -c bioconda flye"
echo "conda install -n resistancegene -c bioconda orthofinder"
read -p "enter your directory containing the files for the pacbio reads:" dirname
read -p "choose your assembler for the long reads:" assembler
read -p "do you want to perform the comparative minning approach:" comparative
read -p "enter your genome size:" genomesize
read -p "enter your computing threads:" threads

if
    [[ -d "${dirname}" ]] &&
        [[ $assembler == "canu" ]] &&
        [[ $comparative == "yes" ]]
then
    echo "$(pwd)"
    echo "mkdir ${dirname}/assemble_plant_resistance_genes"
    for i in ${dirname}/*.fasta; do
        echo "canu -corMhapSensitivity=normal -corMinCoverage=3 -corErrorRate=0.013 -corOutCoverage=100 
        -p resistancegene -d ${dirname}/assemble_plant_resistance_genes genomeSize=$genomesize 
        -minReadLength=500 -merylMemory=256 -gnuplotImageFormat=png -batMemory=300 -cnsMemory=300 -pacbio-raw $i"
        echo "mkdir ${dirname}/resistance_comparative_genome_mining"
        echo "cp -r ${dirname}/assemble_plant_resistance_genes/*.fasta resistance_comparative_genome_mining"
        echo "cd resistance_comparative_genome_mining"
        echo "wget https://github.com/sablokgaurav/plant_long_read_resistance_gene_isolator/blob/main/PlantNLR_CDS.fasta"
        echo "orthofinder -t $threads -a 60 -M dendroblast -S diamond  -M msa -A mafft -T 
             fasttree -p ./ -f resistance_comprative_genome_mining"
    done
fi
if
    [[ -d "${dirname}" ]] &&
        [[ $assembler == "flye" ]] &&
        [[ $comparative == "yes" ]]
then
    echo "$(pwd)"
    echo "mkdir ${dirname}/assemble_plant_resistance_genes"
    for i in ${dirname}/*.fasta; do
        echo "flye --pacbio-raw $i --genome-size $genomesize --threads $threads 
        --out-dir ${dirname}/assemble_plant_resistance_genes_flye --min-overlap 1000"
        echo "mkdir resistance_comparative_genome_mining"
        echo "cp -r ${dirname}/assemble_plant_resistance_genes/*.fasta resistance_comparative_genome_mining"
        echo "cd resistance_comparative_genome_mining"
        echo "wget https://github.com/sablokgaurav/plant_long_read_resistance_gene_isolator/blob/main/PlantNLR_CDS.fasta"
        echo "orthofinder -t $threads -a 60 -M dendroblast -S diamond  -M msa -A mafft -T 
        fasttree -p ./ -f resistance_comprative_genome_mining"
    done
fi
