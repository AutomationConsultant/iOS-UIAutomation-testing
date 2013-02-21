#import "ViewController1.h"
#import "ViewController2.h"

@implementation ViewController1

- (IBAction)didTapButton:(UIButton *)sender {
    self.buttonTapCount++;
    NSString *normalTitle = [sender titleForState:UIControlStateNormal];
    normalTitle = [normalTitle substringToIndex:8];
    [sender setTitle:[NSString stringWithFormat:@"%@ √", normalTitle] forState:UIControlStateNormal];
}

- (IBAction)didTapNextButton:(id)sender {
    ViewController2 *controller = [[ViewController2 alloc] initWithNibName:@"ViewController2"
                                                                    bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
