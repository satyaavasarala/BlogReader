//
//  ResrchTableViewCell.m
//  ResearchLaunchingMyUIViewController
//
//  Created by Satya Avasarala on 6/9/14.
//  Copyright (c) 2014 com.satya. All rights reserved.
//

#import "ResrchTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation ResrchTableViewCell

static const CGFloat rowHeight = 250;
static const CGFloat leftMargin = 20;
static const CGFloat rightMargin = 20;
static const CGFloat gapBetweenTwoArtciles = 15;
static const CGFloat gapBetweenThumbnailAndAuthor = 10;
static const CGFloat gapBetweenAuthorAndTitle = 5;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        
        self.thumbnail = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        self.author = [[UILabel alloc] initWithFrame:CGRectZero];
        self.author.textColor = [UIColor grayColor];
        self.author.font = [UIFont fontWithName:@"Arial" size:12.0f];

        
        self.date = [[UILabel alloc] initWithFrame:CGRectZero];
        self.date.textColor = [UIColor grayColor];
        self.date.font = [UIFont fontWithName:@"Arial" size:12.0f];

        
        self.title = [[UILabel alloc] initWithFrame:CGRectZero];
        self.title.font = [UIFont fontWithName:@"Verdana-Bold" size:15.0f];
        self.title.numberOfLines = 0;
        
        
        
        [self.contentView insertSubview:self.thumbnail atIndex:0];
        [self.contentView insertSubview:self.title atIndex:1];
        [self.contentView insertSubview:self.author atIndex:2];
        [self.contentView insertSubview:self.date atIndex:3];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat) heightOfTheCell {
    return rowHeight;
}

-(void)setConstraints:(UIView*)superview {
    
    
    [self.thumbnail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(gapBetweenTwoArtciles);
        make.centerX.equalTo(superview.mas_centerX);
    }];
    
    [self.author mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thumbnail.mas_bottom).with.offset(gapBetweenThumbnailAndAuthor);
        make.left.equalTo(superview.mas_left).with.offset(leftMargin);
    }];
    
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thumbnail.mas_bottom).with.offset(gapBetweenThumbnailAndAuthor);
        make.right.equalTo(superview.mas_right).with.offset(-rightMargin);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.author.mas_bottom).with.offset(gapBetweenAuthorAndTitle);
        make.left.equalTo(superview.mas_left).with.offset(leftMargin);
        make.right.equalTo(superview.mas_right).with.offset(-rightMargin);
    }];
}


@end
