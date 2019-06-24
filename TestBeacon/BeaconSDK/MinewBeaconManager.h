//
//  DeviceManager.h
//  YlwlBeaconDemo
//
//  Created by SACRELEE on 16/8/24.
//  Copyright © 2016年 com.YLWL. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM( NSInteger, BluetoothState) {
    
    BluetoothStateUnsupported = 0,
    BluetoothStatePowerOn,
    BluetoothStatePowerOff,
    
};

@class MinewBeacon, MinewBeaconManager;


@protocol MinewBeaconManagerDelegate <NSObject>

@optional

// 蓝牙状态改变
- (void)minewBeaconManager:(MinewBeaconManager *)manager didUpdateState:(BluetoothState)state;

// 发现了新的设备
- (void)minewBeaconManager:(MinewBeaconManager * )manager appearBeacons:(NSArray<MinewBeacon *> *)beacons;

// 离开了某个设备的信号范围
- (void)minewBeaconManager:(MinewBeaconManager * )manager disappearBeacons:(NSArray<MinewBeacon *> *)beacons;

// 每1秒回调一次，当前发现的所有设备，用于数据更新等。
- (void)minewBeaconManager:(MinewBeaconManager * )manager didRangeBeacons:(NSArray<MinewBeacon *> * )beacons;

@end


@interface MinewBeaconManager : NSObject

// 单例
+ (MinewBeaconManager  *)sharedInstance;

// 检查蓝牙状态
- (BluetoothState)checkBluetoothState;

// 开始扫描设备
- (void)startScan:(NSArray<NSString *> *)uuids backgroundSupport:(BOOL)enable;

// 停止扫描设备
- (void)stopScan;

// 代理指针
@property ( nonatomic, weak) id<MinewBeaconManagerDelegate> delegate;

// 扫描到的所有设备
@property ( nonatomic, readonly, copy) NSArray<MinewBeacon *> *scannedBeacons;

// 在范围内的设备
@property ( nonatomic, readonly, copy) NSArray<MinewBeacon *> *inRangeBeacons;


@end


