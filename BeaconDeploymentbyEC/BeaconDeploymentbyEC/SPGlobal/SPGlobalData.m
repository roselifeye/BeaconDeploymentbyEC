//
//  SPGlobalData.m
//  
//
//  Created by Roselifeye on 2015-06-13.
//
//

#import "SPGlobalData.h"

@implementation SPGlobalData

+ (SPGlobalData *)shareInstance {
    static SPGlobalData *golobalData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        golobalData = [[SPGlobalData alloc] init];
    });
    return golobalData;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self initBeacon];
        [self initCoordinateDataWithCount:CoordinateCount];
    }
    
    return self;
}

- (void)initBeacon {
    _beaconData = [[SPBeaconDataManager alloc] init];
    [_beaconData getNewBeaconArray];
}

- (void)initCoordinateDataWithCount:(int)dataCount {
    _coordinateData = [[SPCoordinateDataManager alloc] init];
    for (int i = 0; i < dataCount; i ++) {
        int theColumn = i/MapRows;
        int x = 25 + (BeaconPreCount * (i - theColumn*MapRows));
        int y = 25 + (BeaconPreCount * theColumn);
        [_coordinateData createNewCoordinateWithXValue:x
                                            andYValue:y
                                    andRSSIDictionary:[self caculateRSSIValuesForCoordinateXValue:x andYValue:y andCoordinateIndex:i]];
    }
}

- (NSMutableDictionary *)caculateRSSIValuesForCoordinateXValue:(int)x andYValue:(int)y andCoordinateIndex:(int)index {
    NSMutableDictionary *RSSIDic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < BeaconCount; i++) {
        SPBeaconStructure *beacon = [_beaconData.beaconArray objectAtIndex:i];
        int RSSIFadingValue = [beacon RSSIFadingWithCoordinateXValue:x andYValue:y andCoordinateIndex:index];
        if (0 != RSSIFadingValue) {
            [RSSIDic setValue:[NSNumber numberWithInt:RSSIFadingValue] forKey:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    [RSSIDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"key: %@, value: %@", key, obj);
    }];
    NSEnumerator * enumeratorKey = [RSSIDic keyEnumerator];
    for (NSObject *object in enumeratorKey) {
        NSLog(@"遍历KEY的值: %@",object);
    }
    return RSSIDic;
}


@end
