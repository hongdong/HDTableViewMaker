//
//  HDTableViewCell.m
//  HDTableViewDataSourceDemo
//
//  Created by Abner on 16/7/16.
//  Copyright © 2016年 Abner. All rights reserved.
//

#import "HDTableViewCell.h"

@interface HDTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end

@implementation HDTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLbl.text = title;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
