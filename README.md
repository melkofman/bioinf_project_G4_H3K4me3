# bioinf_project_G4_H3K4me3
## В данном репозитории расположен проект, выполненный группой студентов 3 курса НИУ ВШЭ в рамках дисциплины "Биоинформатика".
### Над проектом трудились:
* [Кофман М.О.](https://github.com/melkofman/bioinf_project_G4_H3K4me3/tree/mokofman)
* [Ищенко А.Р.](https://github.com/student1832/hse21_H3K4me3_G4_human)
* [Денисенко Н.А.](https://github.com/nd0761/hse21_H3K4me3_G4_human)
* [Гусева П.А.](https://github.com/no-brainer/hse21_H3K4me3_G4_human)
* [Дроздова А.В.](https://github.com/ADrozdova/hse21_H3K4me3_G4_human)
* [Серебренников А.Д.](https://github.com/SerebrennikovAlexandr/hse21_H3K4me3_G4_human)
* [Егоров И.С.](https://github.com/Igor-SeVeR/hse21_H3K4me3_G4_human)
* [Сапожникова Д.А.](https://github.com/dsapoggit/hse21_H3K4me3_G4_human)
* [Шошин Борис](https://github.com/mirabu2801/hse21_H3K4me3_G4_human)
* [Барчук И.А.](https://github.com/Merkrin/hse21_H3K4me3_G4_human)
* [Войтецкий А.](https://github.com/MrARVO/hse21_H3K4me3_G4_human)
* [Колядин Д.](https://github.com/d1kolyadin/hse21_H3K4me3_G4_human)

#### Что здесь можно найти.
В ветках, названия которых соответствуют инициалам каждого участника группы, находятся индивидуальные результаты работы.
Как правило, в папках data расположены исходные и полученные в результате работы данные. В images(results) можно найти диаграммы распределения длин, а также круговые диаграммы, которые показывают, куда попадают участки по аннотации генов. В папке src представлены скрипты, использованные при работе.

#### С чем мы работали.
Для анализа использовались:
  * Организм: человек, сборка генома hg19.
  * Вторичная структура ДНК: G-квадруплексы.
  * Гистоновая метка: H3K4me3.
  * Типы клеток: GM12878, DND-41, WI38, H9, SK-N-MC, H1, HeLa-S3, HepG2, А549.

#### Командные результаты
Был создан общий `.bed` [файл](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_data/total_intersect.bed) с пересечением всех индивидуальных пересечений для дальнейшего исследования и для него было получено [распределение пиков по длинам](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_data/len_hist.total_intersect.png) и [аннотация по участкам генов](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_data/chip_seeker.total_intersect.plotAnnoPie.png).
По [ссылке](https://genome.ucsc.edu/s/SerebrennikovAlexandr/minor_bioinformatics_group) можно перейти в сессию геномного браузера с визуализацией полученных результатов.

Далее были получены [список ассоциированных с генами пиков](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_data/total_intersect.genes.txt) и [список уникальных генов](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_data/total_intersect.genes_uniq.txt) и был проведен GO-анализ для [биологической](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_analizes/analysis-bio.txt) и [молекулярной](https://github.com/melkofman/bioinf_project_G4_H3K4me3/blob/main/general_analizes/analysis-mol.txt) функций.

Презентацию проекта можно найти по [ссылке](https://docs.google.com/presentation/d/1fHt9A1bpZcLjFHenev61ol-rKMtodNAvxG6R4VcET-Q/edit?usp=sharing), в ней представлены графики для индивидуальных экспериментов, обзор исходных файлов и обсуждение результатов GO-анализа.

С вопросами можно обратиться к Егорову Игорю в телеграме @typicalSeVeR или по почте isegorov@edu.hse.ru
