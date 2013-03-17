#import "AppDelegate.h"
#import "ViewController1.h"
#import "InjectorModule.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id<BSInjector> injector = [Blindside injectorWithModule:[InjectorModule module]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *navController1 = [injector getInstance:@"navController1"];
    navController1.view.accessibilityLabel = @"navController";
    navController1.view.accessibilityIdentifier = @"navControl1";
    self.window.rootViewController = navController1;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
