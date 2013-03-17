#import "PineCone.h"
#import <UIAutomation/UIAutomation.h>

@implementation PineCone

+ (UIATarget *)target
{
    return [NSClassFromString(@"UIATarget") localTarget];
}

+ (CGPoint)centerForFrame:(CGRect)frame
{
    return CGPointMake(frame.origin.x + frame.size.width / 2,
                            (frame.origin.y + frame.size.height / 2));
}

+ (CGRect)frameAdjustedForWindowWithView:(UIView *)view
{
    return [view convertRect:view.bounds toView:[[UIApplication sharedApplication] keyWindow]];
}

+ (void)tapElementAtPoint:(CGPoint)point
{
    [[UIASyntheticEvents sharedEventGenerator] sendTap:point];
}

+ (void)tapElement:(UIView *)view
{
    [[UIASyntheticEvents sharedEventGenerator] sendTap:[self centerForFrame:[PineCone frameAdjustedForWindowWithView:view]]];
}

+ (void)tapAndHoldElement:(UIView *)view
{
    [[UIASyntheticEvents sharedEventGenerator] touchDown:[self centerForFrame:[PineCone frameAdjustedForWindowWithView:view]]];
}



@end