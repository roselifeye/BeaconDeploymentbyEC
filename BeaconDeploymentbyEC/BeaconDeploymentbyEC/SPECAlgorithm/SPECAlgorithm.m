//
//  SPECAlgorithm.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPECAlgorithm.h"
#import "SPCoordinateDataManager.h"

@interface SPECAlgorithm () {
    NSMutableArray *groupsArray;
    NSMutableArray *beaconsArray;
}

@end

@implementation SPECAlgorithm

- (id)init {
    if (self) {
        groupsArray = [[NSMutableArray alloc] init];
        beaconsArray = [[NSMutableArray alloc] init];
    }
    
    return  self;
}

- (void)divideRSSIArraysIntoGroups:(NSMutableArray *)arrays {
    NSRange arrayRange = NSMakeRange(0, MapRows);
    for (int i = 1; i <= MapColumns; i++) {
        arrayRange.location = (i-1)*MapRows;
        NSArray *groupArray = [arrays subarrayWithRange:arrayRange];
        [groupsArray addObject:groupArray];
    }
}

/**
 *  Divide BeaconsArray into 5 groups.
 *
 */
- (void)divideBeaconsArrayIntoGroups {
    //NSRange arrayRange = NSMakeRange(0, 2);
    for (int i = 1; i <= BeaconCount/2; i++) {
        //arrayRange.location = (i-1)*2;
        [self compareCoordinateIndexOfTwoBeacons:(i-1)*2];
    }
}

- (void)compareCoordinateIndexOfTwoBeacons:(int)startIndex {
    SPBeaconStructure *beacon1 = [[SPGlobalData shareInstance].beaconData.beaconArray objectAtIndex:startIndex];
    SPBeaconStructure *beacon2 = [[SPGlobalData shareInstance].beaconData.beaconArray objectAtIndex:startIndex+1];
    NSArray *indexArray1 = beacon1.coordinateInRangeArray;
    NSArray *indexArray2 = beacon2.coordinateInRangeArray;
    
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"(SELF in %@)", indexArray2];
    NSArray *filterArray = [indexArray1 filteredArrayUsingPredicate:thePredicate];
}

- (void)compareTwoRSSIofCoordinatesByIndex:(int)index {
    
}

@end
