//
//  UITableViewCell+XEL_AutoHeightCell.h
//  AutoTableViewCellHeightDemo
//
//  Created by leijin on 16/8/4.
//  Copyright © 2016年 xel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (XEL_AutoHeightCell)

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) NSArray *bottomViews;
@property (nonatomic, assign) CGFloat bottomOffset;

+ (CGFloat)autoHeightAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

@end

@interface UITableView (XEL_TableView)

@property (nonatomic, strong) NSMutableDictionary *cacheHeightDictionary;

@end
