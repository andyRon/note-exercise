var format_1 = format_2 = []  //这样定义有问题
var obj = {a:{A:1,B:2}, b:{A:3, B:4}}

for (var k in obj){
    format_1.push(obj[k]['A'])
    format_2.push(obj[k]['B'])
}

console.log(format_1)
// [1, 2, 3, 4]
// 注意 
