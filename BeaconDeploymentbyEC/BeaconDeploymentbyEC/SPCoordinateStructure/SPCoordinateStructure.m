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
        _position = SPPositionMake(x, y);
        //_RSSIArray = [[NSMutableArray alloc] init];
        _RSSIDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
