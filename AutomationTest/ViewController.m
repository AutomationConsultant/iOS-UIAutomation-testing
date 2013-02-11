#import "ViewController.h"
#import "UIButton+PC.h"


@implementation ViewController

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize buttons;

static int blockIndex = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];    
    self.buttons = [NSMutableArray array];
    [self.buttons addObject:self.button1];
    [self.buttons addObject:self.button2];
    [self.buttons addObject:self.button3];
    [self.buttons addObject:self.button4];
    
    __block void(^pushButton)(void) = ^() {
        UIButton *button = [self.buttons objectAtIndex:blockIndex++ % self.buttons.count];
        [button tap];        
        sleep(1);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), pushButton);
    };
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), pushButton);
}

@end
