clean-evolution-of-self--control-data
================
Charmi
11/1/2017

Purpose
-------

This file imports the data from

MacLeana, Evan L., et al (2014). The evolution of self-control. PNAS, 111(20), E2140-E2148. Retrieved from <http://dx.doi.org/10.1073/pnas.1323533111> and <https://figshare.com/articles/MacLean_et_al_PNAS_2014_Self-Control_Data/5579335>

and tidies it up, creating a single data file with brain region as a variable.

The data have already been gathered and saved as separate CSVs by different sheets we made in excel in ../data/csv.

Import CSVs and create merged data file
---------------------------------------

Here are the steps we want to do for tidying and combing two separate CSV files:

1.  Import the CSV from `../data/csv/cog_task_avg_score.csv`
2.  Include the cylinder task data and A.not.B.Task data in one column, and arrange by common name.
3.  Clean out the '-' from subj\_info file.

4.  Import the CSV from `../data/csv/subj_info.csv`
5.  Make a new column for task responses as 'Y' if '\*' and 'N' if '-'.
6.  Remove the old columns with '\*' and '-' as input.
7.  Merge cog\_task\_avg\_score and subj\_info together by Common.Name.

``` r
cog <- read_csv("../data/csv/cog_task_avg_score.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Common.Name = col_character(),
    ##   Latin.Name = col_character(),
    ##   Cylinder.Task = col_character(),
    ##   A.not.B.Task = col_character(),
    ##   Composite.Score = col_character()
    ## )

``` r
cog<-cog %>%
       gather(Task, Score, Cylinder.Task: A.not.B.Task) %>% arrange(Common.Name)

#Cleaning out '-' from Score

cog$Score <- gsub('-',NA,cog$Score,fixed=TRUE)
cog$Score <- as.factor(cog$Score)

#Cleaning out '-' from Composite Score

