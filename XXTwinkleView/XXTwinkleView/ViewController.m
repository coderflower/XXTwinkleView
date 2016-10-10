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
@interface ViewController ()
@property(nonatomic, strong) XXTwinkleView *twinkleView;
@property(nonatomic, strong) XXFlashView *flashView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.twinkleView = [[XXTwinkleView alloc]initWithColor:[UIColor redColor]];
    self.twinkleView.frame = CGRectMake(120, 200, 40, 40);
    [self.view addSubview:self.twinkleView];
    
    self.flashView = [[XXFlashView alloc]initWithFrame:CGRectMake(120, 300, 40, 40)];
    [self.view addSubview:self.flashView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)beginAnimation:(id)sender {
    [self.twinkleView startFlashAnimation];
    
    [self.flashView startFlashAnimation];
}

- (IBAction)stopAnimation:(id)sender {
    [self.twinkleView stopFlashAnimation];
    [self.flashView stopFlashAnimation];
}

@end
