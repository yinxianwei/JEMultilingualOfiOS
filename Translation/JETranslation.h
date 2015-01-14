//
//  JETranslation.h
//  Translation
//
//  Created by 尹现伟 on 15-1-14.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETranslation : NSObject

+ (NSString *)translationContent:(NSString *)conent from:(NSString *)form to:(NSString *)to;

+ (NSArray *)language;

+ (NSMutableArray *)dictWithString:(NSString *)string;
@end
