#import "UIButton+PC.h"
#import "CedarAsync.h"
#import "ViewController1.h"


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController1", ^{    
    __block UIWindow *window;
    __block ViewController1 *controller;
    
    // in this case, this will be the cedar spec harness (result viewer)
    UIView *view = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
    
    describe(@"when the view appears", ^{
        beforeEach(^{
            // loading of the view under test into a main app window (removing spec harness)
            window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            controller = [[ViewController1 alloc] initWithNibName:@"ViewController1"
                                                          bundle:[NSBundle bundleForClass:[ViewController1 class]]];
            [window addSubview:controller.view];
            [window makeKeyAndVisible];
        });
        
        afterEach(^{
            // allows one to view click activity on the simulator
            NSTimeInterval duration = 1.0f;
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, duration, false);
            
            // replace the view under test with the spec harness (to see results)
            [controller.view removeFromSuperview];
            [window addSubview:view];
        });
        
        it(@"should show buttons", ^{
            controller.button1.hidden should_not be_truthy;
            controller.button2.hidden should_not be_truthy;
        });
        
        describe(@"and when button 1 is tapped", ^{
            beforeEach(^{
                [controller.button1 tap];
            });
            
            it(@"should increment button tap count", ^{
                in_time(controller.buttonTapCount) should equal(1);
            }); 
            
            it(@"should add a √ to button title label text", ^{
                in_time(controller.button1.titleLabel.text) should equal(@"Button 1 √");
            });
        });

        describe(@"and when button 2 is tapped twice", ^{
            beforeEach(^{
                [controller.button2 tap];
                [controller.button2 tap];
            });
            
            it(@"should increment button tap count", ^{
                in_time(controller.buttonTapCount) should equal(2);
            }); 
            
            it(@"should add a √ to button title label text", ^{
                in_time(controller.button2.titleLabel.text) should equal(@"Button 2 √");
            });
        });
    
        describe(@"and when button 1 is tapped and held down", ^{
            beforeEach(^{
                [controller.button1 tapAndHold];
            });
            
            it(@"should show 'PUSH' as it's title", ^{
                in_time(controller.button1.titleLabel.text) should equal(@"PUSH");                
            });
        }); 
    });
});

SPEC_END
