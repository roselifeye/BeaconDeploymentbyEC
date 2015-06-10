//
//  ViewController.m
//  BeaconDeploymentbyEC
//
//  Created by Roselifeye on 15/6/9.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "ViewController.h"

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
    [self initCoordinateDataWithCount:200];
}

- (void)initBeacon {
    beaconData = [[SPBeaconDataManager alloc] init];
}

- (void)initCoordinateDataWithCount:(int)dataCount {
    coordinateData = [[SPCoordinateDataManager alloc] init];
    for (int i = 0; i < dataCount; i ++) {
        int column = i/20;
        int x = 25 + (50 * (i - column*20));
        int y = 25 + (50 * column);
        [coordinateData createNewCoordinateWithXValue:x andYValue:y andRSSIArray:nil];
    }
}

- (NSMutableArray *)caculateRSSIValuesForCoordinateWithOrder:(int)order {
    NSMutableArray *RSSIValues = [[NSMutableArray alloc] init];
    
    
    return RSSIValues;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
