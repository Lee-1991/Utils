//
//  LSUtils+Authorization.h
//  Utils
//
//  Created by Lee on 2019/4/29.
//  Copyright © 2019 辛未年. All rights reserved.
//

#import "LSUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSUtils (Authorization)


typedef void(^AuthorizedHandle)(BOOL authorized);

/**
 是否有权限，没请求授权的时候会触发请求授权逻辑
 
 @param authorized 是否授权
 */
+(void)authorization:(AVMediaType )type authorized:(AuthorizedHandle)authorized;

/**
 是否有麦克风权限，没请求授权的时候会触发请求授权逻辑
 
 @param authorized 是否授权
 */
+(void)authorizationAudioAuthorized:(AuthorizedHandle)authorized;

/**
 是否有麦克风权限，没请求授权的时候会触发请求授权逻辑
 
 @param authorized 是否授权
 */
+(void)authorizationVideoAuthorized:(AuthorizedHandle)authorized;

/**
 权限是否被拒绝
 */
+(BOOL)whetherAuthorizationStatusDenied:(AVMediaType )type;

/**
 暂停后台正在播放的音频
 */
+(void)pauseBackgroundAudio;

/**
 恢复后台正在播放的音频
 */
+(void)resumeBackgroundAudio;


@end

NS_ASSUME_NONNULL_END
