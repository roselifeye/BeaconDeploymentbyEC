//
//  SPGridMapView.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPGridMapView.h"
#import <JHChainableAnimations.h>

@interface SPGridMapView () {
    
}

@end

@implementation SPGridMapView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawGrid];
        [self drawOriginalStationPoint];
    }
    return self;
}

/**
 *  These four functions draw the Map Grid.
 */
- (void)drawGrid{
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    [self drawGridFrame];
    [self drawGridVertical];
    [self drawGridHorizontal];
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [self setBackgroundColor:[UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()]];
    UIGraphicsEndImageContext();
}

- (void)drawGridFrame {
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 0);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), MapRows * MapUnit, 0);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), MapRows * MapUnit, MapColumns * MapUnit);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 0, MapColumns * MapUnit);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 0, 0);
}

- (void)drawGridVertical {
    for (int i = 0; i < MapRows; i++) {
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), i * MapUnit, 0);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i * MapUnit, MapColumns * MapUnit);
    }
}

- (void)drawGridHorizontal {
    for (int i = 0; i < MapColumns; i++) {
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, i * MapUnit);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), MapRows * MapUnit, i * MapUnit);
    }
}

/**
 *  Init the Bluetooth Station as a point
 */
- (void)drawOriginalStationPoint {
    for (UIImageView *subviews in [self subviews]) {
        if (1000 == subviews.tag) {
            [subviews removeFromSuperview];
        }
    }
    _pointsArray = [[NSMutableArray alloc] initWithCapacity:BeaconCount];
    for (int i = 0; i < BeaconCount; i++) {
        UIImageView *pointView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        pointView.tag = 1000;
        [pointView setCenter:CGPointMake(0, 0)];
        [pointView setBackgroundColor:[UIColor redColor]];
        [_pointsArray addObject:pointView];
        [self addSubview:pointView];
    }
}

- (void)movePointFromIndex:(int)index ToDestinationPosition:(SPPosition)destinationPosition {
    UIImageView *fromPoint = [_pointsArray objectAtIndex:index];
    fromPoint.moveXY(destinationPosition.x, destinationPosition.y).rotate(360*index).animate(1.0);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
