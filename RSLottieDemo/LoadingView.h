//
//  LoadingView.h
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/8/15.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Lottie/Lottie.h>

#define LoadingManager [LoadingView shareManager]

@interface LoadingView : UIView
+ (instancetype)shareManager;
- (void)setupAnimationView;
- (void)dismissLoadingView;
@end
