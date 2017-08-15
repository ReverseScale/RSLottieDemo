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
#import "LoadingView.h"

@interface ViewController (){
    LoadingView *loadView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%ld", self.animationType);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [self naviTitleChoeseWithType:self.animationType];
    
    switch (self.animationType) {
        case 2:
            [self setupLoadingView];
            break;
        case 3:
            [self createGuidePageView];
            break;
        default:
            [self setupAnimationView];
            break;
    }
}
- (void)setupLoadingView {
    loadView = [LoadingView new];
    loadView.frame = CGRectMake(0, 0, 250, 250);
    loadView.center = self.view.center;
    [self.view addSubview:loadView];
    
    // 延时操作
    double delayInSeconds = 2.0;
    __weak __typeof(self)weakSelf = self;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf dismissLoadingView];
    });
}
- (void)dismissLoadingView {
    loadView.hidden = YES;
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
    [self alertView];
//    GuidePageView *guidePageView = [GuidePageView new];
//    guidePageView.frame = self.view.bounds;
//    [self.view addSubview:guidePageView];
//    
//    [guidePageView handlerAction:^(NSString *str) {
//        [guidePageView removeFromSuperview];
//    }];
}
- (NSString *)naviTitleChoeseWithType:(NSInteger)type {
    switch (type) {
        case 0:
            return @"本地数据动画";
            break;
        case 1:
            return @"网络数据动画";
            break;
        case 2:
            return @"加载数据动画 加载页";
            break;
        default:
            return @"本地数据动画 引导页";
            break;
    }
}
- (void)alertView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"为避免版权纠纷，图片素材已清除" message:@"实现方法见GuidePageView" preferredStyle:UIAlertControllerStyleAlert];
    // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
