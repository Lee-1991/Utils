//
//  LSHomeViewController.m
//  Utils
//
//  Created by Lee on 2018/12/13.
//  Copyright © 2018 辛未年. All rights reserved.
//

#import "LSHomeViewController.h"
#import "LSAlertViewController.h"

@interface LSHomeViewController ()

@end

@implementation LSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showAlert];
}

-(void)showAlert{
    NSLog(@"showAlert");
    LSAlertViewController* alert = [LSAlertViewController alertWithTitle:nil];
    LSAlertAction* action = [LSAlertAction actionWithTitle:@"action" style:LSAlertActionStyleDefault handler:^(LSAlertAction * _Nonnull action) {
        NSLog(@"alert click action");
    }];
    LSAlertAction* action1 = [LSAlertAction actionWithTitle:@"action1" style:LSAlertActionStyleDefault handler:^(LSAlertAction * _Nonnull action) {
        NSLog(@"alert click action1");
    }];
    LSAlertAction* action2 = [LSAlertAction actionWithTitle:@"cancel" style:LSAlertActionStyleCancel handler:^(LSAlertAction * _Nonnull action) {
        NSLog(@"alert click cancel");
    }];
    [alert addAction:action];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert showIn:self];
//    [self presentViewController:alert animated:YES completion:nil];
}
@end
