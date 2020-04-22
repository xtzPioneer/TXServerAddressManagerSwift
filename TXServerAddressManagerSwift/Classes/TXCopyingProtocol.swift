//
//  TXCopying.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/18.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

/// 复制协议
public protocol TXCopyingProtocol {
    
    /// 关联类型
    associatedtype T
    
    ///
    /// 浅复制
    /// 
    /// - Returns
    ///   关联类型
    ///
    func copy() -> T
    
    ///
    /// 浅复制
    ///
    /// - Returns
    ///   关联类型
    ///
    func mutableCopy() -> T
    
}

