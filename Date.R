library(tidyverse)
library(lubridate)
today()
now()

#year-month-day date format
ymd("2021-01-20")

#month-day-year date format
mdy("January 21st, 2021")


#date-time format
#hour-minutes-seconds
ymd_hms("2021-01-20 20:11:59")

#hours and minutes
mdy_hm("01/20/2021 08:01")
