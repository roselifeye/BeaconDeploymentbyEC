//
//  SPBeaconDataManager.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPBeaconDataManager.h"
#import "SPPlistManager.h"

@interface SPBeaconDataManager () {
    
    int start;
    int end;
    int index;
}

@end

@implementation SPBeaconDataManager

- (instancetype)init {
    if (self) {
        /**
         *  The Capacity in the System is 50;
         */
        _beaconPositionArray = [[NSMutableArray alloc] initWithCapacity:BeaconPreCount];
        _beaconArray = [[NSMutableArray alloc] initWithCapacity:BeaconCount];
        [self setDefault];
        [self initBeaconData];
    }
    return self;
}

- (void)setDefault {
    _hasNewBeacon = NO;
    start = 0;
    end = BeaconPreCount;
    index = 0;
}

- (void)initBeaconData {
    NSMutableArray *beaconData = [SPPlistManager GetBeaconData];
    for (NSDictionary *beacon in beaconData) {
        SPBeaconStructure *newBeacon = [[SPBeaconStructure alloc] initWithPosition:SPPositionMake([[beacon objectForKey:@"x"] intValue], [[beacon objectForKey:@"y"] intValue])];
        [_beaconPositionArray addObject:newBeacon];
    }
}

- (void)getNewBeaconArray {
    if (index == BeaconCount) {
        _hasNewBeacon = YES;
        return;
    }
    /**
     *  If the rest data is smaller than BeaconCount-index,
     *
     *  The function end.
     */
    if(start + (BeaconCount-index) > end ) {
        [self setDefault];
        return;
    }
    [_beaconArray addObject:[_beaconPositionArray objectAtIndex:start]];
    start++;
    index++;
    [self getNewBeaconArray];
}

@end
