/*
 DCTLogViewController.m
 DCTLogViewController
 
 Created by Daniel Tull on 21.11.2011.
 
 
 
 Copyright (c) 2011 Daniel Tull. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DCTLogViewController.h"

@implementation DCTLogViewController

@synthesize textView;

- (void)loadView {
	
	[super loadView];
	
	if (self.textView != nil) return;
	
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
