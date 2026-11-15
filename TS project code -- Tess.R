#Time Series Project code -- Tess
require(tidyverse)
require(TSA)

library(readr)
basotho_wool <- read_csv("basotho_wool.csv")

basotho_wool = basotho_wool |>
  select(ref_year, ref_month, net_wgt) |>
  group_by(ref_year, ref_month) |>
  summarise(total_wgt = sum(net_wgt, na.rm = TRUE), .groups = "drop")

ts_wool = basotho_wool |>
  select(total_wgt)

ts_wool = ts(ts_wool)

plot(ts_wool)

acf(ts_wool)
acf(diff(ts_wool))

pacf(ts_wool)

eacf(ts_wool)

ts.plot(diff(ts_wool))
ts.plot(diff(log(ts_wool)))
