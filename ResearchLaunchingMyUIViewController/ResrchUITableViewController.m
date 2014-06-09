//
//  ResrchUITableViewController.m
//  ResearchLaunchingMyUIViewController
//
//  Created by Satya Avasarala on 6/9/14.
//  Copyright (c) 2014 com.satya. All rights reserved.
//

#import "ResrchUITableViewController.h"
#import "ResrchTableViewCell.h"
#import "ResrchUIWebViewController.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface ResrchUITableViewController ()

@end

@implementation ResrchUITableViewController {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://blog.teamtreehouse.com/api/get_recent_summary/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.blogPosts = [responseObject objectForKey:@"posts"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    ResrchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ResrchTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [cell setConstraints:cell.contentView];
    }
  
    cell.title.text = [[self.blogPosts objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.author.text = [[self.blogPosts objectAtIndex:indexPath.row] valueForKey:@"author"];
    
    
    NSString *thumbnailUrl = [[self.blogPosts objectAtIndex:indexPath.row] valueForKey:@"thumbnail"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"image/jpeg", @"image/png", @"text/javascript", nil];
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    [manager GET:thumbnailUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIImage *image = [UIImage imageWithData:responseObject];
        cell.thumbnail.image = image;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [[self.blogPosts objectAtIndex:indexPath.row] valueForKey:@"date"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    cell.date.text = [dateFormatter stringFromDate:date];
    
    return cell;
}



-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ResrchTableViewCell.heightOfTheCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.destinationController = [[ResrchUIWebViewController alloc] init];
    self.destinationController.urlToLoad = [[self.blogPosts objectAtIndex:indexPath.row] valueForKey:@"url"];
    [self.navigationController pushViewController:self.destinationController animated:YES];
}

@end
