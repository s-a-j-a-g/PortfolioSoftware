import csv
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

plt.style.use('fivethirtyeight')

age = []
infected = []
recovered = []

data = pd.read_csv('Resources/ScrapedData/Agewise_Data.csv')

age = data['Age'].tolist()
infected = data['Infected'].tolist()
plt.barh(age, infected, label = 'Infected')

plt.title('Covid Cases by Age')
plt.xlabel('Age')
plt.ylabel('Total Cases')

plt.legend()
plt.grid(True)

plt.tight_layout() # works for small screen; solves padding issues

plt.show()



