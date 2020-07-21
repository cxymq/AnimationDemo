//
//  TransformViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor colorWithRed:240 / 250.0 green:240 / 250.0 blue:240 / 250.0 alpha:0.9];
    contentView.bounds = CGRectMake(0, 0, 256, 256 * 2.5);
    contentView.center = self.view.center;
    [self.view addSubview:contentView];
    self.contentView = contentView;

    // 设置透视变换
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    contentView.layer.sublayerTransform = pt;

    // 设置立方体 1
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cu1 = [self cubeWithTransform:c1t];
    [self.contentView.layer addSublayer:cu1];

    // 设置立方体 2
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.contentView.layer addSublayer:cube2];
}

- (CALayer *)cubeWithTransform:(CATransform3D)transfrom {
    // 创建立方体 layer
    CATransformLayer *cubeLayer = [CATransformLayer layer];

    // 添加 面 1 - 6
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];

    CGSize contentSize = self.contentView.bounds.size;
    cubeLayer.position = CGPointMake(contentSize.width / 2, contentSize.height / 2);

    cubeLayer.transform = transfrom;
    return cubeLayer;
}

- (CALayer *)faceWithTransform:(CATransform3D)transform {
    // 创建立方体 面
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);

    // 生成随机颜色
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
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
