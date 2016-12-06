//
//  Person.h
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printer.h"

@interface Person : NSObject{
    NSString *_name;
}

//扩展性不高，当我们需要添加一个新的打印机的时候还要定义对应的一个方法
//所以这时候就可以使用多态技术了
//这个方法的参数类型就是父类的类型，这就是多态，定义类型为父类类型，实际类型为子类类型
- (void) doPrinter: (Printer *)printer;
@end
