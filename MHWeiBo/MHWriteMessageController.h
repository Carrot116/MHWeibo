//
//  MHWriteMessageController.h
//  MHWeiBo
//
//  Created by carrot on 16/3/15.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MHWriteMessageDelegate <NSObject>

@required
- (void)writeMessageCancel;
- (void)writeMessageSend:(NSDictionary*)dict;

@end

@interface MHWriteMessageController : UIViewController
@property (nonatomic, weak) id<MHWriteMessageDelegate> delegate;
@end
