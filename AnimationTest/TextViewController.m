//
//  TextViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "TextViewController.h"
#import <CoreText/CoreText.h>

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self simulatorLabel];
    [self richText];
}

- (void)simulatorLabel {
    // 初始化视图，存放 CATextLayer
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 300, 200)];
    [self.view addSubview:labelView];

    // 初始化 CATextLayer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    [labelView.layer addSublayer:textLayer];

    // 设置文本属性
    textLayer.foregroundColor = UIColor.blackColor.CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;

    // 设置字体
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);

    NSString *text = @"这是一段很长的文字，真的特别长你还别不信大师傅。不知道言怎吗没地方三分阿斯顿发大声道打的费啊。 我是法师打发点手动阀事发地点啊啊发生大的发的发案说法顺丰大厦3玩儿冯绍峰，阿的说法发达。而发生的法律；什么法律阿斯顿发马拉喀什没带饭卡里。";
    textLayer.string = text;
    // 防止字体像素化
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}

- (void)richText {
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 300, 200)];
    [self.view addSubview:labelView];

    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [labelView.layer addSublayer:textLayer];

    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;

    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *text = @"这是一段很长的文字，真的特别长你还别不信大师傅。不知道言怎吗没地方三分阿斯顿发大声道打的费啊。 我是法师打发点手动阀事发地点啊啊发生大的发的发案说法顺丰大厦3玩儿冯绍峰，阿的说法发达。而发生的法律；什么法律阿斯顿发马拉喀什没带饭卡里。";
    NSMutableAttributedString *attStr = nil;
    attStr = [[NSMutableAttributedString alloc] initWithString:text];

    // 将 UIFont 转化成 CTFont
    CFStringRef name = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef ctFont = CTFontCreateWithName(name, fontSize, nil);

    // 设置文本属性
    NSDictionary *attDic = @{
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)UIColor.blackColor.CGColor,
        (__bridge id)kCTFontNameAttribute: (__bridge id)ctFont
    };
    [attStr setAttributes:attDic range:NSMakeRange(0, attStr.length)];
    attDic = @{
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)UIColor.redColor.CGColor,
        (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
        (__bridge id)kCTFontNameAttribute: (__bridge id)ctFont
    };
    [attStr setAttributes:attDic range:NSMakeRange(5, 6)];
    CFRelease(ctFont);
    textLayer.string = attStr;
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
