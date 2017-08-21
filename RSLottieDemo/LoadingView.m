//
//  LoadingView.m
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/8/15.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "LoadingView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface LoadingView ()
@property (nonatomic, strong) LOTAnimationView *animationView;

@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation LoadingView
+ (instancetype)shareManager {
    static LoadingView *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark 控件布局
// 设置子控件的frame
- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.animationView.frame = CGRectMake(0, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT /2);
    self.animationView.center = self.center;
}
#pragma mark 懒加载
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
- (void)setupAnimationView {
    self.backgroundColor = [UIColor clearColor];
    
    self.animationView = [self createAnimationView];
    self.animationView.contentMode = UIViewContentModeScaleAspectFit;
    self.animationView.loopAnimation = YES;
    [self addSubview:self.animationView];
    
    [self.animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"播放完毕");
    }];
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
}
- (void)dismissLoadingView {
    self.hidden = YES;
}
- (LOTAnimationView *)createAnimationView {
    LOTAnimationView* animationView;
    animationView = [LOTAnimationView animationNamed:@"Voice"];
    return animationView;
}
#pragma mark --------功能实现相关方法--------
- (void)doSomething {
    //..
}
#pragma mark -------------其它-------------
- (void)otherToolsFunc {
    //..
}
@end

#pragma mark -----------延展方法------------
