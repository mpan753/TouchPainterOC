//
//  CommandBarButton.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/26/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CommandBarButton : UIBarButtonItem

@property (nonatomic, strong) IBOutlet Command *commandM;

@end
