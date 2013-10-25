//
//  WXCAViewController.m
//  weixinCardAnimation
//
//  Created by SunKe on 13-10-25.
//  Copyright (c) 2013年 Coneboy_K. All rights reserved.
//  Welcome to my blog  http://www.coneboy.com
//

#import "WXCAViewController.h"

@interface WXCAViewController ()

@end

@implementation WXCAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    // 会员卡的view
    testView  = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 280, 185)];
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 185)];
    imgView.image = [UIImage imageNamed:@"vip.png"];
    [testView addSubview:imgView];
    [self.view addSubview:testView];
    
    // 会员卡的那层模板
    bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 135, 300, 200)];
    bgView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:bgView];

    // 放大按钮
    UIButton *btnBig = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [btnBig setFrame: CGRectMake(50, 400, 46, 44)];
    btnBig.backgroundColor = [UIColor redColor];
    btnBig.titleLabel.backgroundColor = [UIColor blackColor];
    [btnBig addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchDown];
    btnBig.tag = 100;
    
    // 复位按钮
    UIButton *btnSmall = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnSmall setFrame: CGRectMake(200, 400, 46, 44)];
    btnSmall.backgroundColor = [UIColor redColor];
    [btnSmall addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchDown];
    btnSmall.tag = 101;

    [self.view addSubview:btnBig];
    [self.view addSubview:btnSmall];

    
}


- (void)btnPress:(id)sender
{
    UIButton *a = (UIButton *)sender;
    
    if (a.tag ==100) {
        [self goAnimation];
    }else{
        [self.view bringSubviewToFront:bgView];

    }
    
    
}

- (void) goAnimation
{
    
    /**
     *  1.先移动视图到x-60 y-100 同时做旋转操作
     *
     *  2.在移动视图时放大1.1倍
     *
     *  3.移动完成时调用返回并缩小视图方法 （next）
     *
     *
     */
    
    
    [UIView beginAnimations:@"1" context:NULL];
    [UIView setAnimationDuration:0.8f];
    // 设置最终视图路径
    testView.frame = CGRectMake(testView.frame.origin.x-30, testView.frame.origin.y - 200, testView.frame.size.width, testView.frame.size.height);
    // 设置最终视图旋转
    testView.transform = CGAffineTransformMakeRotation(- (10.0f * M_PI) / 180.0f);
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(next)];  //执行完调用返回缩小函数
    [UIView commitAnimations];
    
    // 设置最终视图放大倍数
    CGAffineTransform transform = testView.transform;
    transform = CGAffineTransformScale(transform, 1.2 ,1.2);
    testView.transform = transform;
    

}


-(void)next{
    
    [self.view bringSubviewToFront:testView];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8f];
    
    testView.transform = CGAffineTransformMakeRotation((0.0f) / 180.0f);
    testView.frame = CGRectMake(20, 40, 280, 185);
    
    [UIView setAnimationDelegate:self];
    // 如果不需要执行的弹跳可不执行
    [UIView setAnimationDidStopSelector: @selector(bounceAnimationStopped)];
    
    [UIView commitAnimations];
  
}

#pragma -
#pragma mark  阻尼弹跳

- (void)bounceAnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y - 20, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(bounce2AnimationStopped)];
    
    [UIView commitAnimations];
    
    
    
}
- (void)bounce2AnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y + 20, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(bounce3AnimationStopped)];
    
    [UIView commitAnimations];
    
}



- (void)bounce3AnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y - 10, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(bounce4AnimationStopped)];
    
    [UIView commitAnimations];
    
    
    
}
- (void)bounce4AnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y + 10, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(bounce5AnimationStopped)];
    [UIView commitAnimations];
    
}


- (void)bounce5AnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y - 5, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(bounce6AnimationStopped)];
    
    [UIView commitAnimations];
    
    
    
}
- (void)bounce6AnimationStopped {
    
    [UIView beginAnimations:@"3" context:NULL];
    [UIView setAnimationDuration:0.1f];
    
    testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y + 5, testView.frame.size.width, testView.frame.size.height);
    [UIView setAnimationDelegate:self];
    
    [UIView commitAnimations];
    
}











- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
