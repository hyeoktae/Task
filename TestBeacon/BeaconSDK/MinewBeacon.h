//
//  Device.h
//  YlwlBeaconDemo
//
//  Created by SACRELEE on 16/8/24.
//  Copyright © 2016年 com.YLWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MinewBeaconValue.h"

typedef NS_ENUM(NSInteger, BeaconValueIndex) {
    BeaconValueIndex_UUID = 1,      // UUID stringValue
    BeaconValueIndex_Major,         // major intValue
    BeaconValueIndex_Minor,         // minor intValue
    BeaconValueIndex_Name,          // 设备名称 stringValue
    BeaconValueIndex_WechatId,      // 微信设备id  intValue
    BeaconValueIndex_Mac,           // Mac Address stringValue
    BeaconValueIndex_RSSI,          // RSSI intValue
    BeaconValueIndex_BatteryLevel,  // 电池电量 intValue
    BeaconValueIndex_Temperature,   // 温度 floatValue
    BeaconValueIndex_Humidity,      // 湿度 floatValue
    BeaconValueIndex_TxPower,       // TxPower intValue
    BeaconValueIndex_InRage,        // 是否在范围内 boolValue
    BeaconValueIndex_Connectable,   // 可连接状态 boolValue
};


@interface MinewBeacon : NSObject

- (MinewBeaconValue *)getBeaconValue:(BeaconValueIndex)index;

@end
