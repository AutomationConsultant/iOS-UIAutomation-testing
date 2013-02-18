#import "CedarAsync.h"
#import "ViewController.h"
#import "UIButton+PC.h"


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)


describe(@"ViewController", ^{
    __block UIWindow *window;
    __block ViewController *controller;
    
    UIView *view = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
    
    describe(@"when the view appears", ^{
        beforeEach(^{
            window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            controller = [[ViewController alloc] initWithNibName:@"ViewController_iPhone"
                                                          bundle:[NSBundle bundleForClass:[ViewController class]]];
            [window addSubview:controller.view];
            [window makeKeyAndVisible];
        });
        
        afterEach(^{
            [controller.view removeFromSuperview];
            [window addSubview:view];
        });
        
        it(@"it should show button 1", ^{
            controller.button1.hidden should_not be_truthy;
        });
        
        describe(@"and when button 1 is tapped", ^{
            it(@"should increment button tap count", ^{
                [controller.button1 tap];
                [controller.button1 tap];
                [controller.button1 tap];
                in_time(controller.buttonTapCount) should equal(1);
            });
        });
    });
});

SPEC_END
