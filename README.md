
# ffread

`ffread` is an R package that extends the functionality of `data.table::fread()` for efficient reading and filtering of large datasets. The `ffread` function allows users to read only the necessary rows based on a specified key and value, optimizing the data loading process for large files.

## Installation

To install the `ffread` package, you can use the `devtools` package:

```r
install.packages("devtools")
devtools::install_github("averriK/ffread")
```

Alternatively, you can download the source code and install it manually:

```r
# Download and unzip the source code
# Assuming the source code is downloaded and unzipped in the current directory
devtools::install_local("ffread")
```

## Usage

Here is an example of how to use the `ffread` function with a large public dataset:

### Example: Using New York City Taxi Trip Data

```r
# Load the required library
library(ffread)

# Download the NYC Taxi Trip Data
download.file("https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2020-01.csv", "nyc_taxi.csv")

# Read the dataset using ffread
result_nyc_taxi <- ffread("nyc_taxi.csv", key = "passenger_count", value = 1)
print(result_nyc_taxi)
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

Feel free to open an issue on [GitHub](https://github.com/averriK/ffread) if you encounter any problems or have suggestions for improvements.
