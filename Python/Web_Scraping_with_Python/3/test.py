from link_crawler import link_crawler
from scrapecallback import ScrapeCallback
from disk_cache import DiskCache

# link_crawler('http://example.webscraping.com/', '/(index|view)', max_depth=1, delay=0, scrape_callback=ScrapeCallback())

link_crawler('http://example.webscraping.com/', '/(index|view)', max_depth=1, delay=0, cache=DiskCache())
