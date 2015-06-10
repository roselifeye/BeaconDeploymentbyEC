//
//  SPBeaconDataManager.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPBeaconDataManager.h"
#import "SPBeaconStructure.h"
#import "SPPlistManager.h"

@implementation SPBeaconDataManager

- (instancetype)init {
    if (self) {
        /**
         *  The Capacity in the System is 50;
         */
        _beaconArray = [[NSMutableArray alloc] initWithCapacity:50];
        [self initBeaconData];
    }
    return self;
}

- (void)initBeaconData {
    NSMutableArray *beaconData = [SPPlistManager GetBeaconData];
    for (NSDictionary *beacon in beaconData) {
        SPBeaconStructure *newBeacon = [[SPBeaconStructure alloc] initWithXValue:[beacon objectForKey:@"x"] andYValue:[beacon objectForKey:@"y"]];
        [_beaconArray addObject:newBeacon];
    }
}

- (void)createNewBeaconWithXValue:(NSNumber *)x andYValue:(NSNumber *)y {
    SPBeaconStructure *newBeacon = [[SPBeaconStructure alloc] initWithXValue:x andYValue:y];
    [_beaconArray addObject:newBeacon];
}

@end
