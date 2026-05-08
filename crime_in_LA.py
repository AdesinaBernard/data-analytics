# Import required libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
crimes = pd.read_csv("crimes.csv", dtype={"TIME OCC": str})
crimes.head()

# Extract the hour from "TIME OCC" and convert to integer
crimes['HOUR'] = crimes['TIME OCC'].str[:2].astype(int)

# Produce a countplot to find the largest frequency of crimes by hour
sns.countplot(data=crimes, x='HOUR')
plt.show()

# Find the hour with the highest frequency of crimes
peak_crime_hour = crimes['HOUR'].value_counts().idxmax()

# Display the result
print(peak_crime_hour)

# Filter crimes that occurred between 22:00 and 03:59 (night crimes)
night_crimes = crimes[(crimes['HOUR'] >= 22) | (crimes['HOUR'] < 4)]

# Find the area with the highest frequency of night crimes
peak_night_crime_location = night_crimes['AREA NAME'].value_counts().idxmax()

# Display the result
print(peak_night_crime_location)


# Define age bins and labels
age_bins = [0, 18, 26, 35, 45, 55, 65, np.inf]
age_labels = ["0-17", "18-25", "26-34", "35-44", "45-54", "55-64", "65+"]

# Categorize victim ages
crimes['AGE_GROUP'] = pd.cut(crimes['Vict Age'], bins=age_bins, labels=age_labels, right=False)

# Count crimes per age group
victim_ages = crimes['AGE_GROUP'].value_counts()
print(victim_ages)
