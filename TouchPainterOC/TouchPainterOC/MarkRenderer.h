//
//  MarkRenderer.h
//  TouchPainterOC
//
//  Created by Pan Meng on 2/25/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@import UIKit;

@interface MarkRenderer : NSObject <MarkVisitor>

- (id) initWithCGContext:(CGContextRef)context;

@end

