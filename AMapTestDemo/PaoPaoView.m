//
//  PaoPaoView.m
//  CityGuide
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "PaoPaoView.h"
#import "Masonry.h"
@interface PaoPaoView()
@property (nonatomic ,retain)UIButton * button;

@end
@implementation PaoPaoView

static char paopaoSeletKey;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

        
        __block typeof (self)WeakSelf = self;
        self.userInteractionEnabled = YES;
        
        UIView * bacview = [UIView new];
        bacview.userInteractionEnabled = YES;
        bacview.backgroundColor = [UIColor redColor];
        [self addSubview:bacview];
        
        [bacview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(WeakSelf.mas_top);
            make.left.mas_equalTo(WeakSelf.mas_left);
            make.right.mas_equalTo(WeakSelf.mas_right);
            make.bottom.mas_equalTo(WeakSelf.mas_bottom).offset(-15);
        }];
        
        UIView * sanjiao = [UIView new];
        sanjiao.userInteractionEnabled = YES;
        sanjiao.backgroundColor = [UIColor redColor];
        [self addSubview:sanjiao];
        
        [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bacview.mas_bottom).offset(-10);
            make.centerX.mas_equalTo(bacview.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        CGAffineTransform at =CGAffineTransformMakeRotation(M_PI/4);
        [sanjiao setTransform:at];
        
        
        _paoTitleLabel = [UILabel new];
        _paoTitleLabel.textColor = [UIColor whiteColor];
        _paoTitleLabel.userInteractionEnabled = YES;
        _paoTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_paoTitleLabel];
        
        [_paoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bacview.mas_top);
            make.left.mas_equalTo(bacview.mas_left);
            make.right.mas_equalTo(bacview.mas_right);
            make.bottom.mas_equalTo(bacview.mas_bottom);
        }];
        
        
   self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = self.frame;
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
               [self addSubview:self.button];
    }
    return self;
}
- (void)setTitle:(NSString *)title
{
    self.paoTitleLabel.text = title;
    
}
-(NSString *)title
{
    return self.paoTitleLabel.text;
}
-(void)addPapaViewDidSeletTargetWithBlock:(void (^)(PaoPaoView *))block
{
    [self.button removeTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject(self.button, &paopaoSeletKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
   [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(paopaoViewDidSeletView:)]) {
        [self.delegate paopaoViewDidSeletView:self];
    }
    if ([self respondsToSelector:@selector(addPapaViewDidSeletTargetWithBlock:)]) {
        typedef void (^SeletBlock)();
        
        SeletBlock block  = objc_getAssociatedObject(sender, &paopaoSeletKey);
        if (block) {
            block(self);
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
