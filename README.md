# bioinf_project_G4_H3K4me3

# hse21_H3K4me3_G4_human

UCSC GenomeBrowser session: [link](http://genome.ucsc.edu/s/nDenisenko/hg19)

## Location of ChIP-seq peaks
![ENCFF033PCY chipSeq distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/chip_seeker.H3K4me3_WI38.ENCFF033PCY.hg19.filtered.plotAnnoPie.png)
![ENCFF325EOP chipSeq distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/chip_seeker.H3K4me3_WI38.ENCFF325EOP.hg19.filtered.plotAnnoPie.png)

## Location of DNA secondary structures
![G4_seq_Li_K pie chart](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/chip_seeker.G4_seq_Li_K.plotAnnoPie.png)

## Отчет

Сначала я руками скачала оба .bed файла с ChIP-seq.

и с помощью магии zcat оставила только первые 5 столбцов  
`zcat ENCFF033PCY.bed.gz |  cut -f1-5 > H3K4me3_WI38.ENCFF033PCY.hg19.bed`  
`zcat ENCFF325EOP.bed.gz |  cut -f1-5 > H3K4me3_WI38.ENCFF325EOP.hg19.bed`   
теперь необходимо перевести координаты из hg38 в hg19, для этого скачиваем необходимые файлы  
`wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz`  
и используем liftover для непосредственного переноса  
`liftOver   H3K4me3_WI38.ENCFF033PCY.hg38.bed   hg38ToHg19.over.chain.gz   H3K4me3_WI38.ENCFF033PCY.hg19.bed   H3K4me3_WI38.ENCFF033PCY.unmapped.bed`  
`liftOver   H3K4me3_WI38.ENCFF325EOP.hg38.bed   hg38ToHg19.over.chain.gz   H3K4me3_WI38.ENCFF325EOP.hg19.bed   H3K4me3_WI38.ENCFF325EOP.unmapped.bed`

## Распределение длин пик  
Скрипт лежит в [(скрипт для распределения)](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/scripts/len_hist.R)  
[ENCFF033PCY hg19 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/len_hist.H3K4me3_WI38.ENCFF033PCY.hg19.pdf)  
[ENCFF033PCY hg38 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/len_hist.H3K4me3_WI38.ENCFF033PCY.hg38.pdf)  
[ENCFF325EOP hg19 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/len_hist.H3K4me3_WI38.ENCFF325EOP.hg19.pdf)  
[ENCFF325EOP hg38 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/len_hist.H3K4me3_WI38.ENCFF325EOP.hg38.pdf)  
Для отфильтрованных данных, полученных с помощью  [(скрипт для фильтрации)](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/scripts/filter_peaks.R)  
[ENCFF033PCY hg19 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/filter_peaks.H3K4me3_WI38.ENCFF033PCY.hg19.filtered.hist.pdf)  
[ENCFF325EOP hg19 chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/filter_peaks.H3K4me3_WI38.ENCFF325EOP.hg19.filtered.hist.pdf)  
В обоих случаях было отрезано ~400 чтений.  
Распределение вторичной структуры полученное с помощью [(скрипт для распределения)](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/scripts/len_hist.R)  
[G4_seq_Li_K chipSeq len distr](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/len_hist.G4_seq_Li_K.pdf)  

## Анализ пересечений  
Получаем пересечение с помощью bedtools:  
`bedtools intersect  -a G4_seq_Li_K.bed   -b  H3K4me3_WI38.merge.hg19.bed  >  H3K4me3_WI38.intersect_with_G4_seq_Li_K.bed`  
Как видно, у всех рассмотренных нами объектов есть общие пересечения
![browser session](https://user-images.githubusercontent.com/56645934/121186398-b9db1580-c86f-11eb-978e-580c12dd1ce7.png)


## GO-анализ

Воспользуемся [Panther](http://pantherdb.org/) и проведем анализ.  
Наиболее значимые результаты
![go analyses](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/img/photo_2021-06-08_15-42-10.jpg?raw=true)  
все категории можно посмотреть [здесь](https://github.com/nd0761/hse21_H3K4me3_G4_human/blob/master/data/pantherdb_GO_analysis.txt)
 

