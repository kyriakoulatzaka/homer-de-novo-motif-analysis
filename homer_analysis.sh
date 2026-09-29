#!/bin/bash

# HOMER de novo motif discovery
# Organism: Drosophila melanogaster
# Genome assembly: dm6
# Transcription factor: Odd-paired (Opa)

INPUT="Opa_early_3_hr_peaks_GSE140722_BED6.bed"
GENOME="dm6"
OUTPUT="homer_Opa_early_3h"

findMotifsGenome.pl \
    "$INPUT" \
    "$GENOME" \
    "$OUTPUT" \
    -size 200 \
    -mask \
    -p 4

# Inspect the top discovered motif
head -20 "$OUTPUT"/homerResults/motif1.motif

# Inspect reverse-complement motif
head -20 "$OUTPUT"/homerResults/motif1RV.motif

# List discovered motifs
grep ">" "$OUTPUT"/homerResults/motif*.motif
