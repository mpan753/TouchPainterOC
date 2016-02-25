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



- (IBAction)requestViewChangeByObject:(id)object
{
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        
        UIViewController *windowRoot = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        
        switch (((UIBarButtonItem *)object).tag) {
            case kButtonTagOpenPaletteView:
            {
                PaletteViewController *paletteVC = [[PaletteViewController alloc] init];
                [windowRoot presentViewController:paletteVC animated:YES completion:nil];
                self.activeViewController = paletteVC;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                
            }
            default:
            {
                [windowRoot dismissViewControllerAnimated:YES completion:nil];
                self.activeViewController = self.canvasViewController;
            }
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
