#import "PineCone.h"
#import <UIAutomation/UIAutomation.h>

@implementation PineCone

+ (CGPoint)centerForFrame:(CGRect)frame
{
    return CGPointMake(frame.origin.x + frame.size.width / 2, 
                       frame.origin.y + frame.size.height / 2);
}

+ (void)tapElement:(UIView *)view
{
    [[UIASyntheticEvents sharedEventGenerator] sendTap:[self centerForFrame:view.frame]];
}

@end
