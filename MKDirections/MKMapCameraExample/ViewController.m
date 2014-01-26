//
//  ViewController.m
//  MKMapCameraExample
//
//  Created by Hector Zarate on 1/26/14.
//  Copyright (c) 2014 Hector Zarate. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

const CLLocationCoordinate2D kCoordinateMexicoCity = {51.7500000, 19.4666700 };


const MKCoordinateSpan kSpan = {0.0005, 0.0005};

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
                       

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:kCoordinateMexicoCity
                                                   addressDictionary:Nil];
    
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:placeMark];
    
    // Create an instance of MKDirectionsRequest
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    // Define the starting point for routing direction
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    // Define the ending point for routing direction
    request.destination = destination;
    
    // Define if your app wants multiple routes
    // when they are available
    
    // Initialize directions object MKDirections
    MKDirections *directions =
    [[MKDirections alloc] initWithRequest:request];
    
    // Finally, calculate the directions
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         MKRoute *route = response.routes[0];
         [self.mapView addOverlay:route.polyline];
         NSLog(@"%@", route.steps);
         
         
     }];
    
    
    
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
