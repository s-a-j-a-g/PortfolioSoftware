import csv
import matplotlib.pyplot as plt
import numpy as np
from collections import Counter #  we can track how many times a data has been repeated or entered

plt.style.use('fivethirtyeight')

# with open('Resources/ScrapedData/Agewise_Data.csv') as csv_file:
#     csv_reader = csv.DictReader(csv_file)

#     list_of_ages = Counter()
 
#     for row in csv_reader:
#         list_of_ages.update(row['Age'])

# age = []
# infected = []

# for item in list_of_ages:
#     age.append(item[0])
#     infected.append(item[1])

# print(age)
# print(infected)

age = []
infected = []
recovered = []

with open('Resources/ScrapedData/Agewise_Data.csv') as csv_file:
    csv_reader = csv.reader(csv_file)

    for row in csv_reader:
        age.append(row[0])
        infected.append(row[1])
        recovered.append(row[2])

plt.bar(age, infected)
#plt.bar(infected)
# plt.bar(recovered)

plt.title('Covid Cases by Age')
plt.xlabel('Age')
plt.ylabel('Total Cases')

# plt.legend()
# plt.grid(True)

plt.tight_layout() # works for small screen; solves padding issues

plt.show()



# print(age)
# print(infected)
# print(recovered)
