//
//  ThumbnailViewController.m
//  TouchPainterOC
//
//  Created by Mia on 2/28/16.
//  Copyright © 2016 Pan Meng. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "CoordinatingViewController.h"
#import "ScribbleThumbnailCell.h"
#import "ScribbleManager.h"

@interface ThumbnailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet CoordinatingViewController *coordinator;
@property (strong, nonatomic) ScribbleManager *scribbleManager;


@end

@implementation ThumbnailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scribbleManager = [[ScribbleManager alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    ScribbleThumbnailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[ScribbleThumbnailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSInteger numberOfSupportedThumbnails = [ScribbleThumbnailCell numberOfPlaceHolders];
    NSInteger numberOfScribbles = [self.scribbleManager numberOfScribbles];
    NSInteger thumbnailIndex = numberOfScribbles * indexPath.row;
    
    for (int i = 0; i < numberOfSupportedThumbnails && thumbnailIndex + i < numberOfScribbles; i++) {
        UIView *scribbleThumbnail = [self.scribbleManager scribbleThumbnailViewAtIndex:thumbnailIndex + i];
        [cell addThumbnailView:scribbleThumbnail atIndex:i];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CGFloat numberOfPlaceholders = [ScribbleThumbnailCell numberOfPlaceHolders];
    NSInteger numberOfScribbles = [self.scribbleManager numberOfScribbles];
    return ceil(numberOfScribbles / numberOfPlaceholders);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

@end
