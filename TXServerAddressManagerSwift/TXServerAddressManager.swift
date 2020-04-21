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
    
    /// 全局变量
    private static let sharedManager: TXServerAddressManager = {
        let shared:TXServerAddressManager = .init()
        return shared
    }()
    
    /// 服务器配置集合
    var serverAddressConfigs: Dictionary <String,TXServerAddressConfig> = Dictionary <String,TXServerAddressConfig>()
    
    /// 构造方法(只能在当前作用域内使用)
    private init() {
        
    }
    
    ///
    /// 管理器
    /// - Returns
    ///   服务器管理器.
    ///
    class func manager() -> TXServerAddressManager {
        return self.sharedManager
    }
    
}
