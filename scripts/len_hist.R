source('lib.R')
#install.packages("ggplot2")

#NAME <- 'H3K4me3_WI38.ENCFF033PCY.hg38'
#NAME <- 'H3K4me3_WI38.ENCFF033PCY.hg19'
#NAME <- 'H3K4me3_WI38.ENCFF325EOP.hg38'
#NAME <- 'H3K4me3_WI38.ENCFF325EOP.hg19'
#NAME <- 'G4_seq_Li_K'
NAME <- 'H3K4me3_WI38.intersect_with_G4_seq_Li_K.bed'

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)