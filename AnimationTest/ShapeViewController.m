//
//  ShapeViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//

/**
 *CAShapeLayer 是一个通过矢量图形而不是 bitmap 来绘制的图层子类。
 *你指定诸如颜色和线宽等属性，用 CGPath 来定义想要绘制的图形，最后 CAS hapeLayer 就自动渲染出来了。
 *当然，你也可以用 Core Graphics 直接向原始的 CALyer 的内容中绘制一个路径，相比直下，使用 CAShapeLayer 有以下一些优点：
 * 1. 渲染快速。CAShapeLayer 使用了硬件加速，绘制同一图形会比用 Core Graphics 快很多。
 * 2. 高效使用内存。一个 CAShapeLayer 不需要像普通 CALayer 一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
 * 3. 不会被图层边界剪裁掉。一个 CAShapeLayer 可以在边界之外绘制。你的图层路径不会像在使用 Core Graphics 的普通 CALayer 一样被剪裁掉（如我们在第二章所见）。
 * 4. 不会出现像素化。当你给 CAShapeLayer 做 3D 变换时，它不像一个有寄宿图的普通图层一样变得像素化。
*/
#import "ShapeViewController.h"

@interface ShapeViewController ()

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
