//
//  ViewController.m
//  MKMapCameraExample
//
//  Created by Hector Zarate on 1/26/14.
//  Copyright (c) 2014 Hector Zarate. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

const CLLocationCoordinate2D kCoordinateLondon = {51.50722, -0.12750};


const MKCoordinateSpan kSpan = {0.0005, 0.0005};

@interface ViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self.mapView setCenterCoordinate:kCoordinateLondon];
    
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.region = MKCoordinateRegionMake(kCoordinateLondon,
                                            MKCoordinateSpanMake(0.001, 0.001));
    options.mapType = MKMapTypeStandard;
    options.showsBuildings = YES;
    options.showsPointsOfInterest = YES;
    options.scale = [UIScreen mainScreen].scale;
    options.size = self.imageView.frame.size;
    
    MKMapSnapshotter *snapshotter = [[MKMapSnapshotter a lloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        UIImage *image = snapshot.image;
        
        self.imageView.image = image;
    }];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
