- (id) retain;
- (oneway void) release;
- (NSUInteger) retainCount;

@interface RetainTracker: NSOject
@end

@implementation RetainTracker
- (id) init
{
	if(self = [super init]){
		NSLog(@"init: Retain count of %d.", [self retainCount]);
	}
	return (self);
}
- (void) dealloc
{
	NSLog(@"dealloc called. Bye Bye.");
	[super dealloc];
}
@end

int int main(int argc, char const *argv[])
{
	RetainTracker *tracker = [RetainTracker new];
	[tracker retain];
	NSLog(@"%d", [tracker retainCount]);

	[tracker retain];
	NSLog(@"%d", [tracker retainCount]);

	[tracker release];
	NSLog(@"%d", [tracker retainCount]);
	
	return 0;
}