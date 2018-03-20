# RSLottieDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-4.1MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](#Requirements) | [中文](#中文说明)

Airbnb recently opened an animation library called Lottie that can support iOS, Android and ReactNative development at the same time.

## 🎨 Why test the UI?

| 1. List page | 2. Local data display page | 3. Online data display page | 4. Loading animation page |
| ------------- | ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/31290590.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/77790074.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/34650330.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/4999533.jpg) |
| Build the basic framework through storyboard | Load local data display effect | Load network data display effect | Load local data load animation effect |

## 🤖 Requirements

* iOS 9.0+
* Xcode 9.0+
* Objective-C

## 🚀 Getting started

* 1.Less files, simple code, easy to use
* 2.Cross-platform, while supporting iOS, Android and ReactNative
* 3.Supports both local and network data
* 4.Highly customizable

## 🛠 Configuration
### Create a layout
```
LOTAnimationView* animationView = [self createAnimationView];
animationView.contentMode = UIViewContentModeScaleAspectFit;
animationView.loopAnimation = YES;
animationView.frame = CGRectMake(0, 0, 356, 270);
animationView.center = self.view.center;
[self.view addSubview:animationView];
    
[animationView playWithCompletion:^(BOOL animationFinished) {
   NSLog(@"play finished");
}];
```
### Data processing
```
- (LOTAnimationView *)createAnimationView {
    LOTAnimationView* animationView;
    if (self.animationType) {
    /// Loading local JSON data
        animationView = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://github.com/airbnb/lottie-ios/raw/master/Example/Assets/PinJump.json"]]; 
    } else {
    /// Load network JSON data
        animationView = [LOTAnimationView animationNamed:@"vr_animation"];
    }
    return animationView;
}
```
## 📝 Extension method
For some bootable product requirements with dynamic effects, using Lottie is just fine. I only provide the code part of my own thoughts. The picture material is not released due to uncertain copyrightability.
Similar effect, as shown in figure:
![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/8008591.jpg)

## ⚖ License

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬 Contributions

* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

---
# 中文说明

Airbnb 最近开源了一个名叫 Lottie 的动画库,它能够同时支持 iOS ,Android 与 ReactNative 的开发

## 🎨 测试 UI 什么样子？

|1.列表页 |2.本地数据展示页 |3.线上数据展示页 |4.载入动画页 |
| ------------- | ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/31290590.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/77790074.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/34650330.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/4999533.jpg) |
| 通过 storyboard 搭建基本框架 | 加载本地数据显示效果 | 加载网络数据显示效果 | 加载本地数据载入动画效果 |

## 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Objective-C

## 🚀 准备开始
* 1.文件少，代码简洁，使用简单
* 2.跨平台性，同时支持 iOS ,Android 与 ReactNative
* 3.同时支持本地数据和网络数据
* 4.具备较高自定义性


## 🛠 配置
### 第一步 创建布局
```
LOTAnimationView* animationView = [self createAnimationView];
animationView.contentMode = UIViewContentModeScaleAspectFit;
animationView.loopAnimation = YES;
animationView.frame = CGRectMake(0, 0, 356, 270);
animationView.center = self.view.center;
[self.view addSubview:animationView];
    
[animationView playWithCompletion:^(BOOL animationFinished) {
   NSLog(@"播放完毕");
}];
```
### 第二步 处理数据
```
- (LOTAnimationView *)createAnimationView {
    LOTAnimationView* animationView;
    if (self.animationType) {
    /// 加载本地JSON数据
        animationView = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://github.com/airbnb/lottie-ios/raw/master/Example/Assets/PinJump.json"]]; 
    } else {
    /// 加载网络JSON数据
        animationView = [LOTAnimationView animationNamed:@"vr_animation"];
    }
    return animationView;
}
```

## 📝 拓展方法
对于一些带有动态效果的引导页产品需求，使用 Lottie 刚刚好，这里只提供我自己写的代码部分思想，图片素材由于不确定版权性就不放了。
类似效果，如图：
![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/8008591.jpg)

## ⚖ 协议

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
