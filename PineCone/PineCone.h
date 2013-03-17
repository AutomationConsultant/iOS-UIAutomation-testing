@class UIATarget;

@interface PineCone : NSObject

+ (UIATarget *)target;

+ (void)tapElement:(UIView *)view;
+ (void)tapElementAtPoint:(CGPoint)point;
+ (void)tapAndHoldElement:(UIView *)view;

@end
