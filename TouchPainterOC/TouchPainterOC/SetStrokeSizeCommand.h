//
//  SetStrokeSizeCommand.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Command.h"
@import UIKit;

@class SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate

- (void) command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size;

@end

@interface SetStrokeSizeCommand : Command

@property (nonatomic, weak) IBOutlet id<SetStrokeSizeCommandDelegate> delegate;

@end
