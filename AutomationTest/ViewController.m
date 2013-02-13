#import "ViewController.h"
#import "UIButton+PC.h"


typedef void(^PushButtonBlock)();

@interface ViewController ()

@property (strong, nonatomic) PushButtonBlock pushButton;

@end

@implementation ViewController

static int blockIndex = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.buttons = [NSMutableArray array];
    [self.buttons addObject:self.button1];
    [self.buttons addObject:self.button2];
    [self.buttons addObject:self.button3];
    [self.buttons addObject:self.button4];

    __weak NSMutableArray *weakButtons = self.buttons;
    __weak ViewController *weakSelf = self;
    
    self.pushButton = ^() {
        UIButton *button = [weakButtons objectAtIndex:blockIndex++ % weakButtons.count];
        [button tap];        
        sleep(1);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), weakSelf.pushButton);
    };
    
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), self.pushButton);
    self.pushButton();
}

@end
