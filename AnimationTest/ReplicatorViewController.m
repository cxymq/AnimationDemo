//
//  ReplicatorViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/21.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "ReplicatorViewController.h"
#import "ReflectionView.h"

@interface ReplicatorViewController ()

@property (nonatomic, strong) ReflectionView *reflectionView;

@end

@implementation ReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;

    ReflectionView *reflectionView = [[ReflectionView alloc] initWithFrame:CGRectMake(0, 150, 300, 260)];
    [self.view addSubview:reflectionView];
    self.reflectionView = reflectionView;

    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = UIColor.systemPinkColor;
    imgView.image = [UIImage imageNamed:@"hair"];
    imgView.frame = CGRectMake(0, 0, 300, 260);
    [self.reflectionView addSubview:imgView];

    UIView *contentView = [UIView new];
    contentView.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:contentView];

    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.instanceCount = 10;
    layer.frame = contentView.bounds;
    [contentView.layer addSublayer:layer];

    CATransform3D tf = CATransform3DIdentity;
    tf = CATransform3DTranslate(tf, 0, 100, 0);
    tf = CATransform3DRotate(tf, M_PI / 5.0, 0, 0, 1);
    tf = CATransform3DTranslate(tf, 0, -100, 0);
    layer.instanceTransform = tf;

    layer.instanceBlueOffset = -0.1;
    layer.instanceGreenOffset = -0.1;

    CALayer *ly = [CALayer layer];
    ly.frame = CGRectMake(0, 0, 50, 50);
    ly.backgroundColor = UIColor.whiteColor.CGColor;
    [layer addSublayer:ly];
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
