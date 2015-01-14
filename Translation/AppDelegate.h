//
//  AppDelegate.h
//  Translation
//
//  Created by 尹现伟 on 15-1-14.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (unsafe_unretained) IBOutlet NSTextView *textView1;
@property (unsafe_unretained) IBOutlet NSTextView *textView2;
- (IBAction)translation:(id)sender;
- (IBAction)fromClick:(id)sender;
- (IBAction)toClick:(id)sender;
- (IBAction)check:(id)sender;


@end

