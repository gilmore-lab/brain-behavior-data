evolution-of-self--control-plots
================
Charmi Mehta
11/2/2017

<center>
<h1>
Goals
</h1>
<br> <i>Load data</i>
</center>
``` r
#Load data

ab_task <- read.csv("../data/cleaned/ab_task.csv")
cyl_task <- read.csv("../data/cleaned/cyl_task.csv")

colnames(cyl_task) <- c("Species", "Pop", "Sex", "Sub_no.", "Warmups", "Test_percent_correct", "1st_corr", "2nd_corr")

#Distinguish different types of animals for A-not-B task

elephant.ab <- ab_task[which(ab_task$Species == 'Asian Elephant'),]
black_lemur.ab <- ab_task[which(ab_task$Species == 'Black lemur'),]
bonobo.ab <- ab_task[which(ab_task$Species == 'Bonobo'),]
capuchin.ab <- ab_task[which(ab_task$Species == 'Capuchin'),]
chimp.ab <- ab_task[which(ab_task$Species == 'Chimpanzee'),]
coquerels_sifaka.ab <- ab_task[which(ab_task$Species == "Coquerel's sifaka"),]
coyote.ab <- ab_task[which(ab_task$Species == 'Coyote'),]
dog.ab <- ab_task[which(ab_task$Species == 'Domestic Dog'),]
eurasian_jay.ab <- ab_task[which(ab_task$Species == 'Eurasian jay'),]
fox_squirrel.ab <- ab_task[which(ab_task$Species == 'Fox squirrel'),]
golden_monkey.ab <- ab_task[which(ab_task$Species == 'Golden monkey'),]
gorilla.ab <- ab_task[which(ab_task$Species == 'Gorilla'),]
hamadryus_baboon.ab <- ab_task[which(ab_task$Species == 'Hamadryus baboon'),]
long_tailed_macaque <- ab_task[which(ab_task$Species == 'Long-tailed macaque'),]
marmoset <- ab_task[which(ab_task$Species == 'Marmoset'),]
mongolian_gerbil.ab <- ab_task[which(ab_task$Species == 'Mongolian gerbil'),]
mongoose_lemur.ab <- ab_task[which(ab_task$Species == 'Mongoose lemur'),]
olive_baboon.ab <- ab_task[which(ab_task$Species == 'Olive baboon'),]
orange_winged_amazon.ab <- ab_task[which(ab_task$Species == 'Orange-winged Amazon'),]
orangutan.ab <- ab_task[which(ab_task$Species == 'Orangutan'),]
ring_tailed_lemur.ab <- ab_task[which(ab_task$Species == 'Ring-tailed lemur'),]
ruffed_lemur.ab <- ab_task[which(ab_task$Species == 'Ruffed lemur'),]
spider_monkey.ab <- ab_task[which(ab_task$Species == 'Spider monkey'),]
squirrel_monkey.ab <- ab_task[which(ab_task$Species == 'Squirrel monkey'),]
stump_tailed_macaque.ab <- ab_task[which(ab_task$Species == 'Stump-tailed macaque'),]
western_scrub_jay.ab <- ab_task[which(ab_task$Species == 'Western scrub jay'),]
white_carneau_pigeon.ab <- ab_task[which(ab_task$Species == 'White Carneau Pigeon'),]

#Distinguish different types of animals for Cylinder task

aye_aye.cyl <- cyl_task[which(cyl_task$Species == 'Aye Aye'),]
black_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Black Lemur'),]
bonobo.cyl <- cyl_task[which(cyl_task$Species == 'Bonobo'),]
brown_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Brown lemur'),]
capuchin.cyl <- cyl_task[which(cyl_task$Species == 'Capuchin'),]
chimp.cyl <- cyl_task[which(cyl_task$Species == 'Chimpanzee'),]
coquerels_sifaka.cyl <- cyl_task[which(cyl_task$Species == "Coquerel's sifaka"),]
coyote.cyl <- cyl_task[which(cyl_task$Species == 'Coyote'),]
dog.cyl <- cyl_task[which(cyl_task$Species == 'Domestic Dog'),]
eurasian_jay.cyl <- cyl_task[which(cyl_task$Species == 'Eurasian jay'),]
fox_squirrel.cyl <- cyl_task[which(cyl_task$Species == 'Fox squirrel'),]
golden_monkey.cyl <- cyl_task[which(cyl_task$Species == 'Golden monkey'),]
golden_lion_tamarin.cyl <- cyl_task[which(cyl_task$Species == 'Golden-headed lion tamarin'),]
gorilla.cyl <- cyl_task[which(cyl_task$Species == 'Gorilla'),]
gray_wolf.cyl <- cyl_task[which(cyl_task$Species == 'Gray wolf'),]
hamadryus_baboon.cyl <- cyl_task[which(cyl_task$Species == 'Hamadryus baboon'),]
marmoset.cyl <- cyl_task[which(cyl_task$Species == 'Marmoset'),]
mongolian_gerbil.cyl <- cyl_task[which(cyl_task$Species == 'Mongolian gerbil'),]
mongoose_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Mongoose lemur'),]
olive_baboon.cyl <- cyl_task[which(cyl_task$Species == 'Olive baboon'),]
orange_winged_amazon.cyl <- cyl_task[which(cyl_task$Species == 'Orange-winged Amazon'),]
orangutan.cyl <- cyl_task[which(cyl_task$Species == 'Orangutan'),]
red_bellied_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Red-bellied lemur'),]
rhesus_macaque.cyl <- cyl_task[which(cyl_task$Species == 'Rhesus macaque'),]
ring_tailed_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Ring-tailed Lemur'),]
ruffed_lemur.cyl <- cyl_task[which(cyl_task$Species == 'Ruffed Lemur'),]
song_sparrow.cyl <- cyl_task[which(cyl_task$Species == 'Song sparrow'),]
squirrel_monkey.cyl <- cyl_task[which(cyl_task$Species == 'Squirrel monkey'),]
swamp_sparrow.cyl <- cyl_task[which(cyl_task$Species == 'Swamp sparrow'),]
western_scrub_jay.cyl <- cyl_task[which(cyl_task$Species == 'Western scrub jay'),]
white_carneau_pigeon.cyl <- cyl_task[which(cyl_task$Species == 'White Carneau Pigeon'),]
zebra_finch.cyl <- cyl_task[which(cyl_task$Species == 'Zebra Finch'),]
```

