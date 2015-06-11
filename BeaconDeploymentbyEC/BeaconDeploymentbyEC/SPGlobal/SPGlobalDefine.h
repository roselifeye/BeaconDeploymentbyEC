//
//  SPGlobalDefine.h
//  BeaconDeploymentbyEC
//
//  Created by Roselifeye on 2015-06-10.
//  Copyright (c) 2015 Roselifeye. All rights reserved.
//

#ifndef BeaconDeploymentbyEC_SPGlobalDefine_h
#define BeaconDeploymentbyEC_SPGlobalDefine_h


#define IS_SIMULATOR    (!(NSNotFound == [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location))

#define IS_IOS_7    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS_8    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/**
 *  The unit of Map
 */
#define MapUnit 50
/**
 *  Size of Map
 */
#define MapRows 20
#define MapColumns 10
/**
 *  Number of Beacons
 */
#define BeaconCount 10
#define BeaconPreCount 50
/**
 *  Number of Coordinate
 */
#define CoordinateCount MapRows * MapColumns


#endif
