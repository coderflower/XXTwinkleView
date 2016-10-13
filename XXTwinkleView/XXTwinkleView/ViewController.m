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
    self.twinkleView = [[XXTwinkleView alloc]initWithColor:[UIColor redColor] edgeColor:[UIColor whiteColor] circleWidth:8 edgeWidth:2];
    self.twinkleView.frame = CGRectMake(120, 360, 30, 30);
    [self.view addSubview:self.twinkleView];
    
    self.markView = [XXMarkTwinkleView markViewWithTitle:@"韩式波波头" showInRight: YES];
    self.markView.frame = CGRectMake(130, 200, 0, 30);
    self.markView.edgeColor = [UIColor yellowColor];
    [self.view addSubview:self.markView];
    
   XXMarkTwinkleView * view = [XXMarkTwinkleView markViewWithTitle:@"梨花烫" showInRight: NO];
    view.edgeWidth = 1;
    view.edgeColor = [UIColor whiteColor];
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
    [self.twinkleView startAnimation];
    
    [self.flashView startFlashAnimation];
}

- (IBAction)stopAnimation:(id)sender {
    [self.twinkleView stopAnimation];
    [self.flashView stopFlashAnimation];
}

@end
