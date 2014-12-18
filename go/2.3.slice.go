package main 
import "fmt"

func main() {
	var array [10]int = [10]int{1,2,3,4,5,6,7,8,9,10}

	var myslice []int = array[:5]	

	for _, v := range myslice{
		fmt.Println(v)
	}

	myslice1 := array[:]
	fmt.Println(myslice1[3])
	myslice2 := array[:5]

	myslice3 := make([]int, 5)

	myslice4 := make([]int, 5, 10)

	myslice5 := []int{1,2,3,4,5} 
}