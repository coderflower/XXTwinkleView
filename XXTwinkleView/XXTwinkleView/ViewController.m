//
//  ViewController.m
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "ViewController.h"
#import "XXTwinkleView.h"
#import "XXFlashView.h"
#import "XXMarkTwinkleView.h"
@interface ViewController ()
@property(nonatomic, strong) XXTwinkleView *twinkleView;
@property(nonatomic, strong) XXMarkTwinkleView *markView;
@property(nonatomic, strong) XXFlashView *flashView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(120, 360, 100, 30)];
//    blueView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:blueView];
    
    self.twinkleView = [[XXTwinkleView alloc]initWithColor:[UIColor redColor] edgeColor:[UIColor whiteColor] circleWidth:8 edgeWidth:2];
    [self.twinkleView setTitle:@"波波头" titleType:kTitleRight];
    self.twinkleView.frame = CGRectMake(120, 360, 0, 30);
    [self.view addSubview:self.twinkleView];
    
    XXTwinkleView *tmp =  [[XXTwinkleView alloc]initWithColor:[UIColor redColor] edgeColor:[UIColor whiteColor] circleWidth:8 edgeWidth:2];
    [tmp setTitle:@"梨花烫" titleType:kTitleLeft];
    tmp.frame = CGRectMake(120, 360, 0, 30);
    [self.view addSubview:tmp];
    
    self.markView = [XXMarkTwinkleView markViewWithTitle:@"韩式波波头" showInRight: YES];
    self.markView.frame = CGRectMake(230, 320, 0, 30);
    self.markView.textColor = [UIColor redColor];
    [self.view addSubview:self.markView];
    
   XXMarkTwinkleView * view = [XXMarkTwinkleView markViewWithTitle:@"梨花烫" showInRight: NO];
    view.frame = CGRectMake(120, 260, 0, 30);
    [self.view addSubview:view];
    
    self.flashView = [[XXFlashView alloc]initWithFrame:CGRectMake(120, 400, 40, 40)];
    [self.view addSubview:self.flashView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)beginAnimation:(id)sender {
    [self.markView startAnimation];
    
    [self.flashView startFlashAnimation];
}

- (IBAction)stopAnimation:(id)sender {
    [self.markView stopAnimation];
    [self.flashView stopFlashAnimation];
}

@end
