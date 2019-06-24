//
//  DeviceValue.h
//  YlwlBeaconDemo
//
//  Created by SACRELEE on 16/8/24.
//  Copyright © 2016年 com.YLWL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinewBeaconValue : NSObject

// 获取整形数据
@property (nonatomic, readonly, assign) NSInteger intValue;

// 获取浮点型数据
@property (nonatomic, readonly, assign) float floatValue;

// 获取字符串型数据
@property (nonatomic, readonly, copy) NSString *stringValue;

// 获取16进制data型数据
@property (nonatomic, readonly, strong) NSData  *dataValue;

// 获取bool类型数据
@property (nonatomic, readonly, assign) BOOL boolValue;


@end
