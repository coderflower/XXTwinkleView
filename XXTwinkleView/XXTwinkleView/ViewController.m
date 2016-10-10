//
//  ViewController.m
//  XXTwinkleView
//
//  Created by Caiflower on 2016/10/10.
//  Copyright © 2016年 Caiflower. All rights reserved.
//

#import "ViewController.h"
#import "XXTwinkleView.h"
@interface ViewController ()
@property(nonatomic, strong) XXTwinkleView *twinkleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.twinkleView = [[XXTwinkleView alloc]initWithFrame:CGRectMake(120, 200, 40, 40)];
    [self.view addSubview:self.twinkleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)beginAnimation:(id)sender {
    [self.twinkleView startFlashAnimation];
}

- (IBAction)stopAnimation:(id)sender {
    [self.twinkleView stopFlashAnimation];
}

@end
