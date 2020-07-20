//
//  ShapeViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//

/**
 * 参考：https://zsisme.gitbooks.io/ios-/content/chapter6/cashapelayer.html
 *CAShapeLayer 是一个通过矢量图形而不是 bitmap 来绘制的图层子类。
 *你指定诸如颜色和线宽等属性，用 CGPath 来定义想要绘制的图形，最后 CAS hapeLayer 就自动渲染出来了。
 *当然，你也可以用 Core Graphics 直接向原始的 CALyer 的内容中绘制一个路径，相比直下，使用 CAShapeLayer 有以下一些优点：
 * 1. 渲染快速。CAShapeLayer 使用了硬件加速，绘制同一图形会比用 Core Graphics 快很多。
 * 2. 高效使用内存。一个 CAShapeLayer 不需要像普通 CALayer 一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
 * 3. 不会被图层边界剪裁掉。一个 CAShapeLayer 可以在边界之外绘制。你的图层路径不会像在使用 Core Graphics 的普通 CALayer 一样被剪裁掉（如我们在第二章所见）。
 * 4. 不会出现像素化。当你给 CAShapeLayer 做 3D 变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 * demo 参考：https://github.com/CaiShengbo/Penguin
*/
#import "ShapeViewController.h"

@interface ShapeViewController ()

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    NSTimeInterval delay = 1;
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor colorWithRed:240 / 250.0 green:240 / 250.0 blue:240 / 250.0 alpha:0.9];
    contentView.bounds = CGRectMake(0, 0, 256, 256);
    contentView.center = self.view.center;
    [self.view addSubview:contentView];

    // 头型
    UIBezierPath *headPath = [UIBezierPath bezierPath];
    [headPath moveToPoint:CGPointMake(55, 110)];
    [headPath addQuadCurveToPoint:CGPointMake(128, 10) controlPoint:CGPointMake(60, 13)];
    [headPath addQuadCurveToPoint:CGPointMake(203, 110) controlPoint:CGPointMake(198, 13)];
    [headPath addQuadCurveToPoint:CGPointMake(55, 110) controlPoint:CGPointMake(128, 135)];

    CAShapeLayer *headlLayer = [CAShapeLayer layer];
    headlLayer.path = headPath.CGPath;
    [self addLayerAnimationWithLayer:headlLayer delay:delay * 0 toLayer:contentView.layer fillColor:nil];

    // 左眼
    UIBezierPath *leftEyePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(95, 38, 27, 37)];

    CAShapeLayer *leftEyeLayer = [CAShapeLayer layer];
    leftEyeLayer.path = leftEyePath.CGPath;
    [self addLayerAnimationWithLayer:leftEyeLayer delay:delay * 1 toLayer:contentView.layer fillColor:nil];

    // 左眼球
    UIBezierPath *leftEyeBallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(107, 51, 11, 16)];
    CAShapeLayer *leftEyeBallLayer = [CAShapeLayer layer];
    leftEyeBallLayer.path = leftEyeBallPath.CGPath;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        animation.fromValue = (__bridge id _Nullable)(UIColor.clearColor.CGColor);
        animation.toValue = (__bridge id _Nullable)(UIColor.blackColor.CGColor);
        animation.duration = delay;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;

        [contentView.layer addSublayer:leftEyeBallLayer];
        [leftEyeBallLayer addAnimation:animation forKey:nil];
    });

    // 右眼
    UIBezierPath *rightEyePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(135, 38, 27, 37)];
    CAShapeLayer *rightEyeLayer = [CAShapeLayer layer];
    rightEyeLayer.path = rightEyePath.CGPath;
    [self addLayerAnimationWithLayer:rightEyeLayer delay:delay * 3 toLayer:contentView.layer fillColor:nil];

    // 右眼球
    UIBezierPath *rightEyeBallPath = [UIBezierPath bezierPath];
    [rightEyeBallPath moveToPoint:CGPointMake(139, 60)];
    [rightEyeBallPath addQuadCurveToPoint:CGPointMake(155, 56) controlPoint:CGPointMake(145, 51)];
    [rightEyeBallPath addLineToPoint:CGPointMake(154, 60)];
    [rightEyeBallPath addQuadCurveToPoint:CGPointMake(140, 61) controlPoint:CGPointMake(146, 52)];

    CAShapeLayer *rightEyeBallLayer = [CAShapeLayer layer];
    rightEyeBallLayer.path = rightEyeBallPath.CGPath;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * 4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        animation.fromValue = (__bridge id _Nullable)(UIColor.clearColor.CGColor);
        animation.toValue = (__bridge id _Nullable)(UIColor.blackColor.CGColor);
        animation.duration = delay;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;

        [contentView.layer addSublayer:rightEyeBallLayer];
        [rightEyeBallLayer addAnimation:animation forKey:nil];
    });

    // 嘴
    UIBezierPath *mousePath = [UIBezierPath bezierPath];
    [mousePath moveToPoint:CGPointMake(82, 92)];
    [mousePath addQuadCurveToPoint:CGPointMake(174, 92) controlPoint:CGPointMake(128, 78)];
    [mousePath addQuadCurveToPoint:CGPointMake(82, 92) controlPoint:CGPointMake(128, 130)];

    CAShapeLayer *mouseLayer = [CAShapeLayer layer];
    mouseLayer.path = mousePath.CGPath;
    [self addLayerAnimationWithLayer:mouseLayer delay:delay * 5 toLayer:contentView.layer fillColor:nil];

    // 围巾
    UIBezierPath *scarfPath = [UIBezierPath bezierPath];
    [scarfPath moveToPoint:CGPointMake(55, 110)];
    [scarfPath addQuadCurveToPoint:CGPointMake(203, 110) controlPoint:CGPointMake(128, 135)];
    [scarfPath addLineToPoint:CGPointMake(213, 135)];
    [scarfPath addQuadCurveToPoint:CGPointMake(114, 148) controlPoint:CGPointMake(155, 155)];
    [scarfPath addLineToPoint:CGPointMake(114, 180)];
    [scarfPath addQuadCurveToPoint:CGPointMake(81, 178) controlPoint:CGPointMake(99, 182)];
    [scarfPath addLineToPoint:CGPointMake(81, 144)];
    [scarfPath addQuadCurveToPoint:CGPointMake(44, 135) controlPoint:CGPointMake(62, 141)];
    [scarfPath closePath];
    CAShapeLayer *scarfLayer = [CAShapeLayer layer];
    scarfLayer.path = scarfPath.CGPath;
    [self addLayerAnimationWithLayer:scarfLayer delay:delay * 6 toLayer:contentView.layer fillColor:nil];

    // 胳膊
    UIBezierPath *armPath = [UIBezierPath bezierPath];
    [armPath moveToPoint:CGPointMake(44, 135)];
    [armPath addLineToPoint:CGPointMake(33, 171)];
    [armPath addQuadCurveToPoint:CGPointMake(31, 204) controlPoint:CGPointMake(25, 191)];
    [armPath addQuadCurveToPoint:CGPointMake(52, 180) controlPoint:CGPointMake(41, 200)];
    [armPath addQuadCurveToPoint:CGPointMake(128, 244) controlPoint:CGPointMake(75, 250)];
    [armPath addQuadCurveToPoint:CGPointMake(204, 180) controlPoint:CGPointMake(181, 250)];
    [armPath addQuadCurveToPoint:CGPointMake(225, 204) controlPoint:CGPointMake(214, 200)];
    [armPath addQuadCurveToPoint:CGPointMake(223, 171) controlPoint:CGPointMake(231, 191)];
    [armPath addLineToPoint:CGPointMake(212, 135)];
    // 肚子
    [armPath addQuadCurveToPoint:CGPointMake(183, 145) controlPoint:CGPointMake(198, 140)];
    [armPath addCurveToPoint:CGPointMake(128, 235) controlPoint1:CGPointMake(190, 183) controlPoint2:CGPointMake(171, 240)];
    [armPath addCurveToPoint:CGPointMake(73, 143) controlPoint1:CGPointMake(85, 240) controlPoint2:CGPointMake(66, 183)];
    [armPath addQuadCurveToPoint:CGPointMake(44, 135) controlPoint:CGPointMake(58, 140)];
    CAShapeLayer *armLayer = [CAShapeLayer layer];
    armLayer.path = armPath.CGPath;
    [self addLayerAnimationWithLayer:armLayer delay:delay * 7 toLayer:contentView.layer fillColor:nil];

    // 左脚
    UIBezierPath *leftlegPath = [UIBezierPath bezierPath];
    [leftlegPath moveToPoint:CGPointMake(77, 227)];
    [leftlegPath addQuadCurveToPoint:CGPointMake(56, 237) controlPoint:CGPointMake(64, 231)];
    [leftlegPath addQuadCurveToPoint:CGPointMake(56, 242) controlPoint:CGPointMake(50, 239)];
    [leftlegPath addQuadCurveToPoint:CGPointMake(126, 244) controlPoint:CGPointMake(91, 248)];
    [leftlegPath addQuadCurveToPoint:CGPointMake(77, 227) controlPoint:CGPointMake(96, 244)];
    CAShapeLayer *leftLegLayer = [CAShapeLayer layer];
    leftLegLayer.path = leftlegPath.CGPath;
    [self addLayerAnimationWithLayer:leftLegLayer delay:delay * 8 toLayer:contentView.layer fillColor:nil];

    // 右脚
    UIBezierPath *rightlegPath = [UIBezierPath bezierPath];
    [rightlegPath moveToPoint:CGPointMake(179, 227)];
    [rightlegPath addQuadCurveToPoint:CGPointMake(200, 237) controlPoint:CGPointMake(292, 231)];
    [rightlegPath addQuadCurveToPoint:CGPointMake(200, 242) controlPoint:CGPointMake(206, 239)];
    [rightlegPath addQuadCurveToPoint:CGPointMake(130, 244) controlPoint:CGPointMake(165, 248)];
    [rightlegPath addQuadCurveToPoint:CGPointMake(179, 227) controlPoint:CGPointMake(160, 244)];
    CAShapeLayer *rightLegLayer = [CAShapeLayer layer];
    rightLegLayer.path = rightlegPath.CGPath;
    [self addLayerAnimationWithLayer:rightLegLayer delay:delay * 9 toLayer:contentView.layer fillColor:nil];
    // 上色
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * 15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        headlLayer.fillColor = UIColor.blackColor.CGColor;
        leftEyeLayer.fillColor = UIColor.whiteColor.CGColor;
        rightEyeLayer.fillColor = UIColor.whiteColor.CGColor;
        mouseLayer.fillColor = [UIColor colorWithRed:246 / 255.0 green:146 / 255.0 blue:12 / 255.0 alpha:1.0].CGColor;
        armLayer.fillColor = UIColor.blackColor.CGColor;
        leftLegLayer.fillColor = [UIColor colorWithRed:246 / 255.0 green:146 / 255.0 blue:12 / 255.0 alpha:1.0].CGColor;
        rightLegLayer.fillColor = [UIColor colorWithRed:246 / 255.0 green:146 / 255.0 blue:12 / 255.0 alpha:1.0].CGColor;
        scarfLayer.fillColor = [UIColor colorWithRed:223 / 255.0 green:0 / 255.0 blue:25 / 255.0 alpha:1.0].CGColor;
        scarfLayer.lineWidth = 0;
        leftLegLayer.lineWidth = 0;
        rightLegLayer.lineWidth = 0;
    });
}

- (void)addLayerAnimationWithLayer:(CAShapeLayer *)layer delay:(NSTimeInterval)delay toLayer:(CALayer *)toLayer fillColor:(nullable CGColorRef)fillColor {
    if (!fillColor) {
        fillColor = UIColor.clearColor.CGColor;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer.fillColor = fillColor;
        layer.lineWidth = 1;
        layer.strokeColor = UIColor.blackColor.CGColor;

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = [NSNumber numberWithFloat:0];
        animation.toValue = [NSNumber numberWithFloat:1];
        animation.duration = delay;
        // fillMode 详解：https://www.jianshu.com/p/91fccd32f6fb
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [layer addAnimation:animation forKey:nil];
        [toLayer addSublayer:layer];
    });
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
