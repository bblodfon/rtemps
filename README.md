# r-templates

My personal favourite R templates :)

## Install

Run:
```r
devtools::install_github("bblodfon/rtemps")
```

Once the templates are installed, you can use them in 2 ways:

- Within the R Markdown templates in **RStudio**: `File` > `New File` > `R Markdown...` > `From Template`.
- By calling the `create_rtemp()` function which allows you to create a new directory with all the template files inside, ready to be used. For example:

```r
rtemps::create_rtemp(dirname = "my_dir", template = "united_html")
rmarkdown::render(input = "my_dir/test.Rmd", output_format = "html_document", output_dir = "my_dir")
```
