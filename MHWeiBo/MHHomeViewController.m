//
//  MHHomeViewController.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHHomeViewController.h"
#import "UIBarButtonItem+IconButton.h"
#import "MHTitleButton.h"

@interface MHHomeViewController()
@property (weak, nonatomic) MHTitleButton* titleButton;
@end

@implementation MHHomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonImage:@"navigationbar_friendsearch" selectImage:@"navigationbar_friendsearch_highlighted" taget:self action:@selector(onClickFindFriend:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonImage:@"navigationbar_pop" selectImage:@"navigationbar_pop_highlighted" taget:self action:@selector(onClickFindFriend:)];

    // 中间按钮
    MHTitleButton *titleButton = [MHTitleButton titleButton];
    // 图标
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 文字
    [titleButton setTitle:@"晓峰有残月" forState:UIControlStateNormal];
    // 位置和尺寸
    titleButton.frame = CGRectMake(0, 0, 140, 40);
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    self.titleButton = titleButton;
}

- (void)onClickFindFriend:(UIBarButtonItem*)sender{
    NSLog(@"找朋友");
}

- (void)onClickScan:(UIBarButtonItem*)sender{
    NSLog(@"扫一扫");
}

- (void)titleClick:(UIButton*)sender{
    static bool bState = NO;
    bState = !bState;
    if (bState) {
        [self.titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    } else {
        [self.titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
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
    cell.detailTextLabel.text = [NSString stringWithFormat:@"首页 %ld", (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
}


@end
