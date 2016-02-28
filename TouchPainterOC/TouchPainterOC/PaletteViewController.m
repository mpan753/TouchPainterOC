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
#import "SetStrokeSizeCommand.h"

@interface PaletteViewController () <SetStrokeColorCommandDelegate, SetStrokeSizeCommandDelegate>
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
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _redSlider.value = [userDefaults floatForKey:@"red"];
    _greenSlider.value = [userDefaults floatForKey:@"green"];
    _blueSlider.value = [userDefaults floatForKey:@"blue"];
    _sizeSlider.value = [userDefaults floatForKey:@"size"];
    _paletteView.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:_redSlider.value forKey:@"red"];
    [userDefaults setFloat:_greenSlider.value forKey:@"green"];
    [userDefaults setFloat:_blueSlider.value forKey:@"blue"];
    [userDefaults setFloat:_sizeSlider.value forKey:@"size"];
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

- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size {
    *size = _sizeSlider.value;
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
