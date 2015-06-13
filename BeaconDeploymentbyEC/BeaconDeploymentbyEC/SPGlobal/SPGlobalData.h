//
//  SPGlobalData.h
//  
//
//  Created by Roselifeye on 2015-06-13.
//
//

#import <Foundation/Foundation.h>
#import "SPBeaconDataManager.h"
#import "SPCoordinateDataManager.h"

@interface SPGlobalData : NSObject

+ (SPGlobalData *)shareInstance;

@property (nonatomic, strong) SPBeaconDataManager *beaconData;
@property (nonatomic, strong) SPCoordinateDataManager *coordinateData;

- (void)initBeacon;
- (void)initCoordinateDataWithCount:(int)dataCount;

@end
