//
//  FileUrl.h
//  东北新闻网
//
//  Created by tenyea on 13-12-24.
//  Copyright (c) 2013年 佐筱猪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUrl : NSObject
//返回cache文件路径
+(NSString *)getCacheFile ;
//返回document文件路径
+ (NSString *)getDocumentsFile;

@end