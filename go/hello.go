package main

import "fmt"

func main(){
	// fmt.Println("hello,world. 你好，世界!")
	// // fval := 110.48
	// // fmt.Printf("fval=%f",fval)
	// fmt.Println("wqe")
	// const (
	// 	a = 1 << iota
	// 	b 
	// 	c  
	// 	)
	// fmt.Println(c)

	// var value1 complex64

	// value1 = 3.2 + 12i
	// // value2 :=  3.2 + 12i
	// // value3 := complex(3.2, 12)
	// fmt.Println(value1)

	// val1 := "sdfdsf"
	// fmt.Println(val1)

	// str := "hello,世界"
	// n := len(str)
	// for i := 0; i<n; i++ {
	// 	ch := str[i]
	// 	fmt.Println(i,ch)
	// }
	array := [5]int{1,2,3,4,5}

	for i := 0; i < len(array); i++{
		fmt.Println("Element",i, "of array is", array[i])
	}

	for i, v := range array{
		fmt.Println("array Element[", i, "]=", v)
	}


}
