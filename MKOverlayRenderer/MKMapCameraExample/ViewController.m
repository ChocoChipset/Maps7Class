//
//  ViewController.m
//  MKMapCameraExample
//
//  Created by Hector Zarate on 1/26/14.
//  Copyright (c) 2014 Hector Zarate. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

const CLLocationCoordinate2D kCoordinateLondon = {37.7749300, -122.4194200};


const MKCoordinateSpan kSpan = {100, 100};

@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKPolygonRenderer *polygonRenderer;
@property (nonatomic) CGFloat animationValue;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self.mapView setRegion:MKCoordinateRegionMake(kCoordinateLondon,
                                                   kSpan)
                   animated:YES];
    
    CLLocationCoordinate2D worldCoords[4] = { {43,-100}, {43,-80}, {25,-80}, {25,-100} };
    MKPolygon *worldOverlay = [MKPolygon polygonWithCoordinates:worldCoords
                                                          count:4];
    
    [self.mapView addOverlay:worldOverlay level:MKOverlayLevelAboveRoads];
    
    
    self.animationValue = 0.45;
    
     NSTimer *timer = [NSTimer timerWithTimeInterval:0.01
                            target:self
                          selector:@selector(animation)
                          userInfo:Nil
                           repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer
                              forMode:NSDefaultRunLoopMode];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)animation
     {
         self.animationValue += 0.01;
         
         self.polygonRenderer.fillColor = [UIColor colorWithWhite:1.0
                                                            alpha:(sin(self.animationValue)+1)/2];
         
     }
     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    self.polygonRenderer = [[MKPolygonRenderer alloc] initWithOverlay:overlay];

	self.polygonRenderer.fillColor = [UIColor colorWithWhite:1.0
                                                  alpha:0.4];
    

    
    return self.polygonRenderer;
}

@end
