//
//  SPCoordinateStructure.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPCoordinateDataManager : NSObject

/**
 *  Store the x coordinate and y coordinate.
 *  Every (x, y) position size is 50*50.
 */
@property (nonatomic, strong) NSMutableArray *coordinateArray;


- (void)createNewCoordinateWithXValue:(int)x andYValue:(int)y andRSSIArray:(NSMutableArray *)RSSIArray;

- (void)setCoordinateValueWithXValue:(int)x andYValue:(int)y atIndex:(int)index;

- (void)setRSSIValueWithRSSIArray:(NSMutableArray *)RSSIAray atIndex:(int)index;

- (void)deleteCoordinateValueWithIndex:(int)index;

@end
