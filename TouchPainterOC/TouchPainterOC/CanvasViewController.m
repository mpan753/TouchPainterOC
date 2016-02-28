//
//  CanvasViewController.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "CanvasViewController.h"
#import "CoordinatingViewController.h"
#import "Dot.h"
#import "Stroke.h"
#import "Vertex.h"
#import "CommandBarButton.h"

@interface CanvasViewController ()

@property (strong, nonatomic) IBOutlet CoordinatingViewController *coordinator;

@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation CanvasViewController

#pragma mark - Property

- (void)setScribble:(Scribble *)scribble {
    if (_scribble != scribble) {
        [_scribble removeObserver:self forKeyPath:@"mark"];
        _scribble = scribble;
        [_scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CanvasViewGenerator *canvasGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:canvasGenerator];
    
    self.scribble = [[Scribble alloc] init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redColor = [userDefaults floatForKey:@"red"];
    CGFloat greenColor = [userDefaults floatForKey:@"green"];
    CGFloat blueColor = [userDefaults floatForKey:@"blue"];
    self.strokeSize = [userDefaults floatForKey:@"size"];
    self.strokeColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CanvasView *canvasV = [generator canvasViewWithFrame:CGRectMake(0, 0, width, height - 44)];
    [self setCanvasView:canvasV];
    [self.view addSubview:self.canvasView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = [[touches anyObject] locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    if (CGPointEqualToPoint(self.startPoint, lastPoint)) {
        Stroke *stroke = [[Stroke alloc] init];
        stroke.color = self.strokeColor;
        stroke.size = self.strokeSize;
        [self.scribble addMark:stroke shouldAddToPreviousMark:NO];
    }
    
    CGPoint currentPoint = [[touches anyObject] locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:currentPoint];
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint previousPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    CGPoint currentPoint = [[touches anyObject] locationInView:self.canvasView];
    if (CGPointEqualToPoint(previousPoint, currentPoint)) {
        Dot *dot = [[Dot alloc] initWithLocation:currentPoint];
        dot.color = self.strokeColor;
        dot.size = self.strokeSize;
        [self.scribble addMark:dot shouldAddToPreviousMark:NO];
    }
    self.startPoint = CGPointZero;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = CGPointZero;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqual:@"mark"]) {
        id<Mark> mark = change[NSKeyValueChangeNewKey];
        [self.canvasView setMark:mark];
        [self.canvasView setNeedsDisplay];
    }
}

#pragma - 
- (IBAction) onCustomBarButtonHit:(CommandBarButton *)barButton {
    [[barButton commandM] execute];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
