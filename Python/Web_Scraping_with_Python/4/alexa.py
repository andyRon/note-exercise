import csv
from zipfile import ZipFile
from StringIO import StringIO
from downloader import Downloader

D = Downloader()
zipped_data = D('')
urls = []
with ZipFile(StringIO(zipped_data)) as zf:
    csv_filename = zf.namelist()[0]