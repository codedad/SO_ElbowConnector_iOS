//
//  ConnectorUIView.h
//  stack1
//
//  Created by Zsolt Normann on 3/21/13.
//  Copyright (c) 2013 Eggcitingapp.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectorUIView : UIView {
	CGPoint p1, p2;
}

-(void) setConnectionPoints:(CGPoint) lp1 p2:(CGPoint) lp2;

@end
