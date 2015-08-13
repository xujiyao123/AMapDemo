//
//  ViewController.h
//  AMapTestDemo
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
@interface ViewController : UIViewController<MAMapViewDelegate>
{
    MAMapView * _mapView;
}

@end

@interface MAPointAnnotation (tag)

@property (nonatomic ,assign)NSInteger tag;

@end