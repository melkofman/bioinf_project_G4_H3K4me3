# hse21_H3K4me3_G4_human
## HSE bioinf project
### Отчет по работе над проектом. 
### Студент: Кофман М.О., группа 3
#### Начало работы 
С помощью команды wget были получены необходимые файлы:

`wget https://www.encodeproject.org/files/ENCFF023LTU/@@download/ENCFF023LTU.bed.gz`

`wget https://www.encodeproject.org/files/ENCFF432EMI/@@download/ENCFF432EMI.bed.gz`

Оставили первые пять столбцов:

`zcat ENCFF023LTU.bed.gz | cut -f1-5 > H3K4me3_GM12878.ENCFFo23LTU.hg38.bed`

`zcat ENCFF432EMI.bed.gz | cut -f1-5 > H3K4me3_GM12878.ENCFF432EMI.hg38.bed`

С помощью liftOver преобразовали координаты из 38 в 19 версию генома:

`liftOver H3K4me3_GM12878.ENCFFo23LTU.hg38.bed hg38ToHg19.over.chain.gz H3K4me3_GM12878.ENCFF023LTU.hg19.bed H3K4me3_GM12878.ENCFF023LTU.unmapped.bed`

`liftOver H3K4me3_GM12878.ENCFF432EMI.hg38.bed hg38ToHg19.over.chain.gz H3K4me3_GM12878.ENCFF432EMI.hg19.bed H3K4me3_GM12878.ENCFF432EMI.unmapped.bed`

Затем скачали на локальный ПК данные с сервера. 

#### Распределение длин участков.

[Скрипт](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/src/len_hist.R) позволяет получить диаграммы распределения длин участков. 

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF023LTU.hg19no_filter.pdf "H3K4me3_GM12878.ENCFF023.hg19 до фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFFo23LTU.hg38no_filter.pdf "H3K4me3_GM12878.ENCFFo23LTU.hg38 до фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF432EMI.hg19no_filter.pdf "H3K4me3_GM12878.ENCFF432EMI.hg19 до фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF432EMI.hg38no_filter.pdf "H3K4me3_GM12878.ENCFF432EMI.hg38 до фильтрации")

Теперь отфильтруем, уберем сильно длинные участки (>50000) с помощью [скрипта](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/src/filter_peaks.R).
Опять построим распределение длин участков и посмотрим, что изменилось: 

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF023LTU.hg19.filtered.pdf "H3K4me3_GM12878.ENCFF023LTU.hg19 после фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF432EMI.hg38.filtered.pdf "H3K4me3_GM12878.ENCFF023LTU.hg38 после фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF432EMI.hg19.filtered.pdf "H3K4me3_GM12878.ENCFF432EMI.hg19 после фильтрации")

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/len_hist.H3K4me3_GM12878.ENCFF432EMI.hg38.filtered.pdf "H3K4me3_GM12878.ENCFF432EMI.hg38 после фильтрации")

Как видим, сильных изменений не произошло, было отрезано всего лишь одно чтение. 
Для дальнейшей работы будем использовать отфильтрованные файлы 19 версии. 

Визуализируем в геномном браузере: 

`track visibility=dense name="ENCFF023LTU"  description="H3K4me3_GM12878.ENCFF023LTU.hg19.filtered.bed"
https://raw.githubusercontent.com/melkofman/bioinf_project_G4_H3K4me3/mokofman/data/H3K4me3_GM12878.ENCFF023LTU.hg19.bed`

`track visibility=dense name="ENCFF432EMI" description="H3K4me3_GM12878.ENCFF432EMI.hg19.filtered.bed"
https://raw.githubusercontent.com/melkofman/bioinf_project_G4_H3K4me3/mokofman/data/filtered/H3K4me3_GM12878.ENCFF432EMI.hg19.filtered.bed`

Как видно из визуализации, есть участки аннотации генов, которые попадают в промоторные области. 

#### Куда попадают участки по аннотации генов. 
Будем использовать библиотеку ChIPseeker и [скрипт](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/src/peakAnno.R)

Результаты: 

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/chip_seeker.H3K4me3_GM12878.ENCFF023LTU.hg19.filtered.plotAnnoPie.png "H3K4me3_GM12878.ENCFF023LTU.hg19")

Как видно по диаграмме для H3K4me3_GM12878.ENCFF023LTU.hg19, бОльшая часть попадает в промоторы. 

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/chip_seeker.H3K4me3_GM12878.ENCFF432EMI.hg19.filtered.plotAnnoPie.png "H3K4me3_GM12878.ENCFF432EMI.hg19")

Для H3K4me3_GM12878.ENCFF432EMI.hg19 картина другая, бОльшая часть попадает в интроны и экзоны. 

Ниже приведены также распределения по хромосомам. Но так-как на каждую хромосому попадает достаточно большое количество чтений, то картинки не являются сильно информативными. 

![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/chip_seeker.H3K4me3_GM12878.ENCFF023LTU.hg19.filtered.covplot.pdf "H3K4me3_GM12878.ENCFF023LTU.hg19 по хромосомам")
![alt text](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/mokofman/images/chip_seeker.H3K4me3_GM12878.ENCFF432EMI.hg19.filtered.covplot.pdf "H3K4me3_GM12878.ENCFF432EMI.hg19 по хромосомам")


