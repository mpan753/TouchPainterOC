//
//  PaletteViewController.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandSlider.h"


@interface PaletteViewController : UIViewController

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)sender;

@end
