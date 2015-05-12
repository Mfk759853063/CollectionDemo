//
//  CustomCell.h
//  CollectionDemo
//
//  Created by huayu on 15/5/12.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol dds <NSObject>

- (void)changed;

@end

@interface CustomCell : UICollectionViewCell<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSString *holder;
@property (assign, nonatomic) id<dds>delegate;

@end
