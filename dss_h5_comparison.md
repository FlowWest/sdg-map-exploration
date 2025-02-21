H5 Stage Export Exploration
================
Maddee Rubenson (FlowWest)
2025-02-21

### Objective

Compare scenario `FPV2Mb` to baseline `H1Z` daily summary values. Note
that data was exported from the H5 here:
<https://github.com/FlowWest/sdg-dashboard/tree/hydro-exports>

### Load H5 exports

#### FPV2Mb

``` r
old_stage_export <- read_csv('data-raw/hdf5_exports/old_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "FPV2Mb") |> 
  glimpse()
```

    ## New names:
    ## Rows: 841537 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 841,537
    ## Columns: 6
    ## $ upstream_stage   <dbl> 10.432000, 10.432203, 10.435493, 10.449473, 10.476360…
    ## $ downstream_stage <dbl> 15.00800, 15.00782, 15.00829, 15.01230, 15.02278, 15.…
    ## $ Datetime         <dttm> 2016-01-01 00:00:00, 2016-01-01 00:05:00, 2016-01-01…
    ## $ channel_id       <dbl> 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 7…
    ## $ channel_name     <chr> "OLD", "OLD", "OLD", "OLD", "OLD", "OLD", "OLD", "OLD…
    ## $ scenario         <chr> "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FP…

``` r
dgl_stage_export <- read_csv('data-raw/hdf5_exports/dgl_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "FPV2Mb") |> 
  glimpse()
```

    ## New names:
    ## Rows: 841537 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 841,537
    ## Columns: 6
    ## $ upstream_stage   <dbl> 11.70000, 11.69154, 11.61403, 11.34781, 11.02404, 10.…
    ## $ downstream_stage <dbl> 11.70300, 11.69851, 11.65199, 11.46317, 11.12438, 10.…
    ## $ Datetime         <dttm> 2016-01-01 00:00:00, 2016-01-01 00:05:00, 2016-01-01…
    ## $ channel_id       <dbl> 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205…
    ## $ channel_name     <chr> "DGL", "DGL", "DGL", "DGL", "DGL", "DGL", "DGL", "DGL…
    ## $ scenario         <chr> "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FP…

``` r
mho_stage_export <- read_csv('data-raw/hdf5_exports/mho_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "FPV2Mb") |> 
  glimpse()
```

    ## New names:
    ## Rows: 841537 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 841,537
    ## Columns: 6
    ## $ upstream_stage   <dbl> 19.90700, 19.90658, 19.90628, 19.90584, 19.90514, 19.…
    ## $ downstream_stage <dbl> 25.16381, 25.16358, 25.16319, 25.16286, 25.16223, 25.…
    ## $ Datetime         <dttm> 2016-01-01 00:00:00, 2016-01-01 00:05:00, 2016-01-01…
    ## $ channel_id       <dbl> 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128…
    ## $ channel_name     <chr> "MHO", "MHO", "MHO", "MHO", "MHO", "MHO", "MHO", "MHO…
    ## $ scenario         <chr> "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FPV2Mb", "FP…

#### Baseline

``` r
base_old_stage_export <- read_csv('data-raw/hdf5_exports/old_baseline_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "baseline") |> 
  glimpse()
```

    ## New names:
    ## Rows: 459649 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 459,649
    ## Columns: 6
    ## $ upstream_stage   <dbl> 10.432000, 10.432106, 10.434470, 10.448004, 10.475823…
    ## $ downstream_stage <dbl> 15.00800, 15.00727, 15.00767, 15.01176, 15.02397, 15.…
    ## $ Datetime         <dttm> 2020-01-01 00:00:00, 2020-01-01 00:05:00, 2020-01-01…
    ## $ channel_id       <dbl> 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 7…
    ## $ channel_name     <chr> "OLD", "OLD", "OLD", "OLD", "OLD", "OLD", "OLD", "OLD…
    ## $ scenario         <chr> "baseline", "baseline", "baseline", "baseline", "base…

``` r
base_dgl_stage_export <- read_csv('data-raw/hdf5_exports/dgl_baseline_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "baseline") |> 
  glimpse()
```

    ## New names:
    ## Rows: 459649 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 459,649
    ## Columns: 6
    ## $ upstream_stage   <dbl> 11.70000, 11.69161, 11.61387, 11.34075, 10.97650, 10.…
    ## $ downstream_stage <dbl> 11.70300, 11.69861, 11.65219, 11.45976, 11.09732, 10.…
    ## $ Datetime         <dttm> 2020-01-01 00:00:00, 2020-01-01 00:05:00, 2020-01-01…
    ## $ channel_id       <dbl> 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205…
    ## $ channel_name     <chr> "DGL", "DGL", "DGL", "DGL", "DGL", "DGL", "DGL", "DGL…
    ## $ scenario         <chr> "baseline", "baseline", "baseline", "baseline", "base…

``` r
base_mho_stage_export <- read_csv('data-raw/hdf5_exports/mho_baseline_stage_export.csv') |> 
  select(-`...1`) |> 
  mutate(scenario = "baseline") |> 
  glimpse()
```

    ## New names:
    ## Rows: 459649 Columns: 6
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): channel_name dbl (4): ...1, upstream_stage, downstream_stage, channel_id
    ## dttm (1): Datetime
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## Rows: 459,649
    ## Columns: 6
    ## $ upstream_stage   <dbl> 19.90700, 19.90658, 19.90638, 19.90612, 19.90557, 19.…
    ## $ downstream_stage <dbl> 25.16381, 25.16360, 25.16328, 25.16313, 25.16269, 25.…
    ## $ Datetime         <dttm> 2020-01-01 00:00:00, 2020-01-01 00:05:00, 2020-01-01…
    ## $ channel_id       <dbl> 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128…
    ## $ channel_name     <chr> "MHO", "MHO", "MHO", "MHO", "MHO", "MHO", "MHO", "MHO…
    ## $ scenario         <chr> "baseline", "baseline", "baseline", "baseline", "base…

