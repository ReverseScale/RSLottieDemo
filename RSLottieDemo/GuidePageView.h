//
//  GuidePageView.h
//  RSLottieDemo
//
//  Created by WhatsXie on 2017/7/25.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(NSString *str);

@interface GuidePageView : UIView
@property (nonatomic, copy) Block blockAction;
- (void)handlerAction:(Block)block;
@end
