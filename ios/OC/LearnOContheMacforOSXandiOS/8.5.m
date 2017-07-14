NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
NSArray *array2 = @[@"one", @"two", @"three"];

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
id *myObject = array1[1];

for(NSInteger i=0;i<[array count];i++){
	NSLog(@"index %d has %@.",i, [array objectAtIndex:i]);
}
for(NSInteger i=0;i<[array count];i++){
	NSLog(@"index %d has %@.",i, array[i]);
}

NSMutableArray
+ (id) arrayWithCapacity: (NSUInteger) numItems;
NSMutableArray *array = [NSMutableArray arrayWithCapacity:17];
- (void) addObject: (id) anObject;
for (NSInteger i=0;i<4;i++){
	Tire *tire = [Tire new];
	[array addObject: tire];
}
- (void) removeObjectAtIndex: (NSUInteger) index;
[array removeObjectAtIndex:1];

- (NSEnumerator *)objectEnumerator;
NSEnumerator *enumerator = [array objectEnumerator];
while(id thingie = [enumerator nextObject]){
	NSLog(@"I found %@", thingie);
}

- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block
[array enumerateObjectsUsingBlock:^(NSString *string, NSUInteger index, BOOL *stop){
	NSLog(@"I found %@", string);
}]