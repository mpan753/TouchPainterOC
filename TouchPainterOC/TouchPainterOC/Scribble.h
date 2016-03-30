//
//  Scribble.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

@interface Scribble : NSObject

+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento;

- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;

- (void)removeMark:(id <Mark>)aMark;

- (ScribbleMemento *) scribbleMemento;

@end
