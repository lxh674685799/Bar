//
//  MyNavigationBar.h
//  kuaixiao
//
//  Created by lxh on 14/11/19.
//  Copyright (c) 2014年 lxh. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol MyNavigationBarDelegate <NSObject>

@optional
- (void)leftBtnAcion:(id)sender;
- (void)rightBtnAcion:(id)sender;
- (void)colorClick:(id)sender;
- (void)editBtnClick:(id)sender;
- (void)sureBtnClick:(id)sender;
- (void)cancelBtnClick:(id)sender;
@end

@interface MyNavigationBar : UIView
@property (nonatomic, strong) UIButton *rightBtn;
@property(strong,nonatomic)UILabel * titleLabel;

@property (nonatomic , strong)UIButton *rightBtn1;
@property (nonatomic , strong)UIButton *rightBtn2;
@property (nonatomic , strong)UIButton *sureBtn;
@property (nonatomic , strong)UIButton *cancelBtn;
@property (nonatomic , strong)UIButton * leftBtn;
@property(weak,nonatomic)id<MyNavigationBarDelegate> delegate;
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle withRightTitle:(NSString *)rightTitle withLeftBtnHidden:(BOOL)l_hidden withRightBtnHidden:(BOOL)r_hidden;//左边(文字+图片) 右边(文字)
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle withRightImage:(UIImage* )rightImage withLeftBtnHidden:(BOOL)l_hidden withRightBtnHidden:(BOOL)r_hidden;//左边(文字+图片) 右边(图片)
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle;//知识库的导航
@end