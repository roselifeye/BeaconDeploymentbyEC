//
//  SPBeaconDataManager.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPBeaconDataManager : NSObject

/**
 *  The Designed Positions for Beacons.
 */
@property (nonatomic, strong) NSMutableArray *beaconPositionArray;

/**
 *  Real used beacons from Designed Positions.
 */
@property (nonatomic, retain) NSMutableArray *beaconArray;

@property (nonatomic, assign) BOOL hasNewBeacon;

/**
 *  Get the New Beacon Array from Designed Positions.
 */
- (void)getNewBeaconArray;

@end
