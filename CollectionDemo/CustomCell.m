//
//  CustomCell.m
//  CollectionDemo
//
//  Created by huayu on 15/5/12.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "CustomCell.h"
@interface CustomCell ()

@end

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.textField = [[UITextField alloc] initWithFrame:self.contentView.bounds];
    [self.textField setTextColor:[UIColor whiteColor]];
    [self.textField setBackgroundColor:[UIColor brownColor]];
    [self.textField addTarget:self action:@selector(change:) forControlEvents:UIControlEventEditingChanged];
    [self.textField setTextAlignment:NSTextAlignmentCenter];
    [self.textField setDelegate:self];
    [self addSubview:self.textField];
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bounds = CGRectMake(0, 0, self.textField.bounds.size.width, self.bounds.size.height);
    [self.textField setFrame:CGRectMake(0, 0, bounds.size.width, self.frame.size.height)];
    CGRect frame = self.frame;
    frame.size.width = bounds.size.width;
    self.frame = frame;
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    return YES;
}

- (void)change:(UITextField *)textFiled
{
    CGRect bounds = [self.textField.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.textField.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName:self.textField.font} context:nil];

    self.textField.bounds = CGRectMake(0, 0, bounds.size.width,bounds.size.height);
    [self layoutSubviews];
    NSLog(@"%@",NSStringFromCGRect(bounds));
    [self.delegate changed];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end
