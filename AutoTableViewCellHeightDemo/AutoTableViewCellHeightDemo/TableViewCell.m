//
//  TableViewCell.m
//  AutoTableViewCellHeightDemo
//
//  Created by leijin on 16/8/4.
//  Copyright © 2016年 xel. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *photoView;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.label.frame = CGRectMake(100, 20, self.bounds.size.width - 120, 0);
        
        
        self.photoView.frame = CGRectMake(15, 10, 60, 60);
        
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _label.text = title;
    
    CGFloat height = [_label sizeThatFits:CGSizeMake(_label.frame.size.width, MAXFLOAT)].height;
    CGRect labelFrame = _label.frame;
    labelFrame.size.height = height;
    _label.frame = labelFrame;
}

- (UILabel *)label {
    if (!_label) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:13];
        _label.numberOfLines = 0;
        _label.lineBreakMode = NSLineBreakByCharWrapping;
        
        [self.contentView addSubview:_label];
    }
    return _label;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _photoView.image = [UIImage imageNamed:@"888.jpg"];
        _photoView.layer.cornerRadius = 3.f;
        _photoView.clipsToBounds = YES;
        
        [self.contentView addSubview:_photoView];
    }
    return _photoView;
}

@end
