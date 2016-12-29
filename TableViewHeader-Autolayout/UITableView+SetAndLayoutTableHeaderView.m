//
//  UITableView+SetAndLayoutTableHeaderView.m
//  xfj
//
//  Created by Vbon on 2016/12/29.
//  Copyright © 2016年 bjy. All rights reserved.
//

#import "UITableView+SetAndLayoutTableHeaderView.h"

@implementation UITableView (SetAndLayoutTableHeaderView)

/**
 *
 *使用AutoLayout来设置TableView的headerView
 *
 @param header headerView
 */
- (void)setAndLayoutTableHeaderView:(UIView *)header;{
    self.tableHeaderView = header;
    [header setNeedsLayout];
    [header layoutIfNeeded];
    //刷新布局后进行UILabel的宽度设置。
    [self parseTreeWithViewSubViewArray:header.subviews];
    CGFloat height = [header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = header.frame;
    frame.size.height = height;
    header.frame = frame;
    self.tableHeaderView = header;
}


/**
 *
 *by Vbon
 *将UIView和subViews组成的结构看成是树，那么这里就形成了多叉树。
 *使用递归来遍历多叉树。
 *
 @param subViewArray subViews的数组
 */
- (void)parseTreeWithViewSubViewArray:(NSArray *)subViewArray{
    if (subViewArray.count == 0) {
        return;
    }
    for (UIView *subView in subViewArray) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            //不设置这个属性会导致算出来的高度不准。
            label.preferredMaxLayoutWidth = label.frame.size.width;
        }
        if (subView.subviews.count > 0) {
            [self parseTreeWithViewSubViewArray:subView.subviews];
        }
    }
}

@end
