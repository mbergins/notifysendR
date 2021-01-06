
# notifysendR

<!-- badges: start -->
<!-- badges: end -->

The goal of notifysendR is to wrap the "notify-send" command available for linux
systems. This package makes a single command available, "notify_send" with all
the same options as the command line version.

## Installation

You can install the released version of notifysendR using devtools:

``` r
devtools::install_github('mbergins/notifysendR')
```

## Example

The only exported command "notify_send" can be used by itself at any point 
during a script to cause a nofication popup:

``` r
library(notifysendR)

#Your Long Running Code Section...
#
#

notify_send('Job finished')
```

The command can also be used in a tidyverse-style pipe, where the default "Your Job Completed" message will be used.

``` r
library(tidyverse); 
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean_mpg = mean(mpg)) %>%
  notify_send()
```

