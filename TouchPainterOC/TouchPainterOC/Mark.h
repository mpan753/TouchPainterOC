//
//  Mark.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"


@protocol Mark <NSObject>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) id <Mark>lastChild;

- (void)addMark:(id <Mark>)mark;
- (void)removeMark:(id <Mark>)mark;

- (void) acceptMarkVisitor:(id <MarkVisitor>) visitor;

@end
