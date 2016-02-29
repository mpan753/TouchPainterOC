//
//  CoordinatingViewController.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "CoordinatingViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"
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
    UIViewController *windowRoot = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        
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
                ThumbnailViewController *thumbnailVC = [[ThumbnailViewController alloc] init];
                [windowRoot presentViewController:thumbnailVC animated:YES completion:nil];
                self.activeViewController = thumbnailVC;
            }
                break;
            default:
            {
                [windowRoot dismissViewControllerAnimated:YES completion:nil];
                self.activeViewController = self.canvasViewController;
            }
                break;
        }
    } else {
        [windowRoot dismissViewControllerAnimated:YES completion:nil];
        self.activeViewController = self.canvasViewController;
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
