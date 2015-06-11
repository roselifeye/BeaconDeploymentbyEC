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

- (int)RSSIFadingWithCoordinateXValue:(int)x andYValue:(int)y {
    /**
     *  Caculate the distance from the beacon to destination.
     */
    float distance = sqrtf(pow((x-[self.xValue intValue]), 2) + pow((y-[self.yValue intValue]), 2));
    
    /**
     *  The Original RSSI is -5.
     *  The Fadding is based on the distance.
     *  Every Unit will reduce 25.
     *  So that a single beacon can only influence 4 near coordinates.
     *
     */
    int RSSIFadingValue = -5 - (distance/MapUnit)*25;
    if (RSSIFadingValue < -100) {
        RSSIFadingValue = 0;
    }
    
    return RSSIFadingValue;
}

@end
