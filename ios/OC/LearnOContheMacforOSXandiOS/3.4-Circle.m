@interface Circle : NSObject{
@private
	ShapeColor fillColor;
	ShapeRect bounds;
}
- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;
@end

@implementation Circle
- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
}
- (void) setBounds: (ShapeRect) b
{
	bounds = b;
}