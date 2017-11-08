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
#load data

cog_subj <- read.csv("../data/cleaned/cog_score_and_sub_info.csv")

#distinguish different types of animals

elephant <- cog_subj[which(cog_subj$Common.Name == 'Asian elephant'),]
aye_aye <- cog_subj[which(cog_subj$Common.Name == 'aye aye'),]
black_lemur <- cog_subj[which(cog_subj$Common.Name == 'black lemur'),]
bonobo <- cog_subj[which(cog_subj$Common.Name == 'bonobo'),]
brown_lemur <- cog_subj[which(cog_subj$Common.Name == 'brown lemur'),]
cap_monkey <- cog_subj[which(cog_subj$Common.Name == 'capuchin monkey'),]
chimp <- cog_subj[which(cog_subj$Common.Name == 'chimpanzee'),]
sifaka <- cog_subj[which(cog_subj$Latin.Name == 'Propithecus coquereli'),]
coyote <- cog_subj[which(cog_subj$Common.Name == 'coyote'),]
domestic_dog <- cog_subj[which(cog_subj$Common.Name == 'domestic dog'),]
eurasian_jay <- cog_subj[which(cog_subj$Common.Name == 'Eurasian jay'),]
fox_squirrel <- cog_subj[which(cog_subj$Common.Name == 'fox squirrel'),]
golden_mon <- cog_subj[which(cog_subj$Common.Name == 'golden snub-nosed monkey'),]
golden_lion_tamarin <- cog_subj[which(cog_subj$Common.Name == 'golden-headed lion tamarin'),]
gorilla <- cog_subj[which(cog_subj$Common.Name == 'gorilla'),]
gray_wolf <- cog_subj[which(cog_subj$Common.Name == 'gray wolf'),]
h_baboon <- cog_subj[which(cog_subj$Common.Name == 'hamadryus baboon'),]
lt_macaque <- cog_subj[which(cog_subj$Common.Name == 'long-tailed macaque'),]
marmoset <- cog_subj[which(cog_subj$Common.Name == 'marmoset'),]
mongol_gerbil <- cog_subj[which(cog_subj$Common.Name == 'Mongolian gerbil'),]
mongoose_lemur <- cog_subj[which(cog_subj$Common.Name == 'mongoose lemur'),]
o_baboon <- cog_subj[which(cog_subj$Common.Name == 'olive baboon'),]
amazon <- cog_subj[which(cog_subj$Common.Name == 'orange-winged amazon'),]
orangutan <- cog_subj[which(cog_subj$Common.Name == 'orangutan'),]
red_lemur <- cog_subj[which(cog_subj$Common.Name == 'red-bellied lemur'),]
r_macaque <- cog_subj[which(cog_subj$Common.Name == 'rhesus macaque'),]
ring_tailed_lemur <- cog_subj[which(cog_subj$Common.Name == 'ring-tailed lemur'),]
ruffed_lemur <- cog_subj[which(cog_subj$Common.Name == 'ruffed lemur'),]
song_sparrow <- cog_subj[which(cog_subj$Common.Name == 'song sparrow'),]
spider_monkey <- cog_subj[which(cog_subj$Common.Name == 'spider monkey'),]
squirrel_monkey <- cog_subj[which(cog_subj$Common.Name == 'squirrel monkey'),]
st_macaque <- cog_subj[which(cog_subj$Common.Name == 'stump-tailed macaque'),]
swamp_sparrow <- cog_subj[which(cog_subj$Common.Name == 'swamp sparrow'),]
west_scrub_jay <- cog_subj[which(cog_subj$Common.Name == 'western scrub jay'),]
wc_pigeon <- cog_subj[which(cog_subj$Common.Name == 'white carnea pigeon'),]
zebra_finch <- cog_subj[which(cog_subj$Common.Name == 'zebra finch'),]
```

<center>
<h2>
Plots
</h2>
</center>
<br> <br>

``` r
elephant
```

    ##       Common.Name      Latin.Name A.not.B.Y.N Cylinder.Y.N          Task
    ## 1  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 2  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 3  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 4  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 5  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 6  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 7  Asian elephant Elephas maximus           Y            N Cylinder.Task
    ## 8  Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 9  Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 10 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 11 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 12 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 13 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 14 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ##    Score Composite.Score Sex Age                                Population
    ## 1     NA              NA   F   3 Golden Triangle Asian Elephant Foundation
    ## 2     NA              NA   F  33 Golden Triangle Asian Elephant Foundation
    ## 3     NA              NA   F  10 Golden Triangle Asian Elephant Foundation
    ## 4     NA              NA   M  10 Golden Triangle Asian Elephant Foundation
    ## 5     NA              NA   F  16 Golden Triangle Asian Elephant Foundation
    ## 6     NA              NA   M  40 Golden Triangle Asian Elephant Foundation
    ## 7     NA              NA   F   4 Golden Triangle Asian Elephant Foundation
    ## 8      0              NA   F   3 Golden Triangle Asian Elephant Foundation
    ## 9      0              NA   F  33 Golden Triangle Asian Elephant Foundation
    ## 10     0              NA   F  10 Golden Triangle Asian Elephant Foundation
    ## 11     0              NA   M  10 Golden Triangle Asian Elephant Foundation
    ## 12     0              NA   F  16 Golden Triangle Asian Elephant Foundation
    ## 13     0              NA   M  40 Golden Triangle Asian Elephant Foundation
    ## 14     0              NA   F   4 Golden Triangle Asian Elephant Foundation
    ##    Subject
    ## 1       Am
    ## 2       Bo
    ## 3   NamFon
    ## 4    Pepsi
    ## 5     Ploy
    ## 6     Puki
    ## 7   TangMo
    ## 8       Am
    ## 9       Bo
    ## 10  NamFon
    ## 11   Pepsi
    ## 12    Ploy
    ## 13    Puki
    ## 14  TangMo
