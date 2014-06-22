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
    [self changeOrAddImageViesBySelectedIndex:0];
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
}

- (IBAction)segementValueChanged:(UISegmentedControl *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    NSInteger selectedIndex = sender.selectedSegmentIndex;
    [self changeOrAddImageViesBySelectedIndex:selectedIndex];
    [UIView commitAnimations];
    
}
- (void)changeOrAddImageViesBySelectedIndex:(NSInteger)selectedIndex
{
    NSInteger columns = selectedIndex + 2;
    CGFloat margin = (self.view.frame.size.width - columns * kImageWidth) / (columns + 1);
    int totalRow = kImageViewCount / columns + 1;
    CGFloat marginY = (self.view.frame.size.height - totalRow  * kImageHeight) / (totalRow + 1);
    for(int i = 0 ; i < kImageViewCount ; i ++)
    {
        int currentColumn = i % columns;
        int currentRow = i / columns;
        CGFloat x = margin + (kImageWidth + margin) * currentColumn;
        CGFloat y = marginY  + (kImageHeight + marginY) * currentRow;
        if(self.segmentedControl.selectedSegmentIndex == -1)
        {
            NSString *imageName = [NSString stringWithFormat:@"01%d.png",i];
            [self addImageViewsWithX:x andY:y imageName:imageName];
//            NSLog(@"add new ImageView hooo");
        }else
        {
            UIView *imageView = [self.view.subviews objectAtIndex:(i + 1)];
            CGRect tempRect = imageView.frame;
            tempRect.origin = CGPointMake(x, y);
            imageView.frame = tempRect;
        }
    }
    if(self.segmentedControl.selectedSegmentIndex == -1)
    {
        [self.segmentedControl setSelectedSegmentIndex:0];
    }
}
@end
