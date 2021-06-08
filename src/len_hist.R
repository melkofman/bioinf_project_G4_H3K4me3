source('lib.R')
###

#NAME <- 'H3K4me3_SK-N-MC.ENCFF670BFD.hg19'
#NAME <- 'H3K4me3_SK-N-MC.ENCFF982ERU.hg19'
#NAME <- 'G4_seq_Li_K'
NAME <- 'H3K4me3_SK-N-MC.intersect_with_G4_seq_Li_K'

###

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
