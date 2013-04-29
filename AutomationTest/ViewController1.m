#import "ViewController1.h"
#import "ViewController2.h"

#import <UIAutomation/UIAutomation.h>

@implementation ViewController1

- (IBAction)didTapButton:(UIButton *)sender forEvent:(UIEvent *)event {
    self.buttonTapCount++;
    NSString *normalTitle = [sender titleForState:UIControlStateNormal];
    normalTitle = [normalTitle substringToIndex:8];
    [sender setTitle:[NSString stringWithFormat:@"%@ √", normalTitle] forState:UIControlStateNormal];
    
//    UIATarget *target = [UIATarget localTarget];
//    UIAApplication *springboard = target.applications[0];
//    UIAApplication *automationtest = target.applications[1];
//    UIAWindow *atwindow = automationtest.mainWindow;
}

- (IBAction)didTapNextButton:(id)sender {
    ViewController2 *controller = [[ViewController2 alloc] initWithNibName:@"ViewController2"
                                                                    bundle:nil];
    
    // animated yes causes button to NOT be in position for uiautmation tap action
    //[self.navigationController pushViewController:controller animated:YES];
    
    [self.navigationController pushViewController:controller animated:NO];
}

@end
