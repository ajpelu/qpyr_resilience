library('rmarkdown')

machine <- 'ajpelu'
# machine <- 'ajpeluLap'
di <- paste('/Users/', machine, '/Dropbox/phd/phd_repos/qpyr_resilience', sep='')

setwd(paste0(di, '/man'))


render(input='abstractMEDECOS_2017.Rmd',
       output_format=c('word_document','md_document'),
       output_options = as.list('markdown_github'))