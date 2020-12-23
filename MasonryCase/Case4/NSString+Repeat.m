//
//  NSString+Repeat.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import "NSString+Repeat.h"

@implementation NSString (Repeat)

+ (NSString *)getString:(NSString *)string withRepeat:(NSInteger)repeat {
    NSMutableString *tempString =[NSMutableString new];
    for (NSInteger i = 0; i < repeat; i ++) {
        [tempString appendString:string];
    }
    return tempString;
}

@end
