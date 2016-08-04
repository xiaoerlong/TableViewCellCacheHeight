//
//  TableViewCell.h
//  AutoTableViewCellHeightDemo
//
//  Created by leijin on 16/8/4.
//  Copyright © 2016年 xel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

- (void)setTitle:(NSString *)title;

@property (nonatomic, assign) BOOL showDebug;

@end
