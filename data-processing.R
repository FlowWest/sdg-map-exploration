#dss_hydro_output
read_csv('data-raw/fpv1ma_hydro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11) |>
  saveRDS("data/fpv1ma_hydro_stage.RDS")

#dss_output_baseline
read_csv('data-raw/h1z_hdro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11,
         lubridate::year(datetime) %in% 2020:2023) |>
  saveRDS("data/h1z_hdro_stage.RDS")

#dss_hydro_output_fpv2ma
read_csv('data-raw/fpv2ma_hydro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11,
         # filter to years that align with baseline
         lubridate::year(datetime) %in% 2020:2023) |> #2016 2017 2018 2019 2020 2021 2022 2023
  saveRDS("data/fpv2ma_hydro_stage.RDS")

channels <- sf::read_sf('data-raw/fc2024.01_chan/FC2024.01_channels_centerlines.shp') |>
  saveRDS('data/channels_shp.RDS')

channels_with_numbers <- read_csv('data-raw/channel_names_from_h5.csv') |>
  filter(distance != "length",
         variable == "stage",
         file == "./output/FPV2Mb_hydro.dss") |>
  saveRDS('data/channels_with_numbers_stage.RDS')


# data processing of summary stats ----------------------------------------

# Summarize hydro output
summarize_hydro <- function(data) {
  data |>
    mutate(node = toupper(node)) |>
    group_by(node, month = month(datetime), year = year(datetime)) |>
    summarise(
      min_stage = min(value, na.rm = TRUE),
      max_stage = max(value, na.rm = TRUE),
      mean_stage = mean(value, na.rm = TRUE),
      .groups = "drop"
    )
}

dss_hydro_summary <- summarize_hydro(dss_hydro_output) |>
  mutate(scenario = "FPV2MA")

dss_hydro_summary_baseline <- summarize_hydro(dss_output_baseline) |>
  mutate(scenario = "baseline")

# Combine summaries
hydro_summary <- dss_hydro_summary_baseline |>
  full_join(dss_hydro_summary, by = c('node', 'month', 'year')) |>
  group_by(node, month, year) |>
  summarise(
    min_diff = diff(c(min_stage.x, min_stage.y), na.rm = TRUE),
    mean_diff = diff(c(mean_stage.x, mean_stage.y), na.rm = TRUE),
    max_diff = diff(c(max_stage.x, max_stage.y), na.rm = TRUE),
    .groups = "drop"
  )

# Merge with spatial data
final_summary <- channels |>
  left_join(channels_with_numbers |>
              rename(id = chan_no), by = "id") |>
  left_join(hydro_summary |>
              rename(name = node), by = "name") |>
  st_transform(crs = 4326) |>
  filter(!is.na(name)) |>
  saveRDS('data/baseline_scenario_comparison_table.RDS')
