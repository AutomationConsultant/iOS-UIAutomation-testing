#import "UIView+PC.h"
#import "PineCone.h"

@implementation UIView (PC)

- (void)tap
{
    [PineCone tapElement:self];
}

- (void)tapElementAtPoint:(CGPoint)point
{
    [PineCone tapElementAtPoint:point];
}

- (void)tapAndHold
{
    [PineCone tapAndHoldElement:self];
}

@end
