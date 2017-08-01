//
//  ViewController.m
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/7/25.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>
#import "GuidePageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [self naviTitleChoeseWithType:self.animationType];
    
    if (self.animationType == 2) {
        [self createGuidePageView];
    } else {
        [self setupAnimationView];
    }
}
- (void)setupAnimationView {
    LOTAnimationView* animationView = [self createAnimationView];
    animationView.contentMode = UIViewContentModeScaleAspectFit;
    animationView.loopAnimation = YES;
    animationView.frame = CGRectMake(0, 0, 356, 270);
    animationView.center = self.view.center;
    [self.view addSubview:animationView];
    
    [animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"播放完毕");
    }];
}
- (LOTAnimationView *)createAnimationView {
    LOTAnimationView* animationView;
    if (self.animationType) {
        animationView = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://github.com/airbnb/lottie-ios/raw/master/Example/Assets/PinJump.json"]];
    } else {
        animationView = [LOTAnimationView animationNamed:@"vr_animation"];
    }
    return animationView;
}
- (void)createGuidePageView {
    GuidePageView *guidePageView = [GuidePageView new];
    guidePageView.frame = self.view.bounds;
    [self.view addSubview:guidePageView];
    
    [guidePageView handlerAction:^(NSString *str) {
        [guidePageView removeFromSuperview];
    }];
}
- (NSString *)naviTitleChoeseWithType:(NSInteger)type {
    switch (type) {
        case 0:
            return @"本地数据动画";
            break;
        case 1:
            return @"网络数据动画";
            break;
        default:
            return @"本地数据动画 引导页";
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
