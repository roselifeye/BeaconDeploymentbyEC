//
//  SPBeaconStructure.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

@interface SPBeaconStructure : NSObject

@property (nonatomic, retain) NSNumber *xValue;
@property (nonatomic, retain) NSNumber *yValue;

- (instancetype)initWithXValue:(NSNumber *)x andYValue:(NSNumber *)y;

@end
