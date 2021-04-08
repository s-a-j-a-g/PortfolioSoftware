import os
import datetime
from directions import point2

def getCurDateTime():
    Cur = {
    'currentDateTime' : datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    'CurrentDate' : datetime.datetime.now().strftime('%Y-%m-%d'),
    'CurrentTime' : datetime.datetime.now().strftime('%H:%M:%S'),
    'Current Year' : datetime.datetime.now().year,
    'Current Month' : datetime.datetime.now().month,
    'Current Day' : datetime.datetime.now().day,
    'Current Hour' : datetime.datetime.now().hour,
    'Current Minute' : datetime.datetime.now().minute,
    'Current Second' : datetime.datetime.now().second,
    }
    return Cur

def getBaseDetails(aFile):
    FileBaseDetails = {
    'FileName': os.path.basename(aFile),
    'FileLocation': aFile,
    'CreationTimeStamp' : os.path.getctime(aFile),
    'ModifiedTimeStamp' : os.path.getmtime(aFile),
    'FileSize': os.path.getsize(aFile)
    }
    return FileBaseDetails

def getDateTimeDetails(aFile):
    FileTimeDateDetails = {
    'Created Year' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%Y'),
    'Created Month' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%m'),
    'Created Day' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%d'),
    'Created Hour' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%H'),
    'Created Minute' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%M'),
    'Created Second' : datetime.datetime.fromtimestamp(os.path.getctime(aFile)).strftime('%S'),

    'Modified Year' : datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%Y'),
    'Modified Month' : datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%m'),
    'Modified Day' : datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%d'),
    'Modified Hour' : datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%H'),
    'Modified Minute' : datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%M'),
    'Modified Second' :datetime.datetime.fromtimestamp(os.path.getmtime(aFile)).strftime('%S'),
    }
    return FileTimeDateDetails

def getFileDetails(aFile):
    FileDetails = [
        getBaseDetails(aFile),
        getDateTimeDetails(aFile),
        ]
    return FileDetails

def logThis(tex):
    with open(os.path.join(point2.AbsoluteProjectRoot,"log.txt"),"a") as logg:
        logline = str(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')+"\n\n"+ tex +"\n---\n")
        logg.write(logline)

def clearLog():
    os.remove(os.path.join(point2.AbsoluteProjectRoot,"log.txt"))


def isUpdateNeeded(aFile):
    if os.path.isfile(aFile):

        if os.path.basename(aFile) == "TradedSecuritiesList.csv":
            if getDateTimeDetails(aFile).get('Created Month') != getCurDateTime().get('Current Month'):
                logThis("File found :" + aFile +"\nFile older than 1 month.\nRun Spider")
                return True
            else:
                logThis("File found :" + aFile +"\nFile is less than 1 month.\nDone")
                return False
        elif os.path.basename(aFile) == "ClientPortfolio.db":

    else:
        logThis("Error! File not found")
