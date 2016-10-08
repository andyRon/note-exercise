import itertools

for key, group in itertools.groupby('AaaBBaCCcAA', lambda c: c.upper()):
    print key, list(group)