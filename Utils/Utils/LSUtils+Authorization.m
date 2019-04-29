//
//  LSUtils+Authorization.m
//  Utils
//
//  Created by Lee on 2019/4/29.
//  Copyright © 2019 辛未年. All rights reserved.
//

#import "LSUtils+Authorization.h"

@implementation LSUtils (Authorization)

+ (void)authorization:(AVMediaType)type authorized:(AuthorizedHandle)authorized{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:type];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:
        {
            [AVCaptureDevice requestAccessForMediaType:type completionHandler:^(BOOL granted) {
                authorized(granted);
            }];
        }
            break;
            
        case AVAuthorizationStatusRestricted:
            authorized(NO);
            break;
            
        case AVAuthorizationStatusDenied:
            authorized(NO);
            break;
            
        case AVAuthorizationStatusAuthorized:
            authorized(YES);
            break;
            
        default:
            authorized(NO);
            break;
    }
}

+(void)authorizationAudioAuthorized:(AuthorizedHandle)authorized{
    [BLUtils authorization:AVMediaTypeAudio authorized:authorized];
}

+(void)authorizationVideoAuthorized:(AuthorizedHandle)authorized{
    [BLUtils authorization:AVMediaTypeVideo authorized:authorized];
}

+(BOOL)whetherAuthorizationStatusDenied:(AVMediaType)type{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:type];
    if (status == AVAuthorizationStatusDenied) {
        return YES;
    }
    return NO;
}

+(void)pauseBackgroundAudio{
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
}

+ (void)resumeBackgroundAudio{
    [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}

@end
