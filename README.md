# hse21_H3K4me3_G4_human

Изначально скачаем исходные .bed файлы, конвертируе их к hg19 и постороим гистограмы распределения длин.
### ENCFF982DUT нв сборке hg38
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.H3K4me3_HepG2.ENCFF982DUT.hg38-1.png)
### ENCFF982DUT нв сборке hg19
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.H3K4me3_HepG2.ENCFF982DUT.hg19-1.png)
### ENCFF549DKP нв сборке hg38
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.H3K4me3_HepG2.ENCFF549DKP.hg38-1.png)
### ENCFF549DKP нв сборке hg19
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.H3K4me3_HepG2.ENCFF549DKP.hg19-1.png)

### Теперь уберем слишком длинные, те которые больше 4000 и опять построим гистограмы
ENCFF982DUT
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/filter_peaks.H3K4me3_HepG2.ENCFF982DUT.hg19.filtered.hist-1.png)
ENCFF549DKP
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/filter_peaks.H3K4me3_HepG2.ENCFF549DKP.hg19.filtered.hist-1.png)

## Теперь посмтрим, где располагаются пики гистоновой метки относительно аннотированных генов
ENCFF982DUT
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/imageschip_seeker.H3K4me3_HepG2.ENCFF982DUT.hg19.filtered.plotAnnoPie-1.png)
ENCFF549DKP
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/imageschip_seeker.H3K4me3_HepG2.ENCFF549DKP.hg19.filtered.plotAnnoPie-1.png)

## Скачаем файл вторичной структуры ДНК и посмотрим распредление длин 
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.G4_seq_Li_K-1.png)

## Построим распрделение вторичной структуры
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/imageschip_seeker.G4_seq_Li_K.plotAnnoPie-1.png)

## Получим файл пересечение пиков и вторичной структуры ДНК. Построим для него гистограмму
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/len_hist.H3K4me3_HepG2.intersect_with_G4_seq_Li_K-1.png)

## Визуализируем полученные пересечения в GenomeBrowser

[Сессия](http://genome.ucsc.edu/cgi-bin/hgTracks?db=hg19&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr1%3A761342%2D764171&hgsid=1124017143_lq4L2DYPbV0jlbBXBGZtDFjaXYQ2)
![Скрин](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/GenomeBrowser.jpg)

## Произведем ассоциацию пиков с генами
### Число пиков, которые могу быть проассацированны с геном: 12700
### Число уникальных генов: 7824

## GO анализ
![alt text](https://github.com/mirabu2801/hse21_H3K4me3_G4_human/blob/master/images/go.jpg)

### Наиболее значимые категории
- histone acetylation
- response to endoplasmic reticulum stress
- regulation of supramolecular fiber organization
