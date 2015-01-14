//
//  JETranslation.m
//  Translation
//
//  Created by 尹现伟 on 15-1-14.
//  Copyright (c) 2015年 DNE Technology Co.,Ltd. All rights reserved.
//

#import "JETranslation.h"
#define APPKEY @"YBXIoUBQ8WEv2zpSmpEcAyW5"

@implementation JETranslation

+ (NSString *)translationContent:(NSString *)conent from:(NSString *)form to:(NSString *)to{
    NSString *urlStr = [[NSString stringWithFormat:@"http://openapi.baidu.com/public/2.0/bmt/translate?client_id=%@&q=%@&from=%@&to=%@",APPKEY,conent,form,to] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (received==nil) {
        return @"";
    }
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:received options:0 error:nil];
    NSArray *ary = [dict objectForKey:@"trans_result"];
    if (!ary.count) {
        return @"";
    }
    NSString *receivedString = [[ary objectAtIndex:0] objectForKey:@"dst"];
    
    return receivedString;
}

+ (NSMutableArray *)dictWithString:(NSString *)string{
    
    NSMutableArray *array = [NSMutableArray array];
    if (string.length) {
        //;分割
        NSArray *ary1 = [string componentsSeparatedByString:@";"];
        for (NSString *keyValueStr in ary1) {
            //=分割
            if (keyValueStr.length) {
                NSArray *ary2 = [keyValueStr componentsSeparatedByString:@"="];
                //=左为key右为value
                if (ary2.count == 2) {
                    
                    //取key value
                    NSString *key = ary2[0];
                    NSString *value = ary2[1];
                    
                    key = [self removeString:key];
                    value = [self removeString:value];
                    if (key.length&&value.length) {
                        
                        //放入字典
                        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:value forKey:key];
                        
                        //放入array
                        [array addObject:dict];
                    }
                }
               
            }
        }
    }
    return array;
}
+ (NSString *)removeString:(NSString *)aString{
    NSString *str = [aString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return str;
}

+ (NSArray *)language{
    return @[@"auto",@"zh",@"en",@"jp",@"kor",@"spa",@"fra",@"th",@"ara",@"ru",@"pt",@"yue",@"wyw",@"zh",@"de",@"it",];
}
@end
