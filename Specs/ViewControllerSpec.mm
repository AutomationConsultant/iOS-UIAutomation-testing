#import "UIButton+PC.h"
#import "CedarAsync.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import <UIKit/UIKit.h>
#import "SpecModule.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController1", ^{    
    __block UIWindow *window;
    __block ViewController1 *controller;
    __block UINavigationController *navController;
    __block id<BSInjector> injector;
    
    // in this case, this will be the cedar spec harness (result viewer)
    UIView *view = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
    
    describe(@"when the view appears", ^{
        beforeEach(^{
            injector = [Blindside injectorWithModule:[SpecModule module]];
            
            // loading of the view under test into a main app window (removing spec harness)
            window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            navController = [injector getInstance:@"navController1"];
            controller = (ViewController1 *)[navController topViewController];
            window.rootViewController = navController;
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
        
        describe(@"and when the next button is tapped", ^{
            beforeEach(^{
                [controller.nextButton tap];
            });
            
            it(@"should push a view controller 2 on to the top of the nav stack", ^{
                NSLog(@"================> %@", [navController topViewController]);
                in_time([navController topViewController]) should be_instance_of([ViewController2 class]);
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
