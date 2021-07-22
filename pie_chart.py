import matplotlib.pyplot as plt
import csv
import pandas as pd

plt.style.use('fivethirtyeight')

with open('Resources/ScrapedData/PieChart.csv', newline='') as csvfile: #purpose of newline?; works without it also
    data = csv.DictReader(csvfile)

    for row in data:
        total_recovered_cases = row['Total Recovered']
        total_active_cases = row['Total Active Cases']
        total_death_cases = row['Total Death Cases']

slices = [total_recovered_cases, total_active_cases, total_death_cases]
index = ['Total Recovered', 'Total Active Cases', 'Total Deaths Cases']
slice_colors = ['#6d904f', '#e5ae37', '#fc4f30']
# slice_colors = ['Green', 'Yellow', 'Red']

plt.pie(slices, labels = index, colors = slice_colors, wedgeprops = {'edgecolor':  'black'}, shadow = True, autopct = '%1.1f%%')
plt.title('Total Recovered, Total Active & Total Deaths Cases')

plt.legend(loc = (-0.4, -0.2))

plt.tight_layout() # works for small screen; solves padding issues

plt.show()