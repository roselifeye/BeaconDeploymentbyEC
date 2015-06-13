//
//  SPCoordinateStructure.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPCoordinateDataManager.h"

@implementation SPCoordinateDataManager

- (instancetype)init {
    if (self) {
        /**
         *  The Capacity in the System is 200;
         */
        _coordinateArray = [[NSMutableArray alloc] initWithCapacity:CoordinateCount];
    }
    return self;
}

- (void)createNewCoordinateWithXValue:(int)x andYValue:(int)y andRSSIDictionary:(NSMutableDictionary *)RSSIDic {
    SPCoordinateStructure *newCoordinate = [[SPCoordinateStructure alloc] initWithXValue:x andYValue:y];
    newCoordinate.RSSIDic = RSSIDic;
    [_coordinateArray addObject:newCoordinate];
}

- (void)setCoordinateValueWithXValue:(int)x andYValue:(int)y atIndex:(int)index {
    SPCoordinateStructure *updateCoordinate = [[SPCoordinateStructure alloc] initWithXValue:x andYValue:y];
    [_coordinateArray replaceObjectAtIndex:index withObject:updateCoordinate];
}

- (void)setRSSIValueWithRSSIDictionary:(NSMutableDictionary *)RSSIDic atIndex:(int)index {
    SPCoordinateStructure *updateCoordinate = [_coordinateArray objectAtIndex:index];
    updateCoordinate.RSSIDic = RSSIDic;
    [_coordinateArray replaceObjectAtIndex:index withObject:updateCoordinate];
}

- (void)deleteCoordinateValueWithIndex:(int)index {
}

@end
