//
//  LoadingView.m
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/8/15.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "LoadingView.h"
#import <Lottie/Lottie.h>

@interface LoadingView ()
@property (nonatomic, strong) LOTAnimationView* animationView;
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation LoadingView

#pragma mark 初始化方法
//nib 创建会调用
+ (void)initialize {
    
}

#pragma mark 代码创建
//纯代码 创建会调用
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubView];
    }
    return self;
}

#pragma mark nib创建
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initSubView];
}

#pragma mark 初始化控件
// 注意：该处不要给子控件设置frame与数据，可以在这里初始化子控件的属性
- (void)initSubView {
    // ...
    [self setupAnimationView];
}
#pragma mark 控件布局
// 设置子控件的frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.animationView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

}
#pragma mark 懒加载
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
- (void)setupAnimationView {
    self.animationView = [self createAnimationView];
    self.animationView.contentMode = UIViewContentModeScaleAspectFit;
    self.animationView.loopAnimation = YES;
    [self addSubview:self.animationView];
    
    [self.animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"播放完毕");
    }];
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
