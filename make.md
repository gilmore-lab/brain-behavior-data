make
================
Rick Gilmore
2017-10-03 07:14:45

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

    ## /Applications/RStudio.app/Contents/MacOS/pandoc/pandoc +RTS -K512m -RTS gather-herculano-houtzel-etal-2015.utf8.md --to html --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output gather-herculano-houtzel-etal-2015.html --smart --email-obfuscation none --self-contained --standalone --section-divs --template /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rmarkdown/rmd/h/default.html --no-highlight --variable highlightjs=1 --variable 'theme:bootstrap' --include-in-header /var/folders/4w/c4zm1ghx0jq994mlryh37jdh0000gv/T//RtmpJG8rJo/rmarkdown-strc8b164b46936.html --mathjax --variable 'mathjax-url:https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'

    ## 
    ## Output created: gather-herculano-houtzel-etal-2015.html

``` r
rmarkdown::render("clean/clean-h-h-data.Rmd")
```

    ## 
    ## 
    ## processing file: clean-h-h-data.Rmd

    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |.......                                                          |  11%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |..............                                                   |  22%
    ## label: hh-setup (with options) 
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
    ## label: define-import-function
    ## 
      |                                                                       
      |....................................                             |  56%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |...........................................                      |  67%
    ## label: map-across-list-and-merge
    ## 
      |                                                                       
      |...................................................              |  78%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |..........................................................       |  89%
    ## label: export-merged
    ## 
      |                                                                       
      |.................................................................| 100%
    ##   ordinary text without R code

    ## output file: clean-h-h-data.knit.md

    ## /Applications/RStudio.app/Contents/MacOS/pandoc/pandoc +RTS -K512m -RTS clean-h-h-data.utf8.md --to markdown_github-ascii_identifiers --from markdown+autolink_bare_uris+tex_math_single_backslash --output clean-h-h-data.md --standalone --template /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rmarkdown/rmarkdown/templates/github_document/resources/default.md 
    ## /Applications/RStudio.app/Contents/MacOS/pandoc/pandoc +RTS -K512m -RTS clean-h-h-data.md --to html --from markdown_github-ascii_identifiers --output clean-h-h-data.html --standalone --self-contained --highlight-style pygments --template /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rmarkdown/rmarkdown/templates/github_document/resources/preview.html --variable 'github-markdown-css:/Library/Frameworks/R.framework/Versions/3.4/Resources/library/rmarkdown/rmarkdown/templates/github_document/resources/github.css' --email-obfuscation none

    ## 
    ## Preview created: clean-h-h-data.html

    ## 
    ## Output created: clean-h-h-data.md
