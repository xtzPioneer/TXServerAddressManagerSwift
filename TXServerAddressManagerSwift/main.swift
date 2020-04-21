//
//  main.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/16.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

let serverAddressConfig1:TXServerAddressConfig = .init(configServerAddressCompletion: { (config) in
    config.releaseServerAddress.serverAddress = "mac.xtz.kim"
    config.releaseServerAddress.serverPort = "8080"
    config.deBugServerAddress.serverAddress = "192.168.1.115"
    config.deBugServerAddress.serverPort = "80"
    config.runType = .TXSACRunTypeRelease
})

let serverAddressConfig2:TXServerAddressConfig = serverAddressConfig1.mutableCopy();

print("serverAddressConfig1内存地址:\(Unmanaged.passUnretained(serverAddressConfig1 as AnyObject).toOpaque())")
print("serverAddressConfig2内存地址:\(Unmanaged.passUnretained(serverAddressConfig2 as AnyObject).toOpaque())")

serverAddressConfig1.runType = .TXSACRunTypeDeBug
serverAddressConfig2.runType = .TXSACRunTypeRelease

print("serverAddressConfig1:\(serverAddressConfig1.serverAddress ?? "无服务器地址")")
print("serverAddressConfig1:\(serverAddressConfig1.serverPort ?? "无服务器端口")")

print("serverAddressConfig2:\(serverAddressConfig2.serverAddress ?? "无服务器地址")")
print("serverAddressConfig2:\(serverAddressConfig2.serverPort ?? "无服务器端口")")

var manager1: TXServerAddressManager = .manager()

manager1.serverAddressConfigs["test1"] = serverAddressConfig1
manager1.serverAddressConfigs["test2"] = serverAddressConfig2

var manager2:TXServerAddressManager = .manager()

print("TXServerAddressManager内存地址:\(Unmanaged.passUnretained(manager1 as AnyObject).toOpaque())")
print("TXServerAddressManager内存地址:\(Unmanaged.passUnretained(manager2 as AnyObject).toOpaque())")

print("test1:\(manager2.serverAddressConfigs["test1"]?.serverAddress ?? "没有值")")
print("test2:\(manager2.serverAddressConfigs["test2"]?.serverAddress ?? "没有值")")





