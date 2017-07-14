
struct  TimesTable {
    let multipier:Int
    subscript(index:Int) -> Int {
        return multipier*index
    }
    
}
var test = TimesTable(multipier: 2)
test[2]

//Dictionary

struct Matrix{
    let rows:Int, columns:Int
    var grid:[Double]
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows*columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row:Int, column:Int) -> Bool {
        return row>=0 && row<rows && column>=0 && column<columns
    }
    subscript(row:Int, column:Int) -> Double{
        get{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row*columns) + column]
        }
        set{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row*columns)+column]
        }
    }
}

var m = Matrix(rows: 3, columns: 4)
m[2,1]
