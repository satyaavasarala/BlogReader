//
//  ResrchUIWebViewController.m
//  ResearchLaunchingMyUIViewController
//
//  Created by Satya Avasarala on 6/9/14.
//  Copyright (c) 2014 com.satya. All rights reserved.
//

#import "ResrchUIWebViewController.h"
#import <Masonry/Masonry.h>

@interface ResrchUIWebViewController ()

@end

@implementation ResrchUIWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.detailsView = [[UIWebView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.detailsView];
    
    [self.detailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlToLoad]];
    [self.detailsView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
