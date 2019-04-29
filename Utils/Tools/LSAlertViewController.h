//
//  LSAlertViewController.h
//  Utils
//
//  Created by Lee on 2018/12/13.
//  Copyright © 2018 辛未年. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, LSAlertActionStyle) {
    LSAlertActionStyleDefault = 0,
    LSAlertActionStyleCancel
};

@interface LSAlertAction : UIButton

@property (nonatomic, assign) LSAlertActionStyle style;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, strong) UIView* line;

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(LSAlertActionStyle)style handler:(void (^ __nullable)(LSAlertAction *action))handler;

@end


@interface LSAlertViewController : UIViewController

@property (nonatomic, copy) NSString* alertTitle;

+ (instancetype)alertWithTitle:(nullable NSString *)title;

-(void)addAction:(LSAlertAction *)action;

-(void)showIn:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
