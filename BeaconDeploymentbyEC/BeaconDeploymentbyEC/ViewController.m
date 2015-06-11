//
//  ViewController.m
//  BeaconDeploymentbyEC
//
//  Created by Roselifeye on 15/6/9.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "ViewController.h"

#import "SPBeaconStructure.h"
#import "SPBeaconStructure+Additions.h"

#import "SPBeaconDataManager.h"
#import "SPCoordinateDataManager.h"

@interface ViewController () {
    SPBeaconDataManager *beaconData;
    SPCoordinateDataManager *coordinateData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initBeacon];
    [self initCoordinateDataWithCount:CoordinateCount];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
