//
//  SPBeaconStructure.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPBeaconStructure.h"

@implementation SPBeaconStructure

- (instancetype)initWithPosition:(SPPosition)beaconPosition {
    if(self) {
        _position = beaconPosition;
        _coordinateInRangeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
