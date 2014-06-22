//
//  WHViewController.m
//  SmileFace
//
//  Created by 吴海涛 on 14-6-22.
//  Copyright (c) 2014年 吴海涛. All rights reserved.
//
#define kImageWidth 40
#define kImageHeight 40
#define kImageDeltaUp 40
#define kImageViewCount 9
#import "WHViewController.h"

@interface WHViewController ()

@end

@implementation WHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self addImageViews];
    int columns = 2;
    int totalRow = kImageViewCount / columns + 1;
    CGFloat margin = (self.view.frame.size.width - columns * kImageWidth) / (columns + 1);
    CGFloat marginY = (self.view.frame.size.height - totalRow  * kImageHeight) / (totalRow + 1);
//    [self addImageViewsWithX:positionX andY:positionY];
    for(int i = 0 ; i < kImageViewCount ; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"01%d.png",i];
        int currentColumn = i % columns ;
        int currentRow = i / columns;
        CGFloat positionX = margin + currentColumn * (margin + kImageWidth);
        CGFloat positionY = marginY  + currentRow * (marginY + kImageHeight);
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

- (IBAction)segementValueChanged:(UISegmentedControl *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    NSInteger selectedIndex = sender.selectedSegmentIndex;
    NSInteger columns = selectedIndex + 2;
    CGFloat margin = (self.view.frame.size.width - columns * kImageWidth) / (columns + 1);
    int totalRow = kImageViewCount / columns + 1;
    CGFloat marginY = (self.view.frame.size.height - totalRow  * kImageHeight) / (totalRow + 1);
    NSArray *subViews = [self.view subviews];
    for(int i = 0 ; i < kImageViewCount ; i ++)
    {
        UIView *imageView = [subViews objectAtIndex:(i + 1)];
        CGRect tempRect = imageView.frame;
        int currentColumn = i % columns;
        int currentRow = i / columns;
        CGFloat x = margin + (kImageWidth + margin) * currentColumn;
        CGFloat y = marginY  + (kImageHeight + marginY) * currentRow;
        tempRect.origin = CGPointMake(x, y);
        imageView.frame = tempRect;
    }
    [UIView commitAnimations];
    
}
@end
