# reference_genome_GRCm38

This repository contains files to generate a custom GRCm38/mm10-based reference genome.

## How to generate the reference genome

To generate the reference genome, run `./download_Ensembl_ref.sh`.

## FASTA sequence file `GRCm38+rDNA_repeat.fa`

The file `GRCm38+rDNA_repeat.fa` includes:
1. Hard repeat-masked sequences of all autosomes (chromosomes 1-19), chromosomes X and Y, and the mitochondrial (MT) DNA sequence from Ensembl
2. A single copy of the canonical ribosomal DNA repeat unit sequence BK000964.3 from GenBank

## BED annotation file `GRCm38+rDNA_repeat.bed.gz`

The reference annotation `GRCm38+rDNA_repeat.bed.gz` includes the UCSC RefSeq (refGene) gene annotation from NCBI and custom annotation of BK000964.3 rDNA elements from GenBank.

## References

- [GRCm38 on Ensembl](http://asia.ensembl.org/Mus_musculus/Info/Index)
- [GRCm38 on NCBI](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001635.20/)
- [BK000964.3 on GenBank](https://www.ncbi.nlm.nih.gov/nuccore/BK000964)

## Contact

Please contact [Maurits Evers](mailto:maurits.evers@anu.edu.au) in case of questions/suggestions.
