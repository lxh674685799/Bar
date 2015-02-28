//
//  MyNavigationBar.m
//  kuaixiao
//
//  Created by lxh on 14/11/19.
//  Copyright (c) 2014年 lxh. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBar

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BACKGROUNDCOLOR;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight - 0.5, ScreenWidth, 0.5)];
        lineView.backgroundColor = Color(167, 168, 170);
        [self addSubview:lineView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 44, ScreenWidth, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle withRightImage:(UIImage* )rightImage withLeftBtnHidden:(BOOL)l_hidden withRightBtnHidden:(BOOL)r_hidden{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BACKGROUNDCOLOR;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight - 0.5, ScreenWidth, 0.5)];
        lineView.backgroundColor = Color(167, 168, 170);
        [self addSubview:lineView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 44, ScreenWidth, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.leftBtn addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIFont * font = [UIFont systemFontOfSize:15.0];
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        CGSize size = CGSizeZero;
        size = [leftTitle boundingRectWithSize:CGSizeMake(200,100) options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        self.leftBtn.frame = CGRectMake(0, frame.size.height - 44, size.width + 30, 44);
        [self.leftBtn setImage:[UIImage imageNamed:@"back_normal.png"] forState:UIControlStateNormal];
        [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 10, 15, size.width + 5)];
        self.leftBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.leftBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        [self addSubview:self.leftBtn];
        self.leftBtn.hidden = l_hidden;
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.frame = CGRectMake(frame.size.width - 44,frame.size.height - 44, 33, 44);
        [_rightBtn setImage:rightImage forState:UIControlStateNormal];
//        [_rightBtn setImageEdgeInsets:UIEdgeInsetsMake(-5, 5, -5, 5)];
        [_rightBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self addSubview:_rightBtn];
        _rightBtn.hidden = r_hidden;
    }
    return self;

}
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle withRightTitle:(NSString *)rightTitle withLeftBtnHidden:(BOOL)l_hidden withRightBtnHidden:(BOOL)r_hidden
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BACKGROUNDCOLOR;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight - 0.5, ScreenWidth, 0.5)];
        lineView.backgroundColor = Color(167, 168, 170);
        [self addSubview:lineView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 44, ScreenWidth, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIFont * font = [UIFont systemFontOfSize:15.0];
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        CGSize size = CGSizeZero;
        size = [leftTitle boundingRectWithSize:CGSizeMake(200,100) options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        leftBtn.frame = CGRectMake(0, frame.size.height - 44, size.width + 30, 44);
        [leftBtn setImage:[UIImage imageNamed:@"back_normal.png"] forState:UIControlStateNormal];
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 10, 15, size.width + 5)];
        leftBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [leftBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        [self addSubview:leftBtn];
        leftBtn.hidden = l_hidden;
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.frame = CGRectMake(frame.size.width - 67,frame.size.height - 36, 67, 28);
        [_rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        [_rightBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self addSubview:_rightBtn];
        _rightBtn.hidden = r_hidden;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withLeftTitle:(NSString *)leftTitle{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BACKGROUNDCOLOR;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight - 0.5, ScreenWidth, 0.5)];
        lineView.backgroundColor = Color(167, 168, 170);
        [self addSubview:lineView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, frame.size.height - 44, ScreenWidth - 200, 44)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        UIFont * font = [UIFont systemFontOfSize:15.0];
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        CGSize size = CGSizeZero;
        size = [leftTitle boundingRectWithSize:CGSizeMake(200,100) options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        leftBtn.frame = CGRectMake(0, frame.size.height - 44, size.width + 30, 44);
        [leftBtn setImage:[UIImage imageNamed:@"back_normal.png"] forState:UIControlStateNormal];
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 10, 15, size.width + 5)];
        leftBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [leftBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        [self addSubview:leftBtn];
        
        self.rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn1.frame = CGRectMake(ScreenWidth - 85, NavHeight - 44, 44, 44);
        [self.rightBtn1 setImage:[UIImage imageNamed:@"ic_title_color_edit_btn_normal.png"] forState:UIControlStateNormal];
        [self addSubview:self.rightBtn1];
        self.rightBtn1.hidden = NO;
        [self.rightBtn1 addTarget:self action:@selector(rightClick1:) forControlEvents:UIControlEventTouchUpInside];
        
        self.rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn2.frame = CGRectMake(ScreenWidth - 44, NavHeight - 38, 33, 33);
        [self.rightBtn2 setImage:[UIImage imageNamed:@"edit.png"] forState:UIControlStateNormal];
        [self addSubview:self.rightBtn2];
        self.rightBtn2.hidden = NO;
        [self.rightBtn2 addTarget:self action:@selector(rightClick2:) forControlEvents:UIControlEventTouchUpInside];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelBtn.frame = CGRectMake(ScreenWidth - 90, NavHeight - 44, 45, 44);
        [self addSubview:self.cancelBtn];
        self.cancelBtn.hidden = YES;
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.cancelBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(rightClick3:) forControlEvents:UIControlEventTouchUpInside];
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sureBtn.frame = CGRectMake(ScreenWidth - 44, NavHeight - 44, 45, 44);
        [self addSubview:self.sureBtn];
        [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        self.sureBtn.hidden = YES;
        self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.sureBtn setTitleColor:Color(11, 92, 254) forState:UIControlStateNormal];
        [self.sureBtn addTarget:self action:@selector(rightClick4:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)clickLeftBtn:(id)sender
{
    if (_delegate&&[_delegate respondsToSelector:@selector(leftBtnAcion:)]) {
        [_delegate leftBtnAcion:sender];
    }
}
- (void)clickRightBtn:(id)sender
{
    if (_delegate&&[_delegate respondsToSelector:@selector(rightBtnAcion:)]) {
        [_delegate rightBtnAcion:sender];
    }
}
- (void)rightClick1:(id)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(colorClick:)]) {
        [_delegate colorClick:sender];
    }
}
- (void)rightClick2:(id)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(editBtnClick:)]) {
        [_delegate editBtnClick:sender];
    }
}
- (void)rightClick3:(id)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(cancelBtnClick:)]) {
        [_delegate cancelBtnClick:sender];
    }
}
- (void)rightClick4:(id)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(sureBtnClick:)]) {
        [_delegate sureBtnClick:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
