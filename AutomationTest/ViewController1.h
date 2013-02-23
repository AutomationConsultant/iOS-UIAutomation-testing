#import <UIKit/UIKit.h>


@interface ViewController1 : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (assign, nonatomic) NSInteger buttonTapCount;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)didTapButton:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)didTapNextButton:(id)sender;

@end
