//
//  ResrchUITableViewController.h
//  ResearchLaunchingMyUIViewController
//
//  Created by Satya Avasarala on 6/9/14.
//  Copyright (c) 2014 com.satya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResrchUIWebViewController.h"

@interface ResrchUITableViewController : UITableViewController
@property (nonatomic, strong) NSArray *blogPosts;
@property (nonatomic, strong) ResrchUIWebViewController *destinationController;
@end
