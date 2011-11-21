//
//  DCTLogViewController.h
//  DCTConnectionController
//
//  Created by Daniel Tull on 21.11.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCTLogViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextView *textView;

- (void)log:(NSString *)stringFormat, ...;

@end
