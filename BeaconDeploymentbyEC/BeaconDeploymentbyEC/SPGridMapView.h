//
//  SPGridMapView.h
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import <UIKit/UIKit.h>

@interface SPGridMapView : UIView

@property (nonatomic, retain) NSMutableArray *pointsArray;

- (void)drawOriginalStationPoint;

- (void)movePointFromIndex:(int)index ToDestinationPosition:(SPPosition)destinationPosition;

@end
