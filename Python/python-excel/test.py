import xlrd

data = xlrd.open_workbook('./shdx.xlsx')

# 通过索引顺序获取
table = data.sheets()[0]
# table = data.sheet_by_index(0) 

# 通过名称获取
# table = data.sheet_by_name(u'住宿信息表')

# 整行
row =  table.row_values(0)
# 整列
# col = table.col_values(0)

print row