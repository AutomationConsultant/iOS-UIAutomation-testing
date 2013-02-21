#import "AppDelegate.h"
#import "ViewController1.h"
#import "SpecModule.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id<BSInjector> injector = [Blindside injectorWithModule:[SpecModule module]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *navController1 = [injector getInstance:@"navController1"];
    self.window.rootViewController = navController1;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
