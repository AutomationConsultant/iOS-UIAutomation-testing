#import "SpecModule.h"
#import "ViewController1.h"

@implementation SpecModule

+ (id<BSModule>)module {
    return [SpecModule new];
}

- (void)configure:(id<BSBinder>)binder {
    ViewController1 *controller1 = [[ViewController1 alloc] initWithNibName:@"ViewController1"
                                                                     bundle:nil];
    [binder bind:[ViewController1 class] toInstance:controller1];
    
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:controller1];
    [binder bind:@"navController1" toInstance:navController1];
}

@end