``` r
old_stage_export |> 
  ggplot() +
  geom_line(aes(x = Datetime, y = upstream_stage, color = "upstream")) +
  geom_line(aes(x = Datetime, y = downstream_stage, color = "downstream")) +
  theme_minimal() +
  ggtitle('OLD')
```

![](dss_h5_comparison_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
dgl_stage_export |> 
  ggplot() +
  geom_line(aes(x = Datetime, y = downstream_stage, color = "downstream"), alpha = 0.5) +
  geom_line(aes(x = Datetime, y = upstream_stage, color = "upstream"), alpha = 0.5) +
  theme_minimal() + 
  ggtitle('DGL')
```

![](dss_h5_comparison_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
mho_stage_export |> 
  ggplot() +
  geom_line(aes(x = Datetime, y = upstream_stage, color = "upstream")) +
  geom_line(aes(x = Datetime, y = downstream_stage, color = "downstream")) +
  theme_minimal() +
  ggtitle('MHO')
```

![](dss_h5_comparison_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
\#### OLD Comparison to DSS Export

``` r
ggplot() + 
  geom_line(data = old_dss_export, aes(x = Datetime, y = dss_stage_feet, color = "DSS")) +
  geom_line(data = old_stage_export, aes(x = Datetime, y = upstream_stage, color = "H5 - upstream")) +
  geom_line(data = old_stage_export, aes(x = Datetime, y = downstream_stage, color = "H5 - downstream")) +
  theme_minimal() +
  ylab('stage')
```

![](dss_h5_comparison_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->
\## Get Stage Summaries

``` r
all <- old_stage_export |> 
  full_join(dgl_stage_export) |> 
  full_join(mho_stage_export) |> 
  filter(Datetime >= "2020-01-01 00:00:00") |> # to align with baseline 
  full_join(base_old_stage_export) |> 
  full_join(base_mho_stage_export) |> 
  full_join(base_dgl_stage_export) |> 
  filter(Datetime <= "2024-01-01 00:00:00") |> 
  janitor::clean_names() |> 
  mutate(date = as.Date(datetime)) |> 
  group_by(date, channel_name, channel_id, scenario) |> 
  summarise(daily_avg = mean(c(upstream_stage, downstream_stage)),
            daily_min = min(c(upstream_stage, downstream_stage)),
            daily_max = max(c(upstream_stage, downstream_stage))) |> 
  glimpse()
```

    ## Joining with `by = join_by(upstream_stage, downstream_stage, Datetime,
    ## channel_id, channel_name, scenario)`
    ## Joining with `by = join_by(upstream_stage, downstream_stage, Datetime,
    ## channel_id, channel_name, scenario)`
    ## Joining with `by = join_by(upstream_stage, downstream_stage, Datetime,
    ## channel_id, channel_name, scenario)`
    ## Joining with `by = join_by(upstream_stage, downstream_stage, Datetime,
    ## channel_id, channel_name, scenario)`
    ## Joining with `by = join_by(upstream_stage, downstream_stage, Datetime,
    ## channel_id, channel_name, scenario)`
    ## `summarise()` has grouped output by 'date', 'channel_name', 'channel_id'. You
    ## can override using the `.groups` argument.

    ## Rows: 8,772
    ## Columns: 7
    ## Groups: date, channel_name, channel_id [4,386]
    ## $ date         <date> 2020-01-01, 2020-01-01, 2020-01-01, 2020-01-01, 2020-01-…
    ## $ channel_name <chr> "DGL", "DGL", "MHO", "MHO", "OLD", "OLD", "DGL", "DGL", "…
    ## $ channel_id   <dbl> 205, 205, 128, 128, 71, 71, 205, 205, 128, 128, 71, 71, 2…
    ## $ scenario     <chr> "FPV2Mb", "baseline", "FPV2Mb", "baseline", "FPV2Mb", "ba…
    ## $ daily_avg    <dbl> 10.852199, 10.852009, 21.962753, 21.896146, 11.616384, 11…
    ## $ daily_min    <dbl> 9.908968, 9.692212, 18.296568, 18.058360, 7.968217, 8.384…
    ## $ daily_max    <dbl> 11.79599, 11.79736, 25.41477, 25.53937, 15.07034, 15.0774…

### Compare to Baseline

*comparison = daily min, max, or mean scenario - baseline*

``` r
comparison <- all |> 
  pivot_wider(names_from = scenario,
    values_from = c(daily_avg, daily_min, daily_max)) |> 
  mutate(avg_daily_diff = daily_avg_FPV2Mb - daily_avg_baseline,
    min_daily_diff = daily_min_FPV2Mb - daily_min_baseline,
    max_daily_diff = daily_max_FPV2Mb - daily_max_baseline) |> 
  select(-c(daily_avg_FPV2Mb, daily_avg_baseline, daily_max_FPV2Mb, daily_min_baseline, daily_max_FPV2Mb, daily_max_baseline, daily_min_FPV2Mb))

comparison |> 
  na.omit() |> 
  ggplot() + 
  geom_line(aes(x = date, y = avg_daily_diff, color = "avg_daily_diff")) + 
  geom_line(aes(x = date, y = min_daily_diff, color = "min_daily_diff")) + 
  geom_line(aes(x = date, y = max_daily_diff, color = "max_daily_diff")) + 
  facet_wrap(~channel_name) + 
  ylab("stage difference (feet)")+
  theme_minimal()
```

![](dss_h5_comparison_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

``` r
knitr::knit_exit()
```
