#!/bin/bash

# Bash script to construct mm10 reference genome and BED annotation
# Sources:
#  (1) GRCm38 (mm10) reference genome from Ensembl
#  (2) BK000964.3 rDNA repeat sequence and annotation from GenBank
#
# Author: Maurits Evers (maurits.evers@anu.edu.au)
# Last changed: 27-11-2019


# Download reference genome
if [ ! -f GRCm38+rDNA_repeat.fa ]; then
    # Download individual chromosome files
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.1.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.2.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.3.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.4.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.5.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.6.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.7.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.8.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.9.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.10.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.11.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.12.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.13.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.14.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.15.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.16.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.17.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.18.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.19.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.X.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.Y.fa.gz
    wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_rm.chromosome.MT.fa.gz

    # Unzip
    gunzip Mus_musculus.GRCm38.dna_rm.chromosome.*

    # Concatenate
    cat Mus_musculus.GRCm38.dna_rm.chromosome.1.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.2.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.3.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.4.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.5.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.6.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.7.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.8.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.9.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.10.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.11.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.12.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.13.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.14.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.15.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.16.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.17.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.18.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.19.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.X.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.Y.fa \
    Mus_musculus.GRCm38.dna_rm.chromosome.MT.fa \
    BK000964.3.fa > GRCm38+rDNA_repeat.fa

    # Remove individual chromosome sequence files
    rm -f Mus_musculus.GRCm38.dna_rm.chromosome.*.fa
fi
