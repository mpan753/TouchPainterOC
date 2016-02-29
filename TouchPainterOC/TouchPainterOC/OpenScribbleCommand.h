//
//  OpenScribbleCommand.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "Command.h"
#import "ScribbleSource.h"

@interface OpenScribbleCommand : Command

- (id)initWithScribbleSource:(id <ScribbleSource>)aScribbleSource;

@end
