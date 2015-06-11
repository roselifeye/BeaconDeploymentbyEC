//
//  SPBeaconStructure.h
//  
//
//  Created by Roselifeye on 2015-06-10.
//
//

#import <Foundation/Foundation.h>

struct SPPosition {
    int x;
    int y;
};
typedef struct SPPosition SPPosition;

static inline SPPosition
SPPositionMake(int x, int y)
{
    SPPosition position;
    position.x = x;
    position.y = y;
    return position;
}

@interface SPBeaconStructure : NSObject


@property (nonatomic, assign) SPPosition position;

- (instancetype)initWithPosition:(SPPosition)beaconPosition;

@end
