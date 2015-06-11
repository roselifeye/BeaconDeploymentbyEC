//
//  SPCoordinateStructure.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPCoordinateStructure : NSObject

@property (nonatomic, assign) SPPosition position;
/**
 *  Store the RSSI Values for every coordinate.
 *  RSSI Array Have 10 designed Beacon RSSI Values.
 */
@property (nonatomic, strong) NSMutableArray *RSSIArray;

- (instancetype)initWithXValue:(int)x andYValue:(int)y;

@end
