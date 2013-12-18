//
//  MainViewController.h
//  PetInfo
//
//  Created by 佐筱猪 on 13-11-23.
//  Copyright (c) 2013年 佐筱猪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface MainViewController : BaseViewController <CLLocationManagerDelegate,ASIRequest>{
    //  加载时大图
    UIView *_backgroundView;
    //定位的经纬度
    float _longitude;
    float _latitude;
//引导页scroll
    UIScrollView *_scrollView;
}

@end
