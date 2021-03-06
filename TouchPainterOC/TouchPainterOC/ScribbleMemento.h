//
//  ScribbleMemento.h
//  TouchPainterOC
//
//  Created by Mia on 2/27/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject

@property (nonatomic, strong) id<Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

+ (ScribbleMemento *)mementoWithData:(NSData *)data;

- (id) initWithMark:(id <Mark>)aMark;

- (NSData *) data;




@end
