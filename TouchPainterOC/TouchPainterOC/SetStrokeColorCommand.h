//
//  SetStrokeColorCommand.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Command.h"
@import UIKit;


@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate

- (void) command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue;

- (void) command:(SetStrokeColorCommand *) command didFinishColorUpdateWithColor:(UIColor *) color;

@end

@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) IBOutlet id <SetStrokeColorCommandDelegate> delegate;

@end
