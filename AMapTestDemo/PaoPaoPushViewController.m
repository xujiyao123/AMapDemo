//
//  PaoPaoPushViewController.m
//  AMapTestDemo
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "PaoPaoPushViewController.h"

@interface PaoPaoPushViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;

@end

@implementation PaoPaoPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.contentlabel.text = _atext;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
