//
//  WHViewController.m
//  SmileFace
//
//  Created by 吴海涛 on 14-6-22.
//  Copyright (c) 2014年 吴海涛. All rights reserved.
//
#define kImageWidth 40
#define kImageHeight 40

#import "WHViewController.h"

@interface WHViewController ()

@end

@implementation WHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self addImageViews];
    int columns = 2;
    CGFloat margin = (self.view.frame.size.width - columns * kImageWidth) / (columns + 1);
//    [self addImageViewsWithX:positionX andY:positionY];
    for(int i = 0 ; i < 9 ; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"01%d.png",i];
        int currentColumn = i % columns ;
        int currentRow = i / columns;
        CGFloat positionX = margin + currentColumn * (margin + kImageWidth);
        CGFloat positionY = margin + currentRow * (margin + kImageHeight);
        [self addImageViewsWithX:positionX andY:positionY imageName:imageName];
    }
}
#pragma mark private add imageViews to self.views;
- (void) addImageViewsWithX:(CGFloat)x andY:(CGFloat)y imageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(x, y,kImageWidth,kImageHeight);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segementValueChanged:(UISegmentedControl *)sender {
}
@end
