//
//  GradientViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//
/**
 * 关于 CAGradientLayer 这里有一个争论，iPhone 的坐标系到底从哪开始？
 * 正常情况下，一般左上角是 (0,  0），从下面的 startPoint 和 endPoint 可以得出此结论。
 * 但是网上也有不同看法，暂时没找到官方文档。
 */
#import "GradientViewController.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor colorWithRed:240 / 250.0 green:240 / 250.0 blue:240 / 250.0 alpha:0.9];
    contentView.bounds = CGRectMake(0, 0, 256, 256);
    contentView.center = self.view.center;
    [self.view addSubview:contentView];

    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = contentView.bounds;
    layer.colors = @[(__bridge id)UIColor.blueColor.CGColor, (__bridge id)UIColor.brownColor.CGColor, (__bridge id)UIColor.systemPinkColor.CGColor];
    layer.locations = @[@0.0, @0.2, @0.6];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    [contentView.layer addSublayer:layer];
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
