//
//  NSString+Repeat.h
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Repeat)

+ (NSString *)getString:(NSString *)string withRepeat:(NSInteger)repeat;

@end

NS_ASSUME_NONNULL_END
