//
//  GuidePageView.m
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/7/25.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "GuidePageView.h"
#import <Lottie/Lottie.h>
#define PageCount 4

@interface GuidePageView ()<UIScrollViewDelegate>
@property (nonatomic, strong) LOTAnimationView *lottieLogo;
@property (nonatomic, strong) UIScrollView *scrollCurtainView;
@property (nonatomic, strong) UIButton *dismissButton;
@end

@implementation GuidePageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupLottieView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lottieLogo.frame = self.bounds;
    
    self.scrollCurtainView.frame = self.bounds;
    self.scrollCurtainView.contentSize = CGSizeMake(self.bounds.size.width * PageCount, self.bounds.size.height);
    
    CGFloat btnX = 50;
    CGFloat btnW = self.bounds.size.width - btnX * 2;
    CGFloat btnH = 80;
    CGFloat btnY = self.bounds.size.height - 25 - btnH;
    self.dismissButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
}
- (void)setupLottieView {
    self.lottieLogo = [LOTAnimationView animationNamed:@"data"];
    [self addSubview:self.lottieLogo];
    
    [self setupScrollView];
}
- (void)setupScrollView {
    self.scrollCurtainView = [UIScrollView new];
    [self.scrollCurtainView setShowsHorizontalScrollIndicator:NO];
    self.scrollCurtainView.delegate = self;
    self.scrollCurtainView.pagingEnabled = YES;
    [self addSubview:_scrollCurtainView];
    
    [self setupButton];
}
- (void)setupButton {
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.dismissButton addTarget:self action:@selector(dismissClick:) forControlEvents:UIControlEventTouchUpInside];
    self.dismissButton.hidden = YES;
    [self addSubview:_dismissButton];
}

- (void)handlerAction:(Block)block {
    self.blockAction = block;
}
- (void)dismissClick:(UIButton*)sender {
    self.blockAction(@"Close Guide Page");
}

// UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double progress = scrollView.contentOffset.x / ([UIScreen mainScreen].bounds.size.width * (PageCount - 1));
    if (progress < 0) progress = 0;
    else if (progress > 1) progress = 1;
    self.dismissButton.hidden = progress >= 1 ? NO : YES;
    
    self.lottieLogo.animationProgress = progress;
}
@end
