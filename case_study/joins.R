#' Join the required frames on specified columns, 
#' dropping unecessary columns
join_frames <- function(left_dataframe, right_dataframe, left_column, right_column) {
  
  # Change location_id to be called country_code for join
  colnames(right_dataframe)[colnames(right_dataframe) == right_column] <- left_column
  
  combined_frames <- dplyr::left_join(x = left_dataframe,
                                      y = right_dataframe,
                                      by = left_column)
  
  combined_frames_reduced <- dplyr::select(combined_frames, sdg_region_name, population_density)
  
  return(combined_frames_reduced)
}

join_years <- function(dataframes, join_column) {
  outframe <- dataframes |> 
    reduce(inner_join, by = join_column)
}
