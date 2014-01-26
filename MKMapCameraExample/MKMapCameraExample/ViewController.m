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
    
    [self.mapView setRegion:MKCoordinateRegionMake(kCoordinateParis,
                                                   kSpan)
                   animated:YES];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
