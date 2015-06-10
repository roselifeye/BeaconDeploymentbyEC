//
//  SPCoordinateStructure.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPCoordinateStructure.h"

@implementation SPCoordinateStructure

- (instancetype)initWithXValue:(int)x andYValue:(int)y {
    if(self) {
        _xValue = [NSNumber numberWithInt:x];
        _yValue = [NSNumber numberWithInt:y];
        _RSSIArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end