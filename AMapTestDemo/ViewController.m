//
//  ViewController.m
//  AMapTestDemo
//
//  Created by 徐继垚 on 15/8/12.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "ViewController.h"
#import "PaoPaoAnnotaitionView.h"
#import "PaoPaoPushViewController.h"

@interface ViewController ()<PaopaoViewDelegate>
{
    CLLocationCoordinate2D coords[5];
}
@property (nonatomic ,retain)NSArray * titlearray;

@end

@implementation ViewController
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(mapzoomLevel:) name:@"mapzoomLevel" object:nil];
    
    _titlearray = [NSArray arrayWithObjects:@"第一个",@"第二个",@"第三个",@"第四个",@"第五个", nil];
    
    coords[0].latitude = 39.965;
    coords[0].longitude = 116.404;
    coords[1].latitude = 39.925;
    coords[1].longitude = 116.454;
    coords[2].latitude = 39.955;
    coords[2].longitude = 116.494;
    coords[3].latitude = 39.905;
    coords[3].longitude = 116.654;
    coords[4].latitude = 39.965;
    coords[4].longitude = 116.704;

    
    
    
    _mapView = [[MAMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    for (int i = 0; i < 5; i ++) {
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = coords[i];
        pointAnnotation.title = _titlearray[i];
        
        [_mapView addAnnotation:pointAnnotation];
    }

    MAPolyline * line = [MAPolyline polylineWithCoordinates:coords count:5];
    [_mapView addOverlay:line];

    
}
- (void)mapzoomLevel:(NSNotification *)result
{
    _mapView.zoomLevel = 10.f;
}
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{

   
    MACoordinateRegion region =   MACoordinateRegionMake(view.annotation.coordinate, MACoordinateSpanMake(0.01,0.01));
    
      [_mapView setRegion:region animated:YES];
}



- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineView *polylineView = [[MAPolylineView alloc] initWithPolyline:overlay];
        
        polylineView.lineWidth = 5.f;
        polylineView.strokeColor = [UIColor redColor];
        
        return polylineView;
    }
    return nil;
}
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        PaoPaoAnnotaitionView *annotationView = (PaoPaoAnnotaitionView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[PaoPaoAnnotaitionView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.title = annotation.title;
        
 
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
   
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        [annotationView addPapaViewDidSeletTargetWithBlock:^(PaoPaoAnnotaitionView *view) {
            NSLog(@"12312");
        }];
   
        return annotationView;
    }
    return nil;
}
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
@implementation MAPointAnnotation (tag)

- (void)setTag:(NSInteger)tag
{
    
    self.tag = tag;
    
}
-(NSInteger)tag
{
    return self.tag;
}
@end