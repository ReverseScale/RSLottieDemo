# RSLottieDemo
Airbnb 最近开源了一个名叫 Lottie 的动画库，献出 Demo。

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-4.1MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

Airbnb 最近开源了一个名叫 Lottie 的动画库,它能够同时支持 iOS ,Android 与 ReactNative 的开发

| 名称 |1.列表页 |2.本地数据展示页 |3.线上数据展示页 |4.载入动画页
| ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/31290590.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/31290590.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/34650330.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-16/4999533.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 加载本地数据显示效果 | 加载网络数据显示效果 | 加载本地数据载入动画效果 |


## Advantage 框架的优势
* 1.文件少，代码简洁，使用简单
* 2.跨平台性，同时支持 iOS ,Android 与 ReactNative
* 3.同时支持本地数据和网络数据
* 4.具备较高自定义性

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
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
### 拓展方法
对于一些带有动态效果的引导页产品需求，使用 Lottie 刚刚好，这里只提供我自己写的代码部分思想，图片素材由于不确定版权性就不放了。
类似效果，如图：
![](http://og1yl0w9z.bkt.clouddn.com/17-8-1/8008591.jpg)

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSLottieDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
