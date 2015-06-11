//
//  SPGridMapView.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPGridMapView.h"

@implementation SPGridMapView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawGrid];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
