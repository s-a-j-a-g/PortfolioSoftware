import os.path
from directions import point2

#from scrapy import Selector
import scrapy
#from scrapy.crawler import CrawlerProcess
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

#import time

chrome_options = Options()
chrome_options.add_argument("--headless")

TableRow = '//*[@id="company-list"]/table/tbody/tr'
TableRowN = '[{}]'

aStockName = '/td[3]/text()'
aSSymbol = '/td[4]/text()'
aSector = '/td[5]/text()'
aPageLink = '/td[6]/a/@href'

def remove_whitespace(value):
    return value.strip()

class GetCompanyInfo_Spider(scrapy.Spider):
    name = 'Spider2GetCompanyInfo'
    start_urls = [
        'http://www.nepalstock.com/company'
    ]

    #def __init__(self, *args, **kwargs):
    def __init__(self):
        #super().__init__(self, *args, *kwargs)
        self.driver = webdriver.Chrome(executable_path = point2.ChromeDriverLocation, options=chrome_options)


    @staticmethod
    def get_selenium_response(driver,url):
        driver.get(url)
        #time.sleep(1)
        
        Filter_button = '//*[@id="company-filter"]/input[1]'
        FilterChoice_button = '//select[@name = "_limit"]'
        FilterChoiceOption_button = FilterChoice_button + '/option[text() = {}]'.format(500)

        driver.find_element(By.XPATH, FilterChoice_button ).click()
        driver.find_element(By.XPATH, FilterChoiceOption_button ).click()
        driver.find_element(By.XPATH, Filter_button ).click()
        #time.sleep(5)

        selenium_response_text = driver.page_source.encode('utf-8')
        return selenium_response_text

    def parse(self,response):
        newSelector = self.get_selenium_response(self.driver, response.url)
        response = scrapy.Selector(text= newSelector)

        for n in range(3,288):
            for tr in response.xpath((TableRow + TableRowN.format(n))):
                yield{
                    'StockName': remove_whitespace(tr.xpath(TableRow + TableRowN.format(n) + aStockName).extract_first()),
                    'Symbol': tr.xpath(TableRow + TableRowN.format(n) + aSSymbol).extract_first(),
                    'Sector': tr.xpath(TableRow + TableRowN.format(n) + aSector).extract_first(),
                    'PageLink': tr.xpath(TableRow + TableRowN.format(n) + aPageLink).extract_first()
                }