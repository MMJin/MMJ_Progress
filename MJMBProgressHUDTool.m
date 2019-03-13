//
//  MJMBProgressHUDTool.m
//  YDCharge
//
//  Created by 金明明 on 2018/2/12.
//  Copyright © 2018年 MMJ. All rights reserved.
//

#import "MJMBProgressHUDTool.h"

@interface MJMBProgressHUDTool()<MBProgressHUDDelegate>
@property(nonatomic,strong)MBProgressHUD*HUD;
@end

@implementation MJMBProgressHUDTool
+(void)HUD_addText:(NSString *)text HUD_addTime:(float)time{
//加圆
    [SVProgressHUD showWithStatus:text];
//GCD 的延迟方法 类方法里不能使用对象调方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}
+(void)HUD_B_addText:(NSString *)text HUD_addTime:(float)time viewController:(UIViewController *)conVC {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:conVC.view];
    HUD.contentColor=[UIColor whiteColor];
    HUD.bezelView.color=[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];
    HUD.mode=MBProgressHUDModeText;
    HUD.label.text=text;
    HUD.removeFromSuperViewOnHide=YES;
    [conVC.view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:1];
}
+(void)showLoadingviewController:(UIViewController *)conVC
{
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:conVC.view];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.contentColor=[UIColor whiteColor];
    HUD.label.text=@"正在加载";
    HUD.removeFromSuperViewOnHide=YES;
    [conVC.view addSubview:HUD];
    [HUD showAnimated:YES];
  //模拟加载状态
    [HUD hideAnimated:YES afterDelay:1];
}
/*
 *HUD自定义动图实现，需要图片名称的数组。
 */
//   自定义 动图
+ (void)CustomButtonAction:(UIView *)view imageArr:(NSMutableArray *)imageArr time:(float)duration afterDelay:(float)delay{

    //自定义view
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = @"加载中。。。";
    //取消背景框
    HUD.backgroundColor = [UIColor clearColor];
    HUD.color = [UIColor clearColor];
    
    [view addSubview:HUD];
    
    UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
    
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < imageArr.count ; i++){
        NSString *imgName = [NSString stringWithFormat:@"%@",imageArr[i]];
        
        [imageArray addObject:[UIImage imageNamed:imgName]];
    }
    
    images.animationDuration = duration;
    
    images.animationImages = imageArray;
    // 开始播放
    [images startAnimating];
    
     __weak typeof(self)weakself = self;
    //自定义
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.delegate = weakself;
    
    HUD.customView = images;
    
    [HUD showAnimated:YES];
    //延迟
    [HUD hideAnimated:YES afterDelay:delay];
    
}


@end
