//
//  LSAlertViewController.m
//  Utils
//
//  Created by Lee on 2018/12/13.
//  Copyright © 2018 辛未年. All rights reserved.
//

#import "LSAlertViewController.h"

#define LS_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define LS_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define kNotificationAlertActionClick @"kNotificationAlertActionClick"

#pragma mark -LSAlertAction
typedef void(^LSAlertActionBlock)(LSAlertAction *action);

@interface LSAlertAction()

@property (nonatomic, copy) LSAlertActionBlock actionBlock;

@end

@implementation LSAlertAction

+(instancetype)actionWithTitle:(NSString *)title style:(LSAlertActionStyle)style handler:(void (^)(LSAlertAction * _Nonnull))handler{
    LSAlertAction* action = [[LSAlertAction alloc] initWithTitle:title style:style handler:handler];
    return action;
}

-(instancetype)initWithTitle:(NSString *)title style:(LSAlertActionStyle)style handler:(void (^)(LSAlertAction * _Nonnull))handler{
    if (self = [super init]) {
        self.title = title;
        self.style = style;
        self.actionBlock = handler;
        [self setupContentView];
    }
    return self;
}

-(void)setupContentView{
    if (self.style == LSAlertActionStyleCancel) {
        self.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.line];
    }
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitle:self.title forState:UIControlStateNormal];
    [self addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAlertActionClick object:nil];
    if (self.actionBlock) {
        self.actionBlock(self);
    }
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 70, LS_ScreenWidth, 0.5)];
        _line.backgroundColor = [UIColor grayColor];
    }
    return _line;
}

@end


@interface LSAlertViewController ()

@property (nonatomic, strong) NSMutableArray<LSAlertAction *> *contentActions;
@property (nonatomic, strong) UIView* backView;
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation LSAlertViewController


+(instancetype)alertWithTitle:(NSString *)title{
    LSAlertViewController* alert = [[LSAlertViewController alloc] initWithTitle:title];
    return alert;
}

-(instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        [self setupDefalutData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionClickEvent) name:kNotificationAlertActionClick object:nil];
}

#pragma mark -public
-(void)addAction:(LSAlertAction *)action{
    [self.contentActions addObject:action];
    [self refreshContentView];
}

- (void)showIn:(UIViewController *)controller{
    [controller presentViewController:self animated:NO completion:^{
        [UIView animateWithDuration:0.5f animations:^{
            self.contentView.frame = CGRectMake(0, LS_ScreenHeight-self.contentHeight, LS_ScreenWidth, self.contentHeight+10);
        }];
    }];
}

#pragma mark -private
-(void)setupDefalutData{
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.contentActions = [[NSMutableArray alloc] init];
}

-(void)actionClickEvent{
    [self dismissSelf];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissSelf];
}

-(void)dismissSelf{
    [UIView animateWithDuration:0.3f animations:^{
        self.backView.alpha = 0.0;
        self.contentView.frame = CGRectMake(0, LS_ScreenHeight, LS_ScreenWidth, self.contentHeight+10);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}


-(NSArray<LSAlertAction *> *)actions{
    return self.contentActions;
}

-(void)refreshContentView{

    while (self.view.subviews.count) {
        [self.view.subviews.lastObject removeFromSuperview];
    }
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.contentView];
    self.contentHeight = 0;
    LSAlertAction* lastAction = nil;
    for (LSAlertAction* action in self.contentActions) {
       CGFloat actionHeight = (action.style == LSAlertActionStyleCancel) ? 64 : 72.5;
        action.frame = CGRectMake(0, self.contentHeight, LS_ScreenWidth, actionHeight);
        [self.contentView addSubview:action];
        self.contentHeight += actionHeight;
        if (action.style == LSAlertActionStyleCancel) {
            [lastAction.line removeFromSuperview];
        }
        lastAction = action;
    }
    self.contentView.frame = CGRectMake(0, LS_ScreenHeight, LS_ScreenWidth, self.contentHeight+10);
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:self.view.bounds];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.5;
    }
    return _backView;
}

-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.layer.cornerRadius = 8;
        _contentView.layer.masksToBounds = true;
    }
    return _contentView;
}

@end
