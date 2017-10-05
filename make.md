make
================
Rick Gilmore
2017-10-05 10:28:13

Purpose
-------

This file updates the data files in this repository. It

1.  Runs the gathering functions in `gather/`
2.  Runs the cleaning functions in `clean/`

``` r
rmarkdown::render("gather/gather-herculano-houtzel-etal-2015.Rmd")
```

    ## 
    ## 
    ## processing file: gather-herculano-houtzel-etal-2015.Rmd

    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |.......                                                          |  11%
    ##    inline R code fragments
    ## 
    ## 
      |                                                                       
      |..............                                                   |  22%
    ## label: unnamed-chunk-2 (with options) 
    ## List of 1
    ##  $ include: logi FALSE
    ## 
    ## 
      |                                                                       
      |......................                                           |  33%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |.............................                                    |  44%
    ## label: download-xlsx
    ## 
      |                                                                       
      |....................................                             |  56%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |...........................................                      |  67%
    ## label: unnamed-chunk-3
    ## 
      |                                                                       
      |...................................................              |  78%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |..........................................................       |  89%
    ## label: save-csv
    ## 
      |                                                                       
      |.................................................................| 100%
    ##   ordinary text without R code

    ## output file: gather-herculano-houtzel-etal-2015.knit.md

    ## /usr/lib/rstudio-server/bin/pandoc/pandoc +RTS -K512m -RTS gather-herculano-houtzel-etal-2015.utf8.md --to markdown_github-ascii_identifiers --from markdown+autolink_bare_uris+tex_math_single_backslash --output gather-herculano-houtzel-etal-2015.md --standalone --template /storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/default.md 
    ## /usr/lib/rstudio-server/bin/pandoc/pandoc +RTS -K512m -RTS gather-herculano-houtzel-etal-2015.md --to html --from markdown_github-ascii_identifiers --output gather-herculano-houtzel-etal-2015.html --standalone --self-contained --highlight-style pygments --template /storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/preview.html --variable 'github-markdown-css:/storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/github.css' --email-obfuscation none

    ## 
    ## Preview created: /tmp/Rtmp8NAPP1/preview-69b069b641e0.html

    ## 
    ## Output created: gather-herculano-houtzel-etal-2015.md

``` r
rmarkdown::render("clean/clean-herculano-houtzel-etal-2015-data.Rmd")
```

    ## 
    ## 
    ## processing file: clean-herculano-houtzel-etal-2015-data.Rmd

    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |......                                                           |   9%
    ##    inline R code fragments
    ## 
    ## 
      |                                                                       
      |............                                                     |  18%
    ## label: hh-setup (with options) 
    ## List of 1
    ##  $ include: logi FALSE
    ## 
    ## 
      |                                                                       
      |..................                                               |  27%
    ##    inline R code fragments
    ## 
    ## 
      |                                                                       
      |........................                                         |  36%
    ## label: define-text-file-cleaning-functions
    ## 
      |                                                                       
      |..............................                                   |  45%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |...................................                              |  55%
    ## label: define-clean-dataframe-function
    ## 
      |                                                                       
      |.........................................                        |  64%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |...............................................                  |  73%
    ## label: map-across-list-and-merge
    ## 
      |                                                                       
      |.....................................................            |  82%
    ##    inline R code fragments
    ## 
    ## 
      |                                                                       
      |...........................................................      |  91%
    ## label: export-merged
    ## 
      |                                                                       
      |.................................................................| 100%
    ##   ordinary text without R code

    ## output file: clean-herculano-houtzel-etal-2015-data.knit.md

    ## /usr/lib/rstudio-server/bin/pandoc/pandoc +RTS -K512m -RTS clean-herculano-houtzel-etal-2015-data.utf8.md --to markdown_github-ascii_identifiers --from markdown+autolink_bare_uris+tex_math_single_backslash --output clean-herculano-houtzel-etal-2015-data.md --standalone --template /storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/default.md 
    ## /usr/lib/rstudio-server/bin/pandoc/pandoc +RTS -K512m -RTS clean-herculano-houtzel-etal-2015-data.md --to html --from markdown_github-ascii_identifiers --output clean-herculano-houtzel-etal-2015-data.html --standalone --self-contained --highlight-style pygments --template /storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/preview.html --variable 'github-markdown-css:/storage/home/csm5410/R/x86_64-redhat-linux-gnu-library/3.4/rmarkdown/rmarkdown/templates/github_document/resources/github.css' --email-obfuscation none

    ## 
    ## Preview created: /tmp/Rtmp8NAPP1/preview-69b01c28169b.html

    ## 
    ## Output created: clean-herculano-houtzel-etal-2015-data.md
