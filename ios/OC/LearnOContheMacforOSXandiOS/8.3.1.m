typedef struct _NSRange
{
	unsigned int location;
	unsigned int length;
} NSRange;

NSRange range;
range.location = 17;
range.length = 4;

NSRange range = { 17, 4};

NSRange range = NSMakeRange(17,4);

[anObject flarbulateWithRange:NSMakeRange(13,15)];