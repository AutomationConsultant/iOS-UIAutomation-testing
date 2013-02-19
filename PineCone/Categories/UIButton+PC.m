#import "UIButton+PC.h"
#import "PineCone.h"

@implementation UIButton (PC)

- (void)tap
{
    [PineCone tapElement:self];
}

- (void)tapAndHold
{
    [PineCone tapAndHoldElement:self];
}

@end
