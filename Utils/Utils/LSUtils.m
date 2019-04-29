//
//  LSUtils.m
//  Utils
//
//  Created by Lee on 2019/4/29.
//  Copyright © 2019 辛未年. All rights reserved.
//

#import "LSUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LSUtils

+ (BOOL) isEmpty : (NSString*) str
{
    if (str == nil || str.length == 0 || str == NULL)
    {
        return  YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString *)getMD5String:(NSString*)input
{
    if ([LSUtils isEmpty:input])
    {
        return nil;
    }
    int length = CC_MD5_DIGEST_LENGTH;
    const char* str = [input UTF8String];
    unsigned char result[length];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:length];
    
    for(int i = 0; i < length; i++)
    {
        [ret appendFormat:@"%02X",result[i]];
    }
    
    return [ret lowercaseString];
}

+ (int)bundleVersion
{
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] intValue];
}

+ (void) removeAllChildren:(UIView* ) view
{
    if (!view)
    {
        return;
    }
    
    for (UIView* child in view.subviews)
    {
        [child removeFromSuperview];
    }
}

+ (BOOL)isPureInt:(NSString*)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


@end
