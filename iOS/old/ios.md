cocoa touch  成熟的API 
media	
core services
core os

- platform
	+ Tolls Xcode Instuments
	+ Language OC
	+ Frameworks	Foundation	UIKit  ...
	+ Design  MVC	outlet(c -> v)	action -> target(v ---> c)  
	blind comunication 
	Notification & KVO (模型中有变化，通知控制器)  
	多个MVC
- Object C
	Card.h 
		#import <Foundation/Foundation.h>
		@iterface Card : NSObject
		@property (strong, nonatomic) NSString *contents;

		setter getter
		_表示属性名
		strong weak
		nil 表示指针不指向任何地方
		可预见性强
	card.m	
	#import "Card.h"
	@interface Card()

	@end
	@implementation Card

	@synthesize contents = _contents;
	- (NSString *)contents
	{
		return _contents;
	}

	- (void)setContents:(NSString *)contents
	{
		_contents = contents;
	}
		
