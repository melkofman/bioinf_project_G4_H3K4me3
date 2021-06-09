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

NAME <- 'H3K4me3_HeLa-S3.intersect_with_G4_seq_Li_KPDS.bed'


peaks <- toGRanges(paste0(DATA_DIR, NAME), format="BED")
peaks[1:2]

annoData <- toGRanges(TxDb.Hsapiens.UCSC.hg19.knownGene)
annoData[1:2]


anno <- annotatePeakInBatch(peaks, AnnotationData=annoData, 
                            output="overlapping", 
                            FeatureLocForDistance="TSS",
                            bindingRegion=c(-2000, 300))
data.frame(anno) %>% head()

anno$symbol <- xget(anno$feature, org.Hs.egSYMBOL)
data.frame(anno) %>% head()

anno_df <- data.frame(anno)
write.table(anno_df, file=paste0(DATA_DIR, 'H3K4me3_A549.intersect_with_DeepZ.genes.txt'),
            col.names = TRUE, row.names = FALSE, sep = '\t', quote = FALSE)

uniq_genes_df <- unique(anno_df['symbol'])
write.table(uniq_genes_df, file=paste0(DATA_DIR, 'H3K4me3_A549.intersect_with_DeepZ.genes_uniq.txt'),
            col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)
