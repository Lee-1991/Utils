//
//  Utils.m
//  Utils
//
//  Created by lee on 2017/6/14.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+(UIColor *)getUIColorFromHex:(unsigned int)hex
{
    int alpha = hex >> 24;
    int red = (hex & 0xff0000) >> 16;
    int green = (hex & 0xff00) >> 8;
    int blue = hex & 0xff;
    UIColor* color = [UIColor colorWithRed:((float) red / 255.0f)
                           green:((float) green / 255.0f)
                            blue:((float) blue / 255.0f)
                           alpha:alpha / 255.0f];
    
    return color;
}

@end
