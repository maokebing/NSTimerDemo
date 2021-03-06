//
//  TTObject.m
//  NSTimerDemo
//
//  Created by mao on 7/17/15.
//  Copyright (c) 2015 mao. All rights reserved.
//

#import "TTObject.h"

@interface TTObject()

//@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation TTObject


-(void)dealloc {
	[self.timer invalidate];
	self.timer = nil;
	
	NSLog(@"%s", __func__);
}

- (void)startTimer {
	if (self.timer.isValid) {
		return;
	}
	else {
		self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimeFire) userInfo:nil repeats:YES];
//				__weak TTObject* wkself = self;
//		self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:wkself selector:@selector(onTimeFire) userInfo:nil repeats:YES];
	}
}

- (void)stopTimer {
	if (self.timer) {
		[self.timer invalidate];
	}
}

- (void)onTimeFire {
	NSLog(@"%s", __func__);
}


@end
