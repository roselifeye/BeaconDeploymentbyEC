//
//  SPBeaconStructure.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPBeaconStructure.h"

@implementation SPBeaconStructure

- (instancetype)initWithXValue:(NSNumber *)x andYValue:(NSNumber *)y {
    if(self) {
        _xValue = x;
        _yValue = y;
    }
    return self;
}

@end
