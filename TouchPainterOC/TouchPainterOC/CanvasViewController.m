//
//  CanvasViewController.m
//  TouchPainterOC
//
//  Created by Pan Meng on 2/24/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "CanvasViewController.h"
#import "CoordinatingViewController.h"

@interface CanvasViewController ()

@property (strong, nonatomic) IBOutlet CoordinatingViewController *coordinator;

@property (nonatomic, retain) CanvasView *canvasView;
@property (nonatomic, retain) Scribble *scribble;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CanvasViewGenerator *canvasGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:canvasGenerator];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
