# plant_long_read_resistance_gene_isolator
I coded this function to make a comprehensive gene isolation for the plant resistance genes from the long reads sequencing. Given PacBio or Oxford Nanopore Reads, it will assemble, predict the plant disease resistance genes and will allow you to analyze the mutations in the plant disease resistance genes. 

```
# if canu genome assembler and comparative genomics
 $ sh resistance_gene_assemble.sh
I am the complete plant NLR resistance gene miner and i do the assembly of the long reads
and also predicts the NLR gene position through the comparative genome mining approach, there
are two types of the assembler available in this workspace canu or the flye assembler
please install the conda environment
conda create -n resistancegene -y && conda install -n resistancegene canu -y
conda install -n resistancegene -c bioconda flye
conda install -n resistancegene -c bioconda orthofinder
enter your directory containing the files for the pacbio reads:/Users/gauravsablok/Desktop/test
choose your assembler for the long reads:canu
do you want to perform the comparative minning approach:yes
enter your genome size:4000
enter your computing threads:4
/Users/gauravsablok/Desktop
mkdir /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes
canu -corMhapSensitivity=normal -corMinCoverage=3 -corErrorRate=0.013 -corOutCoverage=100
        -p resistancegene -d /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes genomeSize=4000
        -minReadLength=500 -merylMemory=256 -gnuplotImageFormat=png -batMemory=300 -cnsMemory=300 
        -pacbio-raw /Users/gauravsablok/Desktop/test/PlantNLR_CDS.fasta
mkdir /Users/gauravsablok/Desktop/test/resistance_comparative_genome_mining
cp -r /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes/*.fasta resistance_comparative_genome_mining
cd resistance_comparative_genome_mining
wget https://github.com/sablokgaurav/plant_long_read_resistance_gene_isolator/blob/main/PlantNLR_CDS.fasta
orthofinder -t 4 -a 60 -M dendroblast -S diamond  -M msa -A mafft -T
             fasttree -p ./ -f resistance_comprative_genome_mining
```
```
# if flye genome assembler and comparative genomes
 $ sh resistance_gene_assemble.sh
I am the complete plant NLR resistance gene miner and i do the assembly of the long reads
and also predicts the NLR gene position through the comparative genome mining approach, there
are two types of the assembler available in this workspace canu or the flye assembler
please install the conda environment
conda create -n resistancegene -y && conda install -n resistancegene canu -y
conda install -n resistancegene -c bioconda flye
conda install -n resistancegene -c bioconda orthofinder
enter your directory containing the files for the pacbio reads:/Users/gauravsablok/Desktop/test
choose your assembler for the long reads:flye
do you want to perform the comparative minning approach:yes
enter your genome size:4000
enter your computing threads:4
/Users/gauravsablok/Desktop
mkdir /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes
flye --pacbio-raw /Users/gauravsablok/Desktop/test/PlantNLR_CDS.fasta --genome-size 4000 --threads 4
        --out-dir /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes_flye --min-overlap 1000
mkdir resistance_comparative_genome_mining
cp -r /Users/gauravsablok/Desktop/test/assemble_plant_resistance_genes/*.fasta resistance_comparative_genome_mining
cd resistance_comparative_genome_mining
wget https://github.com/sablokgaurav/plant_long_read_resistance_gene_isolator/blob/main/PlantNLR_CDS.fasta
orthofinder -t 4 -a 60 -M dendroblast -S diamond  -M msa -A mafft -T
        fasttree -p ./ -f resistance_comprative_genome_mining
```
Gaurav Sablok \
Frontiers: https://loop.frontiersin.org/people/33293/overview \
ORCID: https://orcid.org/0000-0002-4157-9405 \
WOS: https://www.webofscience.com/wos/author/record/C-5940-2014 \
Github:https://github.com/sablokgaurav \
Linkedin: https://www.linkedin.com/in/sablokgaurav/ 
