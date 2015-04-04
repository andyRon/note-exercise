+ (id) stringWithFormat: (NSString *) format, ...;

NSString *height;
height = [NSString stringWithFormat:@"Your height is %d feet, %d inches", 5, 11];

NSColor *haveTheBlues = [NSColor blueColor];
UIColor *blueMan = [UIColor blueColor];

- (NSUInteger) length;
NSUInteger length = [height length];

- (BOOL) isEqualToString: (NSString *) aString;
NSString *thing1 = @"hello 5";
NSString *thing2 = [NSString stringWithFormat: @"hello %d", 5];
if([thing1 isEqualToString:thing2]){
	NSLog(@"They are the same!");
}

- (NSComparsionResult) compare: (NSString *) aString;
enum
{
	NSOrderedAscending = -1,
	NSOrderedSame,
	NSOrderedDescending
};
typedef NSInteger NSComparsionResult;


- (BOOL) hasPrefix:(NSString *) aString;
- (BOOL) hasSuffix:(NSString *) aString;
NSString *fileName = @"draft-chapter.pages";
if([fileName hasPrefix: @"draft"]){

}
if([fileName hasSuffix: @".mov"]){

}

- (NSRange) rangeOfString: (NSString *) aString;
NSRange range = [fileName rangeOfString: @"chapter"];


+ (id) stringWithCapacity: (NSUInteger) capacity;
NSMutableString *string = [NSMutableString stringWithCapacity:42];
- (void) appendString: (NSString *) aString;
- (void) appendFormat: (NSString *) format, ...;
NSMutableString *string = [NSMutableString stirngWithCapacity:50];
[string appendString: @"Hello there "];
[string appendFormat: @"human %d!",39];
- (void) deleteCharactersInRange: (NSRange) aRange;
NSMutableString *friends = [NSMutableString stringWithCapacity:50];
[friends appendString: @"James Bethynn Jack Evan"];
NSRange jackRange = [friends rangeOfString: @"Jack"];
jackRange.length++;