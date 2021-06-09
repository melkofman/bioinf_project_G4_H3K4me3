if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DO.db")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
BiocManager::install("ChIPseeker")
BiocManager::install("GO.db")
BiocManager::install("ChIPpeakAnno")
 
#
library(ggplot2)
library(dplyr)
library(tidyr)
library(tibble)

DATA_DIR <- 'D:/R/data/'
OUT_DIR <- 'D:/R/images'

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)


library(ChIPpeakAnno)

setwd("D:/R")
list.files()

NAME <- 'H3K4me3_HeLa-S3.intersect_with_G4_seq_Li_KPDS'

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)

