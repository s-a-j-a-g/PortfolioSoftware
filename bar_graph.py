import matplotlib.pyplot as plt
import numpy as np

plt.style.use('fivethirtyeight')

age_x = [25,26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
x_index = np.arange(len(age_x))
bar_width = 0.25

infected_y = [38496, 42000, 46752, 49320, 53200, 56000, 62316, 64928, 67317, 68748, 73752]
recoverd_y = [45372, 48876, 53850, 57287, 63016, 65998, 70003, 70000, 71496, 75370, 83640]
death_y = [37810, 43515, 46823, 49293, 53437, 56373, 62375, 66674, 68745, 68746, 74583]

# plt.bar(age_x, infected_y, label = 'Infected', color = '#444444')
# plt.bar(age_x, recoverd_y, label = 'Recoverd', color = '#5a7d9a')
# plt.bar(age_x, death_y, label = 'Deaths', color = '#adad3b')

plt.bar(x_index - bar_width, infected_y, label = 'Infected', color = '#444444', width = bar_width)
plt.bar(x_index, recoverd_y, label = 'Recovered', color = '#5a7d9a', width = bar_width)
plt.bar(x_index + bar_width, death_y, label = 'Deaths', color = '#adad3b', width = bar_width)

plt.xticks(ticks = x_index, labels  = age_x) # As x value would change when we plot as x-index (in plt.bar method) so to use our x date we use this method

plt.title('Covid Cases by Age')
plt.xlabel('Age')
plt.ylabel('Total Cases')

plt.legend() # legend is like index that shows which color represents which data; however label should be mentioned in plt.bar statement
plt.grid(True)

plt.tight_layout() # works for small screen; solves padding issues

plt.show()