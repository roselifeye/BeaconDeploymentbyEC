//
//  ViewController.m
//  BeaconDeploymentbyEC
//
//  Created by Roselifeye on 15/6/9.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "ViewController.h"
#import "SPGridMapView.h"

#import "SPBeaconStructure+Additions.h"

#import "SPBeaconDataManager.h"
#import "SPCoordinateDataManager.h"

@interface ViewController () {
    SPBeaconDataManager *beaconData;
    SPCoordinateDataManager *coordinateData;
    
    SPGridMapView *mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"BackgroundImage"];
    self.view.layer.contents = (id) bgImage.CGImage;
    // Do any additional setup after loading the view, typically from a nib.
    [self initBeacon];
    [self initCoordinateDataWithCount:CoordinateCount];
    [self initGridMapView];
}

- (void)initBeacon {
    beaconData = [[SPBeaconDataManager alloc] init];
    [beaconData getNewBeaconArray];
}

- (void)initCoordinateDataWithCount:(int)dataCount {
    coordinateData = [[SPCoordinateDataManager alloc] init];
    for (int i = 0; i < dataCount; i ++) {
        int theColumn = i/MapRows;
        int x = 25 + (BeaconPreCount * (i - theColumn*MapRows));
        int y = 25 + (BeaconPreCount * theColumn);
        [coordinateData createNewCoordinateWithXValue:x
                                            andYValue:y
                                         andRSSIArray:[self caculateRSSIValuesForCoordinateXValue:x andYValue:y]];
    }
}

- (NSMutableArray *)caculateRSSIValuesForCoordinateXValue:(int)x andYValue:(int)y {
    NSMutableArray *RSSIValues = [[NSMutableArray alloc] init];
    for (SPBeaconStructure *beacon in beaconData.beaconArray) {
        int RSSIFadingValue = [beacon RSSIFadingWithCoordinateXValue:x andYValue:y];
        [RSSIValues addObject:[NSNumber numberWithInt:RSSIFadingValue]];
    }
    return RSSIValues;
}

- (void)initGridMapView {
    CGRect frame = CGRectMake((CGRectGetWidth(self.view.frame) - MapRows * MapUnit)/2.f, (CGRectGetHeight(self.view.frame) - MapColumns * MapUnit)/2.f, MapRows * MapUnit, MapColumns * MapUnit);
    mapView = [[SPGridMapView alloc] initWithFrame:frame];
    [self.view addSubview:mapView];
}

- (IBAction)startProgram:(UIButton *)startBtn {
    [self resetData:nil];
    for (int i = 0; i < BeaconCount; i++) {
        SPBeaconStructure *beacon = [beaconData.beaconArray objectAtIndex:i];
        [mapView movePointFromIndex:i ToDestinationPosition:beacon.position];
    }
}

- (IBAction)resetData:(UIButton *)resetBtn {
    [self initBeacon];
    [self initCoordinateDataWithCount:CoordinateCount];
    [mapView drawOriginalStationPoint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
