//
//  UITableViewCell+XEL_AutoHeightCell.m
//  AutoTableViewCellHeightDemo
//
//  Created by leijin on 16/8/4.
//  Copyright © 2016年 xel. All rights reserved.
//

#import "UITableViewCell+XEL_AutoHeightCell.h"
#import <objc/runtime.h>

@implementation UITableViewCell (XEL_AutoHeightCell)

- (void)setBottomView:(UIView *)bottomView {
    objc_setAssociatedObject(self, @selector(bottomView), bottomView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)bottomView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomViews:(NSArray *)bottomViews {
    objc_setAssociatedObject(self, @selector(bottomViews), bottomViews, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray *)bottomViews {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomOffset:(CGFloat)bottomOffset {
    objc_setAssociatedObject(self, @selector(bottomOffset), @(bottomOffset), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)bottomOffset {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

+ (CGFloat)autoHeightAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    if (tableView.cacheHeightDictionary == nil) {
        tableView.cacheHeightDictionary = [NSMutableDictionary dictionary];
    }
    NSString *cacheHeightKey = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    NSNumber *cacheHeightValue = [tableView.cacheHeightDictionary objectForKey:cacheHeightKey];
    if (cacheHeightValue) {
        return [cacheHeightValue floatValue];
    }
    
    UITableViewCell *cell = [tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat tableViewWidth = CGRectGetWidth(tableView.frame);
    if (tableViewWidth == 0) {
        return 0;
    }
    CGRect cellFrame = cell.frame;
    cellFrame.size.width = CGRectGetWidth(tableView.frame);
    cell.frame = cellFrame;
    [cell layoutIfNeeded];
    UIView *bottomView = nil;
    if (cell.bottomView) {
        bottomView = cell.bottomView;
    } else if (cell.bottomViews != nil && cell.bottomViews.count > 0) {
        bottomView = cell.bottomViews[0];
        for (int i = 1; i < cell.bottomViews.count; i++) {
            UIView *view = cell.bottomViews[i];
            if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                bottomView = view;
            }
        }
    } else {
        NSArray *cellSubViews = cell.contentView.subviews;
        if (cellSubViews.count > 0) {
            bottomView = cellSubViews[0];
            for (int i = 1; i < cellSubViews.count; i++) {
                UIView *view = cellSubViews[i];
                if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                    bottomView = view;
                }
            }
        } else {
            bottomView = cell.contentView;
        }
    }
    
    CGFloat cacheHeight = CGRectGetMaxY(bottomView.frame) + cell.bottomOffset;
    
    [tableView.cacheHeightDictionary setObject:@(cacheHeight) forKey:cacheHeightKey];
    return cacheHeight;
}


@end

@implementation UITableView (XEL_TableView)

- (void)setCacheHeightDictionary:(NSMutableDictionary *)cacheHeightDictionary {
    objc_setAssociatedObject(self, @selector(cacheHeightDictionary), cacheHeightDictionary, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableDictionary *)cacheHeightDictionary {
    return objc_getAssociatedObject(self, _cmd);
}

@end
