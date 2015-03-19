+ (NSNumber *) numberWithChar: (char) value;
+ (NSNumber *) numberWithInt: (int) value;
+ (NSNumber *) numberWithFloat: (float) value;
+ (NSNumber *) numberWithBool: (BOOL) value;

NSNumber *number;
NSNumber *number = @42;
[array addObject number];
[dictionary setObject: number forkey: @"Bork"];

- (char) charValue;
- (int) intValue;
- (float) floatValue;
- (BOOL) boolValue;
- (NSString *)stringValue;

+ (NSValue *) valueWithBytes: (const void *) value objCType: (const char *) type;
