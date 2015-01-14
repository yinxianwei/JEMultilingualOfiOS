//
//  AppDelegate.m
//  Translation
//
//  Created by 尹现伟 on 15-1-14.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "JETranslation.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSMutableDictionary *dict;

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;

@property (nonatomic, assign) BOOL state;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.from = @"auto";
    self.to   = @"auto";
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




- (IBAction)translation:(id)sender {
    if (self.state) {
        NSString *string =[JETranslation translationContent:self.textView1.string from:self.from to:self.to];
        self.textView2.string = string;
        return;
    }
    NSMutableArray *ary = [JETranslation dictWithString:self.textView1.string];

    NSMutableString *string = [NSMutableString string];
    
    for (int i = 0; i<ary.count; i++) {
        NSMutableDictionary *dict = ary[i];
        //取key
        if (dict.allKeys.count) {
            NSString *key = dict.allKeys[0];
            NSString *value = dict[key];
            
            value =[JETranslation translationContent:value from:self.from to:self.to];
            [dict setObject:value forKey:key];
            [string appendFormat:@"\"%@\" = \"%@\";\n",key,value];
        }
    }
    self.textView2.string = string;
}

- (IBAction)fromClick:(id)sender {
    NSPopUpButton *button = (NSPopUpButton *)sender;

    self.from = [JETranslation language][button.selectedTag];
}

- (IBAction)toClick:(id)sender {
    NSPopUpButton *button = (NSPopUpButton *)sender;
    
    self.to = [JETranslation language][button.selectedTag];
}

- (IBAction)check:(id)sender {
    NSButton *button = (NSButton *)sender;
    if ([button state]) {
        self.state = YES;
    }else{
        self.state = NO;
    }
    
}
@end
