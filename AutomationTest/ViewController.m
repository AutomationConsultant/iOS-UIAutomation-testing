#import "ViewController.h"


@implementation ViewController

- (IBAction)didTapButton:(id)sender
{
    self.buttonTapCount++;
    self.button1.backgroundColor = [UIColor blueColor];
}

@end
