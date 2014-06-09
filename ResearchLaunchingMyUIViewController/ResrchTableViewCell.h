//
//  ResrchTableViewCell.h
//  ResearchLaunchingMyUIViewController
//
//  Created by Satya Avasarala on 6/9/14.
//  Copyright (c) 2014 com.satya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResrchTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *author;
@property (nonatomic, strong) UILabel *date;
@property (nonatomic, strong) UIImageView *thumbnail;


+(CGFloat) heightOfTheCell;
-(void)setConstraints:(UIView*)superview;
@end
