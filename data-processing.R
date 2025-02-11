#dss_hydro_output
read_csv('data-raw/fpv1ma_hydro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11) |>
  saveRDS("data/fpv1ma_hydro_stage.RDS")

#dss_output_baseline
read_csv('data-raw/h1z_hdro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11) |>
  saveRDS("data/h1z_hdro_stage.RDS")

#dss_hydro_output_fpv2ma
read_csv('data-raw/fpv2ma_hydro_export.csv') |>
  filter(param == "stage",
         lubridate::month(datetime) %in% 5:11,
         # filter to years that align with baseline
         lubridate::year(datetime) %in% 2020:2024) |> #2016 2017 2018 2019 2020 2021 2022 2023
  saveRDS("data/fpv2ma_hydro_stage.RDS")


unique(lubridate::year(dss_hydro_fpv2ma$datetime))
