//
//  MHWriteMessageController.m
//  MHWeiBo
//
//  Created by carrot on 16/3/15.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHWriteMessageController.h"

@implementation MHWriteMessageController

- (void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"说些什么...";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:0 target:self action:@selector(onClickCancel:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:0 target:self action:@selector(onClickSend:)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)onClickCancel:(UIBarButtonItem*)sender{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(writeMessageCancel)]) {
            [self.delegate writeMessageCancel];
        }
    }
}

- (void)onClickSend:(UIBarButtonItem*)sender{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(writeMessageSend:)]) {
            [self.delegate writeMessageSend:@{@"text":@"haha"}];
        }
    }
}
@end
