# De novo motif analysis using HOMER

## Overview

This project performs de novo transcription factor motif discovery on ChIP-seq peak regions from *Drosophila melanogaster* using HOMER.

The analysis was designed to identify enriched DNA sequence motifs within Opa-bound genomic regions during early embryogenesis and to examine their similarity to known transcription factor motifs.

## Dataset

- Organism: *Drosophila melanogaster*
- Genome assembly: dm6
- Transcription factor: Odd-paired (Opa)
- Input: ChIP-seq peaks in BED format
- Dataset accession: GSE140722

## Workflow

1. Install HOMER and the dm6 genome.
2. Prepare ChIP-seq peak coordinates in BED format.
3. Perform de novo motif discovery using `findMotifsGenome.pl`.
4. Inspect enriched motifs and sequence logos.
5. Compare de novo motifs with known transcription factor motifs.
6. Extract motif PWMs for downstream analysis.
7. Examine forward and reverse-complement motif representations.

## Main HOMER command

```bash
findMotifsGenome.pl \
    Opa_early_3_hr_peaks_GSE140722_BED6.bed \
    dm6 \
    homer_Opa_early_3h \
    -size 200 \
    -mask \
    -p 4
```

## Parameters

- `-size 200`: analyzes a 200 bp region centered on each peak.
- `-mask`: masks repetitive genomic sequences.
- `-p 4`: uses four CPU cores.

## Output

HOMER generates several output files, including:

- `homerResults.html`
- `knownResults.html`
- `homerResults/motif1.motif`
- `homerResults/motif1RV.motif`
- `homerResults/motif1.logo.svg`

These files provide:

- de novo motif enrichment results
- known motif enrichment results
- position weight matrices (PWMs)
- sequence logos
- enrichment statistics
- motif frequencies in target and background sequences

## Example motif inspection

```bash
head -20 homer_Opa_early_3h/homerResults/motif1.motif

head -20 homer_Opa_early_3h/homerResults/motif1RV.motif

grep ">" homer_Opa_early_3h/homerResults/motif*.motif
```

## Interpretation

For each motif, HOMER reports:

- enrichment P-value
- percentage of target sequences containing the motif
- percentage of background sequences containing the motif
- similarity to known transcription factor motifs

The resulting PWM can be used for downstream motif scanning within candidate regulatory regions.

## Tools

- HOMER
- Linux / WSL
- UCSC Genome Browser
- BED-formatted genomic intervals


## Repository structure

```text
.
├── homer_analysis.sh
├── figures/
│   ├── Opa_early_motif1_logo.svg
│   └── Opa_late_motif1_logo.svg
├── results/
│   ├── Opa_early_motif1.info.html
│   └── Opa_late_motif1.info.html
└── README.md
```

## Results

The top de novo motif identified in the Opa early dataset was:

`CNCAGCRGGDGG`

- Enrichment p-value: `1e-992`
- Target sequences containing motif: `18.07%`

The top de novo motif identified in the Opa late dataset was:

`CCMCCCGCTGNG`

- Enrichment p-value: `1e-855`
- Target sequences containing motif: `17.51%`

### Motif logos

#### Opa early

![Opa early motif](./figures/Opa_early_motif1_logo.svg)

#### Opa late

![Opa late motif](./figures/Opa_late_motif1_logo.svg)

Both early and late Opa ChIP-seq datasets showed strong enrichment for Opa-like sequence motifs, with comparable motif occurrence in target regions.


## Biological context

This analysis forms part of a broader investigation of transcriptional regulation and enhancer activity during early *Drosophila melanogaster* embryogenesis.
