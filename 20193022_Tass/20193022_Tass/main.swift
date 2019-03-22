//
//  main.swift
//  20193022_Tass
//
//  Created by hyeoktae kwon on 22/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

print("main1.swift")

UIApplicationMain(

CommandLine.argc, UnsafeMutableRawPointer(CommandLine.unsafeArgv)

.bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)), nil, NSStringFromClass(AppDelegate.self)

)

print("main2.swift") // 이거는 실행될 일이 없다. 위에 main은 루프로 돌고있다. event loop
