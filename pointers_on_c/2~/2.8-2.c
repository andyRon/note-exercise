/*
	检查一点c程序代码中‘{’，‘}’是否成对出现
*/

#include <stdio.h>
#include <stdlib.h>

int
main(){
	int ch, braces;
	braces = 0;
	
	while((ch = getchar() != EOF)){
		if( ch == '{')
			braces += 1;
		if( ch == '}'){
			if(braces == 0){
				printf("缺少关闭‘}’\n");
			}else{
				braces -= 1;
			}
		
		}

		if( braces > 0){
			printf("有 %d 个不成对的花括号\n", braces );
		}
	

	}


}

