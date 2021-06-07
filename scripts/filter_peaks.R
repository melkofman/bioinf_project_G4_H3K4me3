
library(dplyr)
library(ggplot2)
NAME <- 'H3K4me3_WI38.ENCFF033PCY.hg19'
#NAME <- 'H3K4me3_WI38.ENCFF325EOP.hg19'
OUT_DIR <-'Results/'

DATA_DIR <- 'hse21_H3K4me3_G4_human/data/'
###
setwd('Documents/HSE/20-21/bio/project/')
bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

# Remove long peaks
bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()

ggsave(paste0('filter_peaks.', NAME, '.filtered.hist.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file=paste0(DATA_DIR, NAME ,'.filtered.bed'),
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)