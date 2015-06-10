//
//  SPCoordinateStructure.m
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import "SPCoordinateDataManager.h"
#import "SPCoordinateStructure.h"

@implementation SPCoordinateDataManager

- (instancetype)init {
    if (self) {
        /**
         *  The Capacity in the System is 200;
         */
        _coordinateArray = [[NSMutableArray alloc] initWithCapacity:200];
    }
    return self;
}

- (void)createNewCoordinateWithXValue:(int)x andYValue:(int)y andRSSIArray:(NSMutableArray *)RSSIArray {
    SPCoordinateStructure *newCoordinate = [[SPCoordinateStructure alloc] initWithXValue:x andYValue:y];
    newCoordinate.RSSIArray = RSSIArray;
    [_coordinateArray addObject:newCoordinate];
}

- (void)setCoordinateValueWithXValue:(int)x andYValue:(int)y atIndex:(int)index {
    SPCoordinateStructure *updateCoordinate = [[SPCoordinateStructure alloc] initWithXValue:x andYValue:y];
    [_coordinateArray replaceObjectAtIndex:index withObject:updateCoordinate];
}

- (void)setRSSIValueWithRSSIArray:(NSMutableArray *)RSSIAray atIndex:(int)index {
    SPCoordinateStructure *updateCoordinate = [_coordinateArray objectAtIndex:index];
    updateCoordinate.RSSIArray = RSSIAray;
    [_coordinateArray replaceObjectAtIndex:index withObject:updateCoordinate];
}

- (void)deleteCoordinateValueWithIndex:(int)index {
}

@end