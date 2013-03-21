//
//  ViewController.h
//  stack1
//
//  Created by Zsolt Normann on 3/3/13.
//  Copyright (c) 2013 Eggcitingapp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectorUIView.h"


@interface ViewController : UIViewController <UIGestureRecognizerDelegate> {
	int connector_num;
	UIImageView *conn1;
	UIImageView *conn2;
	CGPoint panOrigPos;
	ConnectorUIView *lineview;
}

- (void) addNewConnector:(CGPoint)tappoint;
- (void) drawElbowConnector;

@end
