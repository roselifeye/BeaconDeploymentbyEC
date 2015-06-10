//
//  SPBeaconDataManager.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPBeaconDataManager : NSObject

@property (nonatomic, strong) NSMutableArray *beaconArray;

- (void)createNewBeaconWithXValue:(NSNumber *)x andYValue:(NSNumber *)y;

@end
