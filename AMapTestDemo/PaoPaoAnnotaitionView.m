//
//  PaoPaoAnnotaitionView.m
//  AMapTestDemo
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "PaoPaoAnnotaitionView.h"
@interface PaoPaoAnnotaitionView()
@property (nonatomic ,retain)UIButton * button;
@end
@implementation PaoPaoAnnotaitionView

static char paoSeletKey;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.callOut = [[PaoPaoView alloc] initWithFrame:CGRectMake(0, 0, 120  , 50)];
        self.callOut.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                          -CGRectGetHeight(self.callOut.bounds) / 2.f + self.calloutOffset.y);
    
    
    self.callOut.title = @"我是自定义的";
    [self addSubview:self.callOut];
        
        UIButton * button = [[UIButton alloc]initWithFrame:self.callOut.frame];
        [button addTarget:self action:@selector(abuttonAction:) forControlEvents:UIControlEventTouchUpInside];
        self.button = button;
        [self addSubview:self.button];
        self.button.hidden = YES;
   
        self.callOut.hidden = YES;

    }
    return self;
}
- (void)addPapaViewDidSeletTargetWithBlock:(void (^)(PaoPaoAnnotaitionView *))block
{
    [self.button removeTarget:self action:@selector(abuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject(self.button, &paoSeletKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self.button addTarget:self action:@selector(abuttonAction:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)abuttonAction:(UIButton *)sender
{

    if ([self respondsToSelector:@selector(addPapaViewDidSeletTargetWithBlock:)]) {
        typedef void (^SeletBlock)();
        
        SeletBlock block  = objc_getAssociatedObject(sender, &paoSeletKey);
        if (block) {
            block(self);
        }
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
       
             return;
    }
    
    if (selected)
    {

        self.callOut.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                 -CGRectGetHeight(self.callOut.bounds) / 2.f + self.calloutOffset.y);

        self.callOut.hidden = NO;
        self.button.hidden = NO;
    }
    else
    {
    //    self.callOut.hidden = YES;
       // [self.callOut removeFromSuperview];
   //   [[NSNotificationCenter defaultCenter]postNotificationName:@"mapzoomLevel" object:nil];

    }
    
    [super setSelected:selected animated:animated];
}

- (void)setTitle:(NSString *)title
{
    self.callOut.title = title;
}
-(NSString *)title
{
    return self.callOut.title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
