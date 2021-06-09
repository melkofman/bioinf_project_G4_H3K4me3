if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DO.db")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
BiocManager::install("ChIPseeker")
BiocManager::install("GO.db")
BiocManager::install("ChIPpeakAnno")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("clusterProfiler")
#
library(ggplot2)
library(dplyr)
library(tidyr)
library(tibble)

DATA_DIR <- 'D:/R/data/'
OUT_DIR <- 'D:/R/images'

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)
library(clusterProfiler)
library(ChIPpeakAnno)

setwd("D:/R")
list.files()

library(clusterProfiler)

NAME <- 'G4_seq_Li_KPDS.hg19'
#NAME <- 'H3K4me3_HeLa-S3.ENCFF469OXD.hg19'
#NAME <- 'H3K4me3_HeLa-S3.ENCFF904UJC.hg19.filtered'

BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 