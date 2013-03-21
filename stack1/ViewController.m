//
//  ViewController.m
//  stack1
//
//  Created by Zsolt Normann on 3/3/13.
//  Copyright (c) 2013 Eggcitingapp.com. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
	tapRecognizer.delegate = self;
	tapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapRecognizer];
	
	connector_num = 0;
	
	lineview = [[ConnectorUIView alloc] initWithFrame:[self.view bounds]];
	[self.view addSubview:lineview];
	
}

- (void) tapDetected: (UITapGestureRecognizer*) sender {
    if([sender state] == UIGestureRecognizerStateEnded) {
		CGPoint point=[sender locationInView:self.view];
		[self addNewConnector:point];
	}
}

- (void) addNewConnector:(CGPoint)tappoint {
	NSLog(@"%d", connector_num);
	if (connector_num==0) {
//		conn1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blank1.png"]];
		conn1 = [[UIImageView alloc] initWithFrame:CGRectMake(tappoint.x-20, tappoint.y-20, 40, 40)];
		conn1.frame = CGRectMake(tappoint.x-20, tappoint.y-20, 40, 40);
		conn1.backgroundColor = [UIColor yellowColor];
		conn1.userInteractionEnabled = YES;
		UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];;
		panRecognizer.delegate = self;
		[conn1 addGestureRecognizer:panRecognizer];
		[self.view addSubview:conn1];
		connector_num=1;
		return;
	}
	if (connector_num==1) {
		conn2 = [[UIImageView alloc] initWithFrame:CGRectMake(tappoint.x-20, tappoint.y-20, 40, 40)];
//		conn2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blank1.png"]];
		conn2.frame = CGRectMake(tappoint.x-20, tappoint.y-20, 40, 40);
		conn2.backgroundColor = [UIColor redColor];
		conn2.userInteractionEnabled = YES;
		UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];;
		panRecognizer.delegate = self;
		[conn2 addGestureRecognizer:panRecognizer];
		[self.view addSubview:conn2];
		connector_num=2;
		[self drawElbowConnector];
	}
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}


- (void) panDetected: (UIPanGestureRecognizer*) sender {
	if([sender state] == UIGestureRecognizerStateBegan) {
		[self.view bringSubviewToFront:sender.view];
		panOrigPos = [sender.view center];
	}
	
	CGPoint translatedPoint = [sender translationInView:self.view];
    [[sender view] setCenter:CGPointMake(panOrigPos.x+translatedPoint.x, panOrigPos.y+translatedPoint.y)];
	[self drawElbowConnector];
}

- (void) drawElbowConnector {
	if ((fabs((conn1.center.x-conn2.center.x)) > 40) || (fabs((conn1.center.y-conn2.center.y)) > 40)) {
		CGPoint left;
		CGPoint right;
		
		if (conn1.center.x < conn2.center.x) {
			left=conn1.center;
			right=conn2.center;
			left.x += 20;
			right.x -= 20;
		} else {
			right=conn1.center;
			left=conn2.center;			
			left.x += 20;
			right.x -= 20;
		}
		[lineview setConnectionPoints:left p2:right];
		[lineview setNeedsDisplay];
	}	
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
