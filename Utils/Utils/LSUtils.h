//
//  LSUtils.h
//  Utils
//
//  Created by Lee on 2019/4/29.
//  Copyright © 2019 辛未年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSUtils : NSObject

/**
 判断字符串是否为空，nil或长度为0都是空
 */
+ (BOOL)isEmpty:(NSString*) str;

/**
 将字符串MD5
 */
+ (NSString*)getMD5String:(NSString*)input;

/**
 获取当前的版本号
 */
+ (int)bundleVersion;

/**
 移除子视图
 */
+ (void)removeAllChildren:(UIView*)view;

/**
 是否是纯数字
 */
+ (BOOL)isPureInt:(NSString*)string;

@end

NS_ASSUME_NONNULL_END
