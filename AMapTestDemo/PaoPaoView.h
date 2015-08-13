//
//  PaoPaoView.h
//  CityGuide
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@protocol PaopaoViewDelegate;

@interface PaoPaoView : UIControl

@property (nonatomic ,strong)UILabel * paoTitleLabel;
@property (nonatomic ,assign)id <PaopaoViewDelegate> delegate;

@property (nonatomic ,strong)NSString * title;

- (void)addPapaViewDidSeletTargetWithBlock:(void(^)(PaoPaoView *paopaoView))block;
@end


@protocol PaopaoViewDelegate <NSObject>

@optional
- (void)paopaoViewDidSeletView:(PaoPaoView *)paopaoView;

@end

