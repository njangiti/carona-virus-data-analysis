# Corona Virus Data Analysis Project

## Project Overview
This project aims to analyze the spread of COVID-19 by examining confirmed, death, and recovered cases using various statistical measures. The dataset includes information such as the date, location (country and province), and counts of confirmed, death, and recovered cases.

## Dataset Description
The dataset used in this project includes the following columns:
- `date1`: Date of the record.
- `Confirmed`: Number of confirmed Corona cases.
- `Deaths`: Number of deaths due to Corona.
- `Recovered`: Number of recovered Corona cases.
- `Province`: Province or state.
- `Country_Region`: Country or region.
- `Latitude`: Latitude of the location.
- `Longitude`: Longitude of the location.

## Data Quality Check
To ensure data quality, the following steps were taken:
1. **Checking for Null Values:**
    ```sql
    SELECT * FROM covid2 WHERE Confirmed IS NULL OR Deaths IS NULL OR Province IS NULL OR Country_Region IS NULL OR Latitude IS NULL OR Longitude IS NULL OR Date1 IS NULL OR Recovered IS NULL;
    ```
    Rows with null values were identified to handle missing data appropriately.

2. **Number of Rows in Dataset:**
    ```sql
    SELECT COUNT(*) FROM covid2;
    ```
    The total number of rows in the dataset was counted to understand the dataset size.

3. **Date Range:**
    ```sql
    SELECT MIN(date1) AS start_date, MAX(date1) AS end_date FROM covid2;
    ```
    The start and end dates of the dataset were determined to understand the time span covered by the data.

4. **Number of Months in Dataset:**
    ```sql
    SELECT COUNT(DISTINCT YEAR(date1) * 12 + MONTH(date1)) AS num_of_months FROM covid2;
    ```
    The number of distinct months present in the dataset was calculated.

## Statistical Analysis
Several statistical analyses were performed on the dataset:

1. **Monthly Average for Confirmed, Deaths, Recovered:**
    ```sql
    SELECT YEAR(date1) AS year, MONTH(date1) AS month, AVG(Confirmed) AS avg_confirmed, AVG(Deaths) AS avg_deaths, AVG(Recovered) AS avg_recovered
    FROM covid2
    GROUP BY YEAR(date1), MONTH(date1);
    ```

2. **Most Frequent Values for Confirmed, Deaths, Recovered Each Month:**
    ```sql
    SELECT YEAR(date1) AS year, MONTH(date1) AS month, MAX(Confirmed) AS most_frequent_confirmed, MAX(Deaths) AS most_frequent_deaths, MAX(Recovered) AS most_frequent_recovered
    FROM covid2
    GROUP BY YEAR(date1), MONTH(date1);
    ```

3. **Minimum and Maximum Values for Confirmed, Deaths, Recovered Per Year:**
    ```sql
    SELECT YEAR(date1) AS year, MIN(Confirmed) AS min_confirmed, MIN(Deaths) AS min_deaths, MIN(Recovered) AS min_recovered
    FROM covid2
    GROUP BY YEAR(date1);

    SELECT YEAR(date1) AS year, MAX(Confirmed) AS max_confirmed, MAX(Deaths) AS max_deaths, MAX(Recovered) AS max_recovered
    FROM covid2
    GROUP BY YEAR(date1);
    ```

4. **Total Number of Confirmed, Deaths, Recovered Cases Each Month:**
    ```sql
    SELECT YEAR(date1) AS year, MONTH(date1) AS month, SUM(Confirmed) AS total_confirmed, SUM(Deaths) AS total_deaths, SUM(Recovered) AS total_recovered
    FROM covid2
    GROUP BY YEAR(date1), MONTH(date1)
    ORDER BY YEAR(date1), MONTH(date1);
    ```

5. **Spread of COVID-19 with Respect to Confirmed, Death, and Recovered Cases:**
    ```sql
    SELECT COUNT(*) AS total_cases, AVG(Confirmed) AS avg_confirmed, VARIANCE(Confirmed) AS variance_confirmed, STDDEV(Confirmed) AS stdev_confirmed
    FROM covid2;

    SELECT YEAR(date1) AS year, MONTH(date1) AS month, COUNT(*) AS total_cases, AVG(Deaths) AS avg_deaths, VARIANCE(Deaths) AS variance_deaths, STDDEV(Deaths) AS stdev_deaths
    FROM covid2
    GROUP BY YEAR(date1), MONTH(date1)
    ORDER BY YEAR(date1), MONTH(date1);

    SELECT YEAR(date1) AS year, MONTH(date1) AS month, COUNT(*) AS total_cases, AVG(Recovered) AS avg_recovered, VARIANCE(Recovered) AS variance_recovered, STDDEV(Recovered) AS stdev_recovered
    FROM covid2
    GROUP BY YEAR(date1), MONTH(date1)
    ORDER BY YEAR(date1), MONTH(date1);
    ```

## Insights
- **Country with Highest Confirmed Cases:**
    ```sql
    SELECT Country_Region, MAX(Confirmed) AS highest_confirmed_cases
    FROM covid2
    GROUP BY Country_Region
    ORDER BY highest_confirmed_cases DESC
    LIMIT 1;
    ```

- **Country with Lowest Death Cases:**
    ```sql
    SELECT Country_Region, MIN(Deaths) AS lowest_death_cases
    FROM covid2
    GROUP BY Country_Region
    ORDER BY lowest_death_cases ASC
    LIMIT 1;
    ```

- **Top 5 Countries with Highest Recovered Cases:**
    ```sql
    SELECT Country_Region, SUM(Recovered) AS total_recovered_cases
    FROM covid2
    GROUP BY Country_Region
    ORDER BY total_recovered_cases DESC
    LIMIT 5;
    ```

## Conclusion

The analysis of the COVID-19 dataset provided valuable insights into the spread and impact of the virus across different regions and over time. Key findings include:

- The country with the highest number of confirmed cases was identified, highlighting regions with the most significant outbreaks.
- The country with the lowest number of death cases was pinpointed, which could indicate effective healthcare responses or other factors mitigating fatalities.
- The top 5 countries with the highest number of recovered cases were determined, showcasing regions where recovery efforts were most successful.

Monthly and yearly statistical analyses revealed patterns in confirmed, death, and recovered cases, allowing us to understand the virus's trajectory and effectiveness of interventions over time. The calculated averages, variances, and standard deviations provided a deeper understanding of the data distribution and variability.

These insights are crucial for policymakers, healthcare professionals, and researchers to develop targeted strategies for future pandemic responses and to improve current health measures. Despite the comprehensive analysis, further research could include more granular data or additional factors such as vaccination rates and healthcare infrastructure to enhance the understanding of COVID-19's impact.


## Contact Information
For any inquiries or further information, please contact:
- Name: Narendhar Jangiti
- Email: njangti@rivier.edu
- GitHub:https://github.com/njangiti
