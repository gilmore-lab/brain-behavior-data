clean-evolution-of-self--control-data
================
Charmi
11/1/2017

Purpose
-------

This file imports the data from

MacLeana, Evan L., et al (2014). The evolution of self-control. PNAS, 111(20), E2140-E2148. Retrieved from <http://dx.doi.org/10.1073/pnas.1323533111>

and tidies it up, creating a single data file with brain region as a variable.

The data have already been gathered and saved as separate CSVs by different sheets we made in excel in ../data/csv.

Import CSVs and create merged data file
---------------------------------------

Here are the steps we want to do for all of the evolution-of-self-control-specific files:

1.  Import the CSV from `../data/csv/<brain-area>.csv`
2.  Delete the second row since it contains comments we do not need.
3.  Rename the variables to be shorter and more transparent
4.  Add a variable called `Brain_area` equal to `<brain-area>`.
5.  Clean data fields with +/- char

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
cog
```

    ## # A tibble: 72 x 5
    ##       Common.Name                   Latin.Name Composite.Score
    ##             <chr>                        <chr>           <chr>
    ##  1 Asian elephant              Elephas maximus               -
    ##  2 Asian elephant              Elephas maximus               -
    ##  3        aye aye Daubentonia madagascariensis               -
    ##  4        aye aye Daubentonia madagascariensis               -
    ##  5    black lemur               Eulemur macaco            55.5
    ##  6    black lemur               Eulemur macaco            55.5
    ##  7         bonobo                 Pan paniscus            97.5
    ##  8         bonobo                 Pan paniscus            97.5
    ##  9    brown lemur               Eulemur fulvus               -
    ## 10    brown lemur               Eulemur fulvus               -
    ## # ... with 62 more rows, and 2 more variables: Task <chr>, Score <chr>

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
    ##       Common.Name      Latin.Name Composite.Score          Task Score
    ##             <chr>           <chr>           <chr>         <chr> <chr>
    ##  1 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  2 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  3 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  4 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  5 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  6 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  7 Asian elephant Elephas maximus               - Cylinder.Task     -
    ##  8 Asian elephant Elephas maximus               -  A.not.B.Task     0
    ##  9 Asian elephant Elephas maximus               -  A.not.B.Task     0
    ## 10 Asian elephant Elephas maximus               -  A.not.B.Task     0
    ## # ... with 1,062 more rows, and 6 more variables: Population <chr>,
    ## #   Subject <chr>, Sex <chr>, Age <chr>, A.not.B.Y.N <chr>,
    ## #   Cylinder.Y.N <chr>

``` r
# Import_clean_area_data <- function(fn) {
#   # Import and clean a file containing brain-area-specific data
#   # Returns a new data frame
#   df <- read.csv(file = fn, skip = 2)
#   df <- df[-1,] # Comments are now first row
#   names(df) <- c("Species", "Order", "Mass_g", "Mass_SD", 
#                  "N_neurons", "N_neurons_SD",
#                  "N_other", "N_other_SD",
#                  "Neurons_per_mg", "Neurons_per_mg_SD",
#                  "Other_per_mg", "Other_per_mg_SD",
#                  "Other_per_neuron", "Other_per_neuron_SD",
#                  "Source")
#   file_name <- strsplit(basename(fn), "\\.")[[1]][1]
#   df$Brain_area <- file_name
#   df
# }
```

If we map a file-specific function across a list of the files, we can merge the list into a single data frame using `Reduce()`.

``` r
# Clean all csv's then drop whole_brain because it has different columns
# fl <- list.files(path = "../data/csv", pattern = "\\.csv$", full.names = TRUE)
# sapply(fl, Drop_plus_minus)
# 
# fl_clean <- list.files(path = "../data/csv", pattern = "\\.clean$", full.names = TRUE)
# fl_clean <- fl_clean[!(fl_clean %in% "../data/csv/whole_brain.csv.clean")]
# if (length(fl_clean)) {
#   df_list <- lapply(fl_clean, Import_clean_area_data)
#   df_merged <- Reduce(function(x,y) merge(x, y, all=TRUE), df_list)
# } else {
#   warning("File list empty.")
# }
```

Let's write this to a new, clean directory (../data/cleaned)

``` r
# write_csv(df_merged, path = "../data/cleaned/herculano-houtzel-all.csv")
```

To-dos
------

-   ~~This would be even cleaner if we dropped the "± " from the \*\_SD columns.~~ 2017-10-03
-   Parameterize file names and paths.
