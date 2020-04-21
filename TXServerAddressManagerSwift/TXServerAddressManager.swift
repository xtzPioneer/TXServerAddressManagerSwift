//
//  TXServerAddressManager.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/19.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

/// 服务器管理器
class TXServerAddressManager {
    
    /// 全局共享属性
    private static let shared: TXServerAddressManager = {
        let shared:TXServerAddressManager = .init()
        return shared
    }()
    
    /// 服务器配置集合(存储属性并且只能在当前作用域内使用)
    private var serverAddressConfigs: Dictionary <String,TXServerAddressConfig> = Dictionary <String,TXServerAddressConfig>()
    
    /// 服务器配置集合(计算属性)
    var configs: Dictionary <String,TXServerAddressConfig> {
        get {
            return self.serverAddressConfigs
        }
        set {
            self.serverAddressConfigs = newValue
        }
    }
    
    ///
    /// 设置服务器配置集合闭包
    /// - Returns
    ///   服务器配置集合.
    ///
    typealias TXConfigsServerAddresssClosures = () -> Dictionary <String,TXServerAddressConfig>
    
    ///
    /// 配置服务器地址
    ///
    /// - Parameters:
    ///   - configs: 服务器地址闭包.
    ///
    class func configsServerAddress(configs: TXConfigsServerAddresssClosures) -> TXServerAddressManager {
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
    class func manager() -> TXServerAddressManager {
        return self.shared
    }
    
}
