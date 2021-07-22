import matplotlib.pyplot as plt

print(plt.style.available) # Shows available style
plt.style.use('fivethirtyeight')
# plt.style.use('ggplot')

age_x = [25,26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
infected_y = [38496, 42000, 46752, 49320, 53200, 56000, 62316, 64928, 67317, 68748, 73752]
recoverd_y = [45372, 48876, 53850, 57287, 63016, 65998, 70003, 70000, 71496, 75370, 83640]
death_y = [37810, 43515, 46823, 49293, 53437, 56373, 62375, 66674, 68745, 68746, 74583]

# plt.plot(age_x, infected_y, label = 'Infected', color = 'k', linestyle = '--', marker = 's')
# plt.plot(age_x, recoverd_y, label = 'Recoverd', color = 'b', linestyle = '-', marker = 'o')
# Source: https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html


plt.plot(age_x, infected_y, label = 'Infected', color = '#444444', linestyle = '--', marker = 's', linewidth = 2)
plt.plot(age_x, recoverd_y, label = 'Recoverd', color = '#5a7d9a', linestyle = '-', marker = 'o', linewidth = 2)
plt.plot(age_x, death_y, label = 'Deaths', color = '#adad3b', linestyle = '-', marker = 'o', linewidth = 2)

plt.title('Covid Cases by Age')
plt.xlabel('Age')
plt.ylabel('Total Cases')

plt.legend()
plt.grid(True)

plt.tight_layout() # works for small screen; solves padding issues

plt.show()