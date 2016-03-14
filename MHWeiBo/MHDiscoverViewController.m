//
//  MHDiscoverViewController.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHDiscoverViewController.h"
#import "MHSearchBar.h"

@implementation MHDiscoverViewController

- (void)viewDidLoad{
    MHSearchBar* searchBar = [MHSearchBar searchBar];
    searchBar.bounds = CGRectMake(0, 0, 300, 34);
    self.navigationItem.titleView = searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"CELL";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"广场 %ld", (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
}
@end
