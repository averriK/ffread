
# ffread

ffread is an R package that extends the functionality of `data.table::fread()` for efficient reading of large datasets with specific filtering capabilities. The `ffread` function allows users to read only the necessary rows based on a specified key and value, optimizing the data loading process for large files.

## Installation

To install the `ffread` package, you can use the `devtools` package:

```r
install.packages("devtools")
devtools::install_github("yourusername/ffread")
```

Alternatively, you can download the source code and install it manually:

```r
# Download and unzip the source code
install.packages("path/to/ffread")
```

## Usage

Here are some examples of how to use the `ffread` function with different public datasets:

### Example 1: Using New York City Taxi Trip Data

```r
# Load required libraries
library(ffread)
library(data.table)

# Download the NYC Taxi Trip Data
download.file("https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2020-01.csv", "nyc_taxi.csv")

# Read the dataset using ffread
result_nyc_taxi <- ffread("nyc_taxi.csv", key = "passenger_count", value = 1)
print(result_nyc_taxi)
```

### Example 2: Using US Census Bureau Public Use Microdata Sample (PUMS)

```r
# Load required libraries
library(ffread)
library(data.table)

# Download and unzip the US Census PUMS Data
download.file("https://www2.census.gov/programs-surveys/acs/data/pums/2019/1-Year/csv_pus.zip", "us_census.zip")
unzip("us_census.zip", exdir = "us_census")

# Read the dataset using ffread
result_us_census <- ffread("us_census/psam_pusa.csv", key = "SEX", value = 1)
print(result_us_census)
```

### Example 3: Using Chicago Crime Data

```r
# Load required libraries
library(ffread)
library(data.table)

# Download the Chicago Crime Data
download.file("https://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv?accessType=DOWNLOAD", "chicago_crime.csv")

# Read the dataset using ffread
result_chicago_crime <- ffread("chicago_crime.csv", key = "Primary Type", value = "THEFT")
print(result_chicago_crime)
```

## Function Documentation

### ffread

**Description:**

Reads a large dataset from a file and filters the rows based on a specified key and value.

**Usage:**

```r
ffread(file, key, value, ...)
```

**Arguments:**

- `file`: The path to the file to read.
- `key`: The name of the column to use as the key for filtering.
- `value`: The value(s) to filter by. Can be a single value or a vector of values.
- `...`: Additional arguments passed to `data.table::fread()`.
  
**Value:**

A data.table containing the filtered rows.

## License

This package is licensed under the GPL-3 License.

## Contact

For questions or issues, please contact:

- Alejandro Verri Kozlowski
- Email: averri@fi.uba.ar
- ORCID: 0000-0002-8535-1170

Feel free to open an issue on [GitHub](https://github.com/yourusername/ffread) if you encounter any problems or have suggestions for improvements.
