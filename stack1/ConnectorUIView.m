//
//  ConnectorUIView.m
//  stack1
//
//  Created by Zsolt Normann on 3/21/13.
//  Copyright (c) 2013 Eggcitingapp.com. All rights reserved.
//

#import "ConnectorUIView.h"

@implementation ConnectorUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		p1 = CGPointZero;
		p2 = CGPointZero;
    }
    return self;
}

-(void) setConnectionPoints:(CGPoint) lp1 p2:(CGPoint) lp2 {
	p1 = lp1;
	p2 = lp2;
}


- (void)drawRect:(CGRect)rect {
	if ((!CGPointEqualToPoint(p1,CGPointZero)) && (!CGPointEqualToPoint(p2,CGPointZero))) {
		CGContextRef c = UIGraphicsGetCurrentContext();	
		CGFloat x_linemid = p1.x+(p2.x-p1.x)/2;
		
		CGContextClearRect(c,self.frame);
		CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
		CGContextSetStrokeColor(c, red);
		CGContextSetBlendMode(c, kCGBlendModeNormal);
		CGContextBeginPath(c);
		CGContextMoveToPoint(c, p1.x, p1.y);
		CGContextAddLineToPoint(c, x_linemid, p1.y);
		CGContextMoveToPoint(c, x_linemid, p1.y);
		CGContextAddLineToPoint(c, x_linemid, p2.y);
		CGContextMoveToPoint(c, x_linemid, p2.y);
		CGContextAddLineToPoint(c, p2.x, p2.y);
		CGContextStrokePath(c);		
	}
}
@end
