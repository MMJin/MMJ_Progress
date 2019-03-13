//
//  MJMBProgressHUDTool.h
//  YDCharge
//
//  Created by 金明明 on 2018/2/12.
//  Copyright © 2018年 MMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
//量级更加轻，适合数据量较小
#import "SVProgressHUD.h"
#import <UIKit/UIKit.h>
@interface MJMBProgressHUDTool : NSObject
/*
 *无特效HUD
 */
+(void)HUD_addText:(NSString *)text HUD_addTime:(float)time;
/*
 *无特效BHUD
 */
+(void)HUD_B_addText:(NSString *)text HUD_addTime:(float)time viewController:(UIViewController *)conVC;

+(void)showLoadingviewController:(UIViewController *)conVC;
/*
 *加载动图
 */
+ (void)CustomButtonAction:(UIView *)view imageArr:(NSMutableArray *)imageArr time:(float)duration afterDelay:(float)delay;
@end
