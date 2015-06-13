//
//  SPBeaconStructure+Additions.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPBeaconStructure+Additions.h"
#import <math.h>

@implementation SPBeaconStructure (Additions)

- (int)RSSIFadingWithCoordinateXValue:(int)x andYValue:(int)y  andCoordinateIndex:(int)index {
    /**
     *  Caculate the distance from the beacon to destination.
     */
    float distance = sqrtf(pow((x-self.position.x), 2) + pow((y-self.position.y), 2));
    
    /**
     *  The Original RSSI is -5.
     *  The Fadding is based on the distance.
     *  Every Unit will reduce 35.
     *  So that a single beacon can only influence 2 near coordinates.
     *
     */
    int RSSIFadingValue = -5 - (distance/MapUnit)*35;
    if (RSSIFadingValue < -100) {
        RSSIFadingValue = 0;
    } else {
        [self.coordinateInRangeArray addObject:[NSNumber numberWithInt:index]];
    }
    
    return RSSIFadingValue;
}

@end
