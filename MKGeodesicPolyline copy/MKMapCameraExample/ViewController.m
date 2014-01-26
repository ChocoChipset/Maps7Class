//
//  ViewController.m
//  MKMapCameraExample
//
//  Created by Hector Zarate on 1/26/14.
//  Copyright (c) 2014 Hector Zarate. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

const CLLocationCoordinate2D kCoordinateMexicoCity = {19.4284700, -99.1276600 };
const CLLocationCoordinate2D kCoordinateWarsaw = {52.2297700, 21.0117800};


const MKCoordinateSpan kSpan = {0.0005, 0.0005};

@interface ViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    CLLocationCoordinate2D geoPath[] = {kCoordinateMexicoCity, kCoordinateWarsaw };
    
    MKGeodesicPolyline *geodesic;
    
    geodesic = [MKGeodesicPolyline polylineWithCoordinates:geoPath
                                                     count:2];
    [self.mapView addOverlay:geodesic];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor orangeColor];
    renderer.lineWidth = 6.0;
    return renderer;
}

@end
