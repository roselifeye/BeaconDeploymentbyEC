//
//  ViewController.m
//  BeaconDeploymentbyEC
//
//  Created by Roselifeye on 15/6/9.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "ViewController.h"
#import "SPGridMapView.h"





#import "SPECAlgorithm.h"

@interface ViewController () {
    
    
    SPGridMapView *mapView;
    
    SPECAlgorithm *ecAlgorithm;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"BackgroundImage"];
    self.view.layer.contents = (id) bgImage.CGImage;
    // Do any additional setup after loading the view, typically from a nib.
    ecAlgorithm = [[SPECAlgorithm alloc] init];
    
    [self initGridMapView];
}


- (void)initGridMapView {
    CGRect frame = CGRectMake((CGRectGetWidth(self.view.frame) - MapRows * MapUnit)/2.f, (CGRectGetHeight(self.view.frame) - MapColumns * MapUnit)/2.f, MapRows * MapUnit, MapColumns * MapUnit);
    mapView = [[SPGridMapView alloc] initWithFrame:frame];
    [self.view addSubview:mapView];
}

- (IBAction)startProgram:(UIButton *)startBtn {
    [self resetData:nil];
    for (int i = 0; i < BeaconCount; i++) {
        SPBeaconStructure *beacon = [[SPGlobalData shareInstance].beaconData.beaconArray objectAtIndex:i];
        [mapView movePointFromIndex:i ToDestinationPosition:beacon.position];
    }
    //[ecAlgorithm divideRSSIArraysIntoGroups:coordinateData.coordinateArray];
    [ecAlgorithm divideBeaconsArrayIntoGroups];
}

- (IBAction)resetData:(UIButton *)resetBtn {
    [[SPGlobalData shareInstance] initBeacon];
    [[SPGlobalData shareInstance] initCoordinateDataWithCount:CoordinateCount];
    [mapView drawOriginalStationPoint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
