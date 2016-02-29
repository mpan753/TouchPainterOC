//
//  ScribbleSource.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/29/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"


@protocol ScribbleSource <NSObject>

- (Scribble *) scribble;

@end
