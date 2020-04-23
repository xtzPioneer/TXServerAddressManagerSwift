//
//  TXServerAddressManager.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/19.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

/// 服务器管理器
public class TXServerAddressManager {
    
    /// 全局共享属性
    private static let shared: TXServerAddressManager = {
        let shared:TXServerAddressManager = .init()
        return shared
    }()
    
    /// 服务器配置集合
    public var configs: Dictionary <String,TXServerAddressConfig> = Dictionary <String,TXServerAddressConfig>()
    
    ///
    /// 设置服务器配置集合闭包
    /// - Returns
    ///   服务器配置集合.
    ///
    public typealias TXConfigsServerAddresssClosures = () -> Dictionary <String,TXServerAddressConfig>
    
    ///
    /// 配置服务器地址
    ///
    /// - Parameters:
    ///   - configs: 服务器地址闭包.
    ///
    public class func configsServerAddress(configs: TXConfigsServerAddresssClosures) -> TXServerAddressManager {
        // 闭包捕值
        let dictionary: Dictionary <String,TXServerAddressConfig> = configs()
        // 合并字典
        for (key,value) in dictionary {
            TXServerAddressManager.manager().configs[key] = value
        }
        return TXServerAddressManager.manager()
    }
    
    /// 构造方法(只能在当前作用域内使用)
    private init() {
        
    }
    
    ///
    /// 管理器
    /// - Returns
    ///   服务器管理器.
    ///
    public class func manager() -> TXServerAddressManager {
        return self.shared
    }
    
}
