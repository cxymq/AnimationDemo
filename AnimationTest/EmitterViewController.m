//
//  EmitterViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/22.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "EmitterViewController.h"

@interface EmitterViewController ()

@end

@implementation EmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAEmitterLayer *emittrLayer = [CAEmitterLayer layer];
    emittrLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:emittrLayer];

    // 配置 emitter
    emittrLayer.renderMode = kCAEmitterLayerAdditive;
    emittrLayer.emitterPosition = CGPointMake(emittrLayer.frame.size.width * 0.5, emittrLayer.frame.size.height * 0.5);

    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"wo_red"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2;
    emittrLayer.emitterCells = @[cell];
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
