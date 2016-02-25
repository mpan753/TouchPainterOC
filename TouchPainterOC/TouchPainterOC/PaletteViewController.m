//
//  PaletteViewController.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "PaletteViewController.h"
#import "CoordinatingViewController.h"
#import "SetStrokeColorCommand.h"

@interface PaletteViewController () <SetStrokeColorCommandDelegate>
{
    IBOutlet CommandSlider *_redSlider;
    IBOutlet CommandSlider *_greenSlider;
    IBOutlet CommandSlider *_blueSlider;
    IBOutlet CommandSlider *_sizeSlider;
    IBOutlet UIView *_paletteView;
}

@property (strong, nonatomic) IBOutlet CoordinatingViewController *coordinator;



@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    SetStrokeColorCommand *
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)slider {
    [[slider commandM] execute];
}

#pragma mark - SetStrokeColorCommandDelegate

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = [_redSlider value];
    *green = [_greenSlider value];
    *blue = [_blueSlider value];
}

- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color {
    _paletteView.backgroundColor = color;
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
