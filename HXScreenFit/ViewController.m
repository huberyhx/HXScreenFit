//
//  ViewController.m
//  HXScreenFit
//
//  Created by haoxu.wang on 2018/10/18.
//  Copyright © 2018年 haoxu.wang. All rights reserved.
//

#import "ViewController.h"
#import "HXScreenFitUtil.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelHeightCons;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *yellowLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    // 调整约束
    CGFloat constant = [[HXScreenFitUtil alloc] init].iphone4(10).iphone5(50).iphone6(100).iphone6p(150).iphoneX(200).iphoneXSMax(250).defaultValue(self.labelHeightCons.constant);
    self.labelHeightCons.constant = constant;
    
    // 调整字号
    CGFloat redLabelFontSize = [[HXScreenFitUtil alloc] init].iphone4(10).iphone5(15).iphone6(25).iphone6p(30).iphoneX(35).iphoneXSMax(40).defaultValue(45);
    self.redLabel.text = [NSString stringWithFormat:@"字号 : %0.f, 高度 : %f",redLabelFontSize,self.labelHeightCons.constant];

    // 调整 frame
    CGFloat yellowLabelHeight = [[HXScreenFitUtil alloc] init].iphone4(10).iphone5(50).iphone6(99).iphone6p(150).iphoneX(200).iphoneXSMax(250).defaultValue(60);
    self.yellowLabel.frame = CGRectMake(50, 350, 260, yellowLabelHeight);
    self.yellowLabel.text = [NSString stringWithFormat:@"我的高度是 : %0.f",yellowLabelHeight];

}

@end