cog$Composite.Score <- gsub('-',NA,cog$Composite.Score,fixed=TRUE)
cog$Composite.Score <- as.factor(cog$Composite.Score)
cog
```

    ## # A tibble: 72 x 5
    ##       Common.Name                   Latin.Name Composite.Score
    ##             <chr>                        <chr>          <fctr>
    ##  1 Asian elephant              Elephas maximus            <NA>
    ##  2 Asian elephant              Elephas maximus            <NA>
    ##  3        aye aye Daubentonia madagascariensis            <NA>
    ##  4        aye aye Daubentonia madagascariensis            <NA>
    ##  5    black lemur               Eulemur macaco            55.5
    ##  6    black lemur               Eulemur macaco            55.5
    ##  7         bonobo                 Pan paniscus            97.5
    ##  8         bonobo                 Pan paniscus            97.5
    ##  9    brown lemur               Eulemur fulvus            <NA>
    ## 10    brown lemur               Eulemur fulvus            <NA>
    ## # ... with 62 more rows, and 2 more variables: Task <chr>, Score <fctr>

``` r
sub_info <- read_csv("../data/csv/subj_info.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Species = col_character(),
    ##   Population = col_character(),
    ##   Subject = col_character(),
    ##   Sex = col_character(),
    ##   Age = col_character(),
    ##   Cylinder = col_character(),
    ##   A.not.B = col_character()
    ## )

``` r
names(sub_info)[1] <- "Common.Name"

A.not.B.Y <- sub_info$A.not.B == "*"
Cylinder.Y <- sub_info$Cylinder == "*"
sub_info$A.not.B.Y.N[A.not.B.Y] <- "Y"
```

    ## Warning: Unknown or uninitialised column: 'A.not.B.Y.N'.

``` r
sub_info$A.not.B.Y.N[!A.not.B.Y] <- "N"
sub_info$Cylinder.Y.N[Cylinder.Y] <- "Y"
```

    ## Warning: Unknown or uninitialised column: 'Cylinder.Y.N'.

``` r
sub_info$Cylinder.Y.N[!Cylinder.Y] <- "N"
sub_info <- sub_info %>% select(-A.not.B, -Cylinder)

sub_info
```

    ## # A tibble: 567 x 7
    ##       Common.Name                                Population   Subject
    ##             <chr>                                     <chr>     <chr>
    ##  1 Asian elephant Golden Triangle Asian Elephant Foundation        Am
    ##  2 Asian elephant Golden Triangle Asian Elephant Foundation        Bo
    ##  3 Asian elephant Golden Triangle Asian Elephant Foundation    NamFon
    ##  4 Asian elephant Golden Triangle Asian Elephant Foundation     Pepsi
    ##  5 Asian elephant Golden Triangle Asian Elephant Foundation      Ploy
    ##  6 Asian elephant Golden Triangle Asian Elephant Foundation      Puki
    ##  7 Asian elephant Golden Triangle Asian Elephant Foundation    TangMo
    ##  8        aye aye                         Duke Lemur Center Angelique
    ##  9        aye aye                         Duke Lemur Center    Ardrey
    ## 10        aye aye                         Duke Lemur Center   Caliban
    ## # ... with 557 more rows, and 4 more variables: Sex <chr>, Age <chr>,
    ## #   A.not.B.Y.N <chr>, Cylinder.Y.N <chr>

``` r
merged <- left_join(cog, sub_info, by="Common.Name")
merged
```

    ## # A tibble: 1,072 x 11
    ##       Common.Name      Latin.Name Composite.Score          Task  Score
    ##             <chr>           <chr>          <fctr>         <chr> <fctr>
    ##  1 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  2 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  3 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  4 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  5 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  6 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  7 Asian elephant Elephas maximus            <NA> Cylinder.Task   <NA>
    ##  8 Asian elephant Elephas maximus            <NA>  A.not.B.Task      0
    ##  9 Asian elephant Elephas maximus            <NA>  A.not.B.Task      0
    ## 10 Asian elephant Elephas maximus            <NA>  A.not.B.Task      0
    ## # ... with 1,062 more rows, and 6 more variables: Population <chr>,
    ## #   Subject <chr>, Sex <chr>, Age <chr>, A.not.B.Y.N <chr>,
    ## #   Cylinder.Y.N <chr>

``` r
col_order <- c("Common.Name", "Latin.Name", "A.not.B.Y.N", "Cylinder.Y.N", "Task", "Score", "Composite.Score", "Sex", "Age", "Population", "Subject")
merged_new <- merged[,col_order]
merged_new
```

    ## # A tibble: 1,072 x 11
    ##       Common.Name      Latin.Name A.not.B.Y.N Cylinder.Y.N          Task
    ##             <chr>           <chr>       <chr>        <chr>         <chr>
    ##  1 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  2 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  3 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  4 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  5 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  6 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  7 Asian elephant Elephas maximus           Y            N Cylinder.Task
    ##  8 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ##  9 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## 10 Asian elephant Elephas maximus           Y            N  A.not.B.Task
    ## # ... with 1,062 more rows, and 6 more variables: Score <fctr>,
    ## #   Composite.Score <fctr>, Sex <chr>, Age <chr>, Population <chr>,
    ## #   Subject <chr>

Clean Cylinder and A-not-B CSV files
------------------------------------

1.  Import both the csv files
2.  Change column names to make it shorter and more specific
3.  Merge both data files to make one file altogether

``` r
cyl_task <- read_csv("../data/csv/Cylinder.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Species = col_character(),
    ##   Population = col_character(),
    ##   Sex = col_character(),
    ##   `Subject #` = col_integer(),
    ##   Warmups = col_integer(),
    ##   `Test % Correct` = col_double(),
    ##   `1st Half % Correct` = col_integer(),
    ##   `2nd Half % Correct` = col_integer()
    ## )

``` r
ab_task <- read_csv("../data/csv/A-not-B.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Species = col_character(),
    ##   Population = col_character(),
    ##   Sex = col_character(),
    ##   `Sub #` = col_integer(),
    ##   `Trials to criterion` = col_integer(),
    ##   `Test Accuracy` = col_integer()
    ## )

``` r
colnames(cyl_task) <- c("Species", "Pop", "Sex", "Sub_no.", "Warmups", "Test_percent_correct", "1st_corr", "2nd_corr")
colnames(ab_task) <- c("Species", "Pop", "Sex", "Sub_no.", "Trials", "Accuracy")

cyl_task <- cyl_task %>% arrange(Species)
ab_task <- ab_task %>% arrange(Species)

cyl_task
```

    ## # A tibble: 439 x 8
    ##    Species               Pop   Sex Sub_no. Warmups Test_percent_correct
    ##      <chr>             <chr> <chr>   <int>   <int>                <dbl>
    ##  1 Aye Aye Duke Lemur Center     F       2       5                   60
    ##  2 Aye Aye Duke Lemur Center     F       3       5                   70
    ##  3 Aye Aye Duke Lemur Center     F       4       5                   80
    ##  4 Aye Aye Duke Lemur Center     F       6       4                    0
    ##  5 Aye Aye Duke Lemur Center     F       7       6                   50
    ##  6 Aye Aye Duke Lemur Center     F       8       4                   50
    ##  7 Aye Aye Duke Lemur Center     M       1       5                   80
    ##  8 Aye Aye Duke Lemur Center     M       5       8                   40
    ##  9 Aye Aye Duke Lemur Center     M       9      15                   50
    ## 10 Aye Aye Duke Lemur Center     M      10      27                   30
    ## # ... with 429 more rows, and 2 more variables: `1st_corr` <int>,
    ## #   `2nd_corr` <int>

``` r
ab_task
```

    ## # A tibble: 345 x 6
    ##        Species               Pop   Sex Sub_no. Trials Accuracy
    ##          <chr>             <chr> <chr>   <int>  <int>    <int>
    ##  1 Black lemur Duke Lemur Center     M       1      6        1
    ##  2 Black lemur Duke Lemur Center     F       2      3        1
    ##  3 Black lemur Duke Lemur Center     M       3      3        1
    ##  4 Black lemur Duke Lemur Center     F       4      3        0
    ##  5 Black lemur Duke Lemur Center     M       5      9        0
    ##  6 Black lemur Duke Lemur Center     F       6      3        0
    ##  7 Black lemur Duke Lemur Center     M       7      6        1
    ##  8 Black lemur Duke Lemur Center     M       8      3        0
    ##  9 Black lemur Duke Lemur Center     F       9     12        1
    ## 10 Black lemur Duke Lemur Center     M      10      3        1
    ## # ... with 335 more rows

Now we will change the species names to make both dataframe equal

``` r
# levels(cyl_task$Species) <- c(levels(iris$Species), "new.species")
# iris$Species[iris$Species == 'virginica'] <- 'new.species'
# merged_tasks <- left_join(cyl_task, ab_task, by="Species")
# merged_tasks
```

Let's write this to a new, clean directory (../data/cleaned)

``` r
write_csv(merged_new, path = "../data/cleaned/cog_score_and_sub_info.csv")
write_csv(cyl_task, path="../data/cleaned/cylinder_task.csv")
write_csv(ab_task, path="../data/cleaned/a_not_b_task.csv")
```
