import logging
logging.basicConfig(level=logging.INFO)

s = '0'
n = int(s)
logging.info('n = %d' % n)
logging.error("error1")
logging.debug("debug2")
print 10 / n