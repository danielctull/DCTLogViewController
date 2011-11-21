//
//  DCTLogViewController.m
//  DCTConnectionController
//
//  Created by Daniel Tull on 21.11.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTLogViewController.h"

@implementation DCTLogViewController

@synthesize textView;

- (void)loadView {
	
	[super loadView];
	
	if (self.isViewLoaded) return;
	
	self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
	self.textView.font = [UIFont fontWithName:@"Courier New" size:14.0];
	self.view = self.textView;
}

- (void)log:(NSString *)formatString, ... {
	
	BOOL shouldScroll = (self.textView.contentOffset.y + self.textView.bounds.size.height >= self.textView.contentSize.height);
	
	va_list args;
    va_start(args, formatString);
    NSString *string = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"HH:mm:ss.SSS"];
	NSString *dateString = [df stringFromDate:[NSDate date]]; 
	
	NSString *newLine = @"";
	if ([self.textView.text length] > 0) {
		newLine = @"\n";
	}
	
	self.textView.text = [self.textView.text stringByAppendingFormat:@"%@%@ %@", newLine, dateString, string];
	
	if (shouldScroll)
		[self.textView scrollRectToVisible:CGRectMake(0.0, self.textView.contentSize.height - self.textView.bounds.size.height, self.textView.bounds.size.width, self.textView.bounds.size.height) animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

@end
