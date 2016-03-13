//
//  MHHomeViewController.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHHomeViewController.h"

@interface MHHomeViewController()

@end

@implementation MHHomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:0/*UIBarButtonSystemItemDone*/ target:self action:@selector(onClickItem:)];
}

- (void)onClickItem:(id)sender{
    NSLog(@"onClickItem %@", sender);
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"CELL";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"首页 %d", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
}


@end