<center>
<h2>
Plots
</h2>
</center>
<br> <br>

``` r
bl_lem.cyl.m <- black_lemur.cyl[which(black_lemur.cyl$Sex == 'M'),]
bl_lem.cyl.f <- black_lemur.cyl[which(black_lemur.cyl$Sex == 'F'),]
black_lemur.cyl <- black_lemur.cyl %>% arrange(Sex)
black_lemur.cyl
```

    ##        Species               Pop Sex Sub_no. Warmups Test_percent_correct
    ## 1  Black Lemur Duke Lemur Center   F       2       4                   80
    ## 2  Black Lemur Duke Lemur Center   F       3       5                   70
    ## 3  Black Lemur Duke Lemur Center   F       5       5                   10
    ## 4  Black Lemur Duke Lemur Center   M       1       5                   30
    ## 5  Black Lemur Duke Lemur Center   M       4       4                   50
    ## 6  Black Lemur Duke Lemur Center   M       6       4                   60
    ## 7  Black Lemur Duke Lemur Center   M       7       6                   50
    ## 8  Black Lemur Duke Lemur Center   M       8       5                   70
    ## 9  Black Lemur Duke Lemur Center   M       9       5                   20
    ## 10 Black Lemur Duke Lemur Center   M      10       9                   70
    ##    1st_corr 2nd_corr
    ## 1        60      100
    ## 2        80       60
    ## 3         0       20
    ## 4        20       40
    ## 5        40       60
    ## 6        40       80
    ## 7        40       60
    ## 8        60       80
    ## 9        20       20
    ## 10       60       80

``` r
# first_corr <- black_lemur.cyl$first_corr
# black_lemur.cyl %>%
#   ggplot() +
#   aes(x= black_lemur.cyl$Test_percent_correct, y= black_lemur.cyl$first_corr) +
#   geom_histogram()
```
