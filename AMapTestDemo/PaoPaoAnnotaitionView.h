//
//  PaoPaoAnnotaitionView.h
//  AMapTestDemo
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "PaoPaoView.h"
@interface PaoPaoAnnotaitionView : MAPinAnnotationView
@property (nonatomic ,retain)PaoPaoView * callOut;

@property (nonatomic ,retain)NSString * title;


- (void)addPapaViewDidSeletTargetWithBlock:(void(^)(PaoPaoAnnotaitionView *view))block;
@end
