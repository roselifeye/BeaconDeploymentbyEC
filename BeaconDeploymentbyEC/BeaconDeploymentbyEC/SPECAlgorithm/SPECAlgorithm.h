//
//  SPECAlgorithm.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPECAlgorithm : NSObject

/**
 *  Divide CoordinateArray into MapColumns arrays
 *
 *  @param arrays CoordinateAray
 */
- (void)divideRSSIArraysIntoGroups:(NSMutableArray *)arrays;

- (void)divideBeaconsArrayIntoGroups;

@end
