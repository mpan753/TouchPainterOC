//
//  CoordinatingViewController.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "CoordinatingViewController.h"
#import "PaletteViewController.h"
#import "CanvasViewController.h"

@interface CoordinatingViewController ()

@property (nonatomic) UIViewController *activeViewController;
@property (nonatomic) CanvasViewController *canvasViewController;

@end

@implementation CoordinatingViewController

static CoordinatingViewController* sharedInstance = nil;

+ (CoordinatingViewController *)sharedCoordinator;
{
    if (!sharedInstance) {
        sharedInstance = [[CoordinatingViewController alloc] init];
        [sharedInstance initialize];
    }
    return sharedInstance;
}

- (void)initialize
{
    self.canvasViewController = [[CanvasViewController alloc] init];
    self.activeViewController = self.canvasViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestViewChangeByObject:(id)object
{
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        switch (((UIBarButtonItem *)object).tag) {
            case kButtonTagOpenPaletteView:
            {
                [self presentViewController:[[PaletteViewController alloc] init] animated:YES completion:nil];
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                
            }
            default:
                break;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
