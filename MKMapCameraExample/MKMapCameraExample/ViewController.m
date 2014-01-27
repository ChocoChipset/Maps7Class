//
//  ViewController.m
//  MKMapCameraExample
//
//  Created by Hector Zarate on 1/26/14.
//  Copyright (c) 2014 Hector Zarate. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

const CLLocationCoordinate2D kCoordinateParis = {48.8582, 2.2945 };
const MKCoordinateSpan kSpan = {0.0005, 0.0005};

@interface ViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.mapView.showsBuildings = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.mapType = MKMapTypeStandard;
    
    MKMapCamera *newCamera = [MKMapCamera camera];
    newCamera.centerCoordinate = kCoordinateParis;
    newCamera.heading = -60;
    newCamera.altitude = 1000;
    
    newCamera.pitch = 40;
    
    [self.mapView setCamera:newCamera animated:YES];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
