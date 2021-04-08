from directions import point2
import os
import datetime
from custom_functions import logThis

def hasListofTradedSecurities():
    TradedSecuritiesList = os.path.join(point2.AbsoluteProjectRoot,"Resources","ScrapedData","TradedSecuritiesList.csv")
    
    if os.path.isfile(file):
        isUpdateNeeded(TradedSecuritiesList)

        return True
    else:
        return False

hasListofTradedSecurities()
