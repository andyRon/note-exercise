path = "/Users/andyron/myfield/books/pydata-book-master/ch02/usagov_bitly_data2012-03-16-1331923249.txt"
records = [json.loads(line) for line in open(path)]
import json
records = [json.loads(line) for line in open(path)]
records
records[0]
time_zones = [rec['tz'] for rec in records]
records[0]['tz']
records[1]['tz']
time_zones = [rec['tz'] for rec in records if 'tz' in rec]
time_zones
time_zones[:10]
records[8]
from collections import defaultdict
def get_counts(sequence):
    counts = defaultdict(int)
    for x in sequence:
        counts[x] += 1
    return counts
counts = get_counts(time_zones)
counts
counts['America/New_York']
len(time_zones)
time_zones
counts.items()
counts
def top_counts(count_dict, n=10):
    value_key_pairs = [(count, tz) for tz, count in count_dict.items()]
    value_key_pairs.sort()
    return value_key_pairs[-n:]
top_counts(counts)
from collections import Counter
time_zones
counts2 = Counter(time_zones)
counts2
counts
counts2.most_common(10)
from pandas import DataFrame, Series
import pandas as pd; import numpy as np
frame = DataFrame(records)
frame
records[0]
frame['tz']
tz_counts = frame['tz'].value_counts()
tz_counts
clean_tz = frame['tz'].fillna('Missing')
clean_tz
clean_tz[clean_tz == ''] = 'Unknown'
clean_tz
tz_counts
tz_counts = clean_tz.value_counts()
tz_counts
tz_counts[:10].plot(kind="barh", rot=0)
tz_counts[:10].plot(kind="barh", rot=0)
frame['a']
frame['a'][1]
frame['a'][50]
tz_counts[:10].plot(kind="barh", rot=0)
tz_counts[:10].plot(kind="barh", rot=0)
print tz_counts[:10].plot(kind="barh", rot=0)
frame.a
tz_counts[:10].plot(kind="barh", rot=0)
%pylab
%pylab tz_counts[:10].plot(kind="barh", rot=0)
%pylab tz_counts[:10].plot(kind="barh", rot=0).show()
xx = tz_counts[:10].plot(kind="barh", rot=0)
xx.show
xx.show()
tz_counts[:10].plot(kind="barh", rot=0)
import pylab as pl
tz_counts[:10]
x = [1, 2, 3, 4, 5]
y = [1, 4, 9, 16, 25]
pl.plot(x, y)
pl.show()
pl.show()
tz_counts[:10].plot(kind="barh", rot=0)
tz_counts[:10].plot(kind="barh", rot=0)
tz_counts[:20].plot(kind="barh", rot=0)
frame['a'][49:53]
results = Series([x.split()[0] for x in frame.a.dropna()])
result
results
results[:5]
results.value_counts()
results.value_counts()[:8]
frame
frame[0]
records[1]
records[0]
cframe = frame[frame.a.notnull()]
cframe
operating_system = np.where(cframe['a'].str.contains('Windows'), 'Windows', 'Not Windows')
operating_system[:5]
operating_system
by_tz_os = cframe.groupby(['tz', operating_system])
agg_counts = by_tz_os.size().unstack().fillna(0)
agg_counts[:10]
indexer = agg_counts.sum(1).argsort()
indexer
count_subset = agg_counts.take(indexer)[-10:]
count_subset
count_subset.plot(kind="barh", stacked=True)
normed_subset = count_subset.div(count_subset.sum(1), axis=0)
normed_subset.plot(kind='barh', stacked=Tre)
normed_subset.plot(kind='barh', stacked=True)
import pandas as pd
unames = ['user_id', 'gender', 'age', 'occupation', 'zip']
users = pd.read_table("/Users/andyron/myfield/books/pydata-book-master/ch02/movielens/user.dat", sep='::', header=None, names=unames)
users = pd.read_table("/Users/andyron/myfield/books/pydata-book-master/ch02/movielens/users.dat", sep='::', header=None, names=unames)
users
rnames = ['user_id', 'movie_id', 'rating', 'timestamp']
ratings = pd.read_table("/Users/andyron/myfield/books/pydata-book-maste
     ...: r/ch02/movielens/users.dat", sep='::', header=None,
ratings = pd.read_table("/Users/andyron/myfield/books/pydata-book-master/ch02/movielens/ratings.dat", sep='::', header=None, names=rnames)
mnames = ['movie_id', 'title', 'genres']
movies = pd.read_table("/Users/andyron/myfield/books/pydata-book-master/ch02/movielens/movies.dat", sep='::', header=None, names=mnames)
users[:10]
movies[:10]
ratings[:10]
rati
ratings
data = pd.merge(pd.merge(ratings, users), movies)
data
data.ix[0]
users
users[:2]
ratings[:2]
movies[:2]
data.ix[1]
movies[192:194]
movies[191:194]
movies[1191:1194]
movies[1181:1194]
movies[1171:1184]
data.ix[0]
mean_ratings = data.pivot_table("rating", rows="title", cols="gender", aggfunc="mean")
mean_ratings = data.pivot_table("rating", rows="title", cols="gender", aggfunc="mean")
mean_ratings = data.pivot_table("rating", index="title", cols="gender", aggfunc="mean")
mean_ratings = data.pivot_table("rating", index="title", columns="gender", aggfunc="mean")
mean_ratings[:5]
ratings_by_title = data.groupby("title").size()
ratings_by_title[:10]
active_titles = ratings_by_title.index[ratings_by_title >= 250]
active_titles
mean_ratings
mean_ratings = mean_ratings.ix[active_titles]
mean_ratings
top_female_ratings = mean_ratings.sort_index(by="F", ascending=False)
top_female_ratings
top_female_ratings[:10]
mean_ratings['diff'] = mean_ratings['M'] - mean_ratings['F']
mean_ratings[:10]
sorted_by_diff = mean_ratings.sort_index(by="diff")
sorted_by_diff[:15]
sorted_by_diff[::-1][:15]
rating_std_by_title = data.groupby('title')['rating'].std()
rating_std_by_title[:1]
active_titles
rating_std_by_title = rating_std_by_title.ix[active_titles]
rating_std_by_title.order(ascending=False)[:10]
names
ll
head -n 10 myfield/github/LearnPython/LeanPython
head -n 10 myfield/github/LearnPython/LearnPython
head -n 10 myfield/books/pydata-book-master/ch02/names/NationalReadMe.pdf
head -n 10 myfield/books/pydata-book-master/ch02/names/yob1880.txt
head
!head -n 10 myfield/books/pydata-book-master/ch02/names/yob1880.txt
names1880 = pd.read_csv("/Users/andyron/myfield/books/pydata-book-master/ch02/names/yob1880.txt", names=["name", "sex", "births"])
names1880
names1880.groupby('sex').births.sum()
years = range(1880, 2011)
years
type(years)
pieces = []
columns = ['name', 'sex', 'births']
for year in years:
    path = "/Users/andyron/myfield/books/pydata-book-master/ch02/names/yob%d.txt" % year
    frame = pd.read_csv(path, names=columns)
    frame['year'] = year
    pieces.append(frame)
names = pd.concat(pieces, ignore_index=True)
import sys
sys.getsizeof(pieces)
sys.getsizeof(names)
total_births = names.pivot_table("births", index="year", columns="sex", aggfunc=sum)
names
names[:10]
total_births[:10]
total_births[-10:]
total_births.plot(title="Total births by sex and year")
def add_prop(group):
    births = group.births.astype(float)
    group['prop'] = births / births.sum()
    return group
names = names.groupby(['year', 'sex']).apply(add_prop)
names[:10]
names[10:]
names[-10:]
names.groupby(['year', 'sex']).prop.sum()
np.allclose(names.groupby(['year', 'sex']).prop.sum(), 1)
def get_top1000(group):
    return group.sort_index(by='births', ascending=False)[:1000]
grouped = names.groupby(['year', 'sex'])
top1000 = grouped.apply(get_top1000)
top1000
boys = top1000[top1000.sex == 'M']
girls = top1000[top1000.sex == 'F']
girls
total_births = top1000.pivot_table("births", index="year", columns="name", aggfunc=sum)
total_births
total_births[:10]
subset = total_births[['John', 'Harry', 'Mary', 'Marilyn']]
subset.plot(subplots=True, figsize=(12,10), grid=False, title="Number of births per year")
top1000[:10]
table = top1000.pivot_table("prop", index="year", columns="sex", aggfunc=sum)
table.plot(title="Sum of table1000.prop by year and sex", yticks=np.linspace(0, 1.2, 13), xtick=range(1880, 2020, 10))
table.plot(title="Sum of table1000.prop by year and sex", yticks=np.linspace(0, 1.2, 13), xticks=range(1880, 2020, 10))
df = boys[boys.year == 2010]
df
prop_cumsum = df.sort_index(by='prop', ascending=False).prop.cumsum()
prop_cumsum[:10]
prop_cumsum.searchsorted(0.5)
df = boys[boys.year == 1900]
in1900 = df.sort_index(by='prop', ascending=False).prop.cumsum()
in1900
in1900.searchsorted(0.5) + 1
def get_quantile_count(group, q=0.5):
    group = group.sort_index(by='prop', ascending=False)
    return group.prop.cumsum().searchsorted(q) + 1
diversity = top1000.groupby(['year', 'sex']).apply(get_quantile_count)
diversity = diversity.unstack('sex')
diversity.head()
diversity[:10]
diversity.plot(title="Number of popular names in top 50%")
in1900
in1900.searchsorted(0.5)
in1900.searchsorted(0.5)[0]
in1900.searchsorted(0.5)[0] + 1
type(in1900.searchsorted(0.5))
in1900.searchsorted(0.5)
len(in1900.searchsorted(0.5))
def get_quantile_count(group, q=0.5):
    group = group.sort_index(by='prop', ascending=False)
    return group.prop.cumsum().searchsorted(q)[0] + 1
diversity = top1000.groupby(['year', 'sex']).apply(get_quantile_count)
diversity.head()
diversity = diversity.unstack('sex')
diversity.head()
diversity.plot(title='Number of popular names in top 50%')
get_last_letter = lambda x: x[-1]
last_letters = names.name.map(get_last_letter)
last_letters.name = 'last_letter'
talbe = names.pivot_table('births', index=last_letters, columns=['sex', 'year'], aggfunc=sum)
subtable = table.reindex(columns=[1910, 1960, 2010], level='year')
table.head()
names.head()
last_letters.head()
last_letters
last_letters.name
table
talbe = names.pivot_table('births', rows=last_letters, columns=['sex', 'year'], aggfunc=sum)
last_letters
table
subtable = table.reindex(colums=[1910,1960,2010],level='year')
subtable = table.reindex(columns=[1910,1960,2010],level='year')
subtable = table.reindex(columns=[1910,1960,2010])
subtable
ll
cd myfield/github/note-exercise/Python/
ll
cd Python_For_Data_Analysis/
ll
%hist -f ipython-hist2.py
