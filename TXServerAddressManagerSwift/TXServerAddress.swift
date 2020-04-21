//
//  TXServerAddress.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/16.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

/// 服务器地址 
class TXServerAddress: TXCopyingProtocol {
    
    /// 服务器地址(存储属性)
    var serverAddress: String?
    
    /// 服务器端口(存储属性)
    var serverPort: String?
    
    /// 构造方法1
    init() {
        
    }
    
    /*
    convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
    便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
    便利构造函数的特点：
    1、便利构造函数通常都是写在extension里面
    2、便利函数init前面需要加载convenience
    3、在便利构造函数中需要明确的调用self.init()
    */
    
    ///
    /// 构造方法2
    ///
    /// - Parameters:
    ///   - serverAddress: 服务器地址.
    ///   - serverPort:服务器端口.
    ///
    convenience init(serverAddress: String?,serverPort: String?) {
        self.init()
        self.serverAddress = serverAddress
        self.serverPort = serverPort
    }
    
    typealias T = TXServerAddress
    
    func copy() -> T {
        return self
    }

    func mutableCopy() -> T {
        return .init(serverAddress: self.serverAddress, serverPort: self.serverPort)
    }
    
}
