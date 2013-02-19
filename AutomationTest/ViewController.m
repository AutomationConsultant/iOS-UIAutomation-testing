#import "ViewController.h"


@implementation ViewController

- (IBAction)didTapButton:(UIButton *)sender
{
    self.buttonTapCount++;
    NSString *normalTitle = [sender titleForState:UIControlStateNormal];
    normalTitle = [normalTitle substringToIndex:8];
    [sender setTitle:[NSString stringWithFormat:@"%@ √", normalTitle] forState:UIControlStateNormal];
}

@end
