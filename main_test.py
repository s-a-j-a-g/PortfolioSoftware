import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvasQTAgg
from PyQt5.QtWidgets import QApplication, QWidget
import csv
import pandas as pd

class Canvas(FigureCanvasQTAgg):
    def __init__(self, parent):
        fig, self.ax = plt.subplots(figsize =(15, 8), dpi = 100)
        super().__init__(fig)
        self.setParent(parent)

        """ 
        Matplotlib Script
        """
        plt.style.use('fivethirtyeight')

        age = []
        infected = []
        recovered = []

        data = pd.read_csv('Resources/ScrapedData/Agewise_Data.csv')
        ids = data['Age']

        age = data['Age'].tolist()
        infected = data['Infected'].tolist()
        plt.barh(age, infected, label = 'Infected')

        plt.title('Covid Cases by Age')
        plt.xlabel('Age')
        plt.ylabel('Total Cases')

        plt.legend()
        plt.grid(True)

        plt.tight_layout() # works for small screen; solves padding issues

        # plt.show()

class AppDemo(QWidget):
    def __init__(self):
        super().__init__()
        self.resize(1600, 800)

        chart = Canvas(self)


app = QApplication(sys.argv)
demo = AppDemo()
demo.show()
sys.exit(app.exec_())    