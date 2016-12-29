//
//  UITableView+SetAndLayoutTableHeaderView.m
//  xfj
//
//  Created by Vbon on 2016/12/29.
//  Copyright © 2016年 bjy. All rights reserved.
//

#import "UITableView+SetAndLayoutTableHeaderView.h"

@implementation UITableView (SetAndLayoutTableHeaderView)

- (void)setAndLayoutTableHeaderView:(UIView *)header;{
    self.tableHeaderView = header;
    [header setNeedsLayout];
    [header layoutIfNeeded];
    CGFloat height = [header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = header.frame;
    frame.size.height = height;
    header.frame = frame;
    self.tableHeaderView = header;
}

@end
