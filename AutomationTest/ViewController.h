#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (assign, nonatomic) NSInteger buttonTapCount;

- (IBAction)didTapButton:(id)sender;

@end
