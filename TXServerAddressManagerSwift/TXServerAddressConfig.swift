//
//  TXServerAddressConfig.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 2020/4/18.
//  Copyright © 2020 张雄. All rights reserved.
//

import Foundation

/// 服务器地址配置
class TXServerAddressConfig: TXCopyingProtocol {
    
    /// Run环境
    enum TXSACRunType {
        /// Release环境
        case TXSACRunTypeRelease
        /// DeBug环境
        case TXSACRunTypeDeBug
    }
    
    /**
     定义闭包变量
     var closureName: (ParameterTypes) -> (ReturnType)
     
     定义可选闭包变量
     var closureName: ((ParameterTypes) -> (ReturnType))?
     
     定义闭包别名
     typealias ClosureType = (ParameterTypes) -> (ReturnType)
     
     定义闭包常量
     let closureName: ClosureType = { ... }
     
     在函数内部
     funcName({(ParameterTypes) -> (ReturnType) in statements})
     
     作为函数参数
     array.sort({ (item1: Int, item2: Int) -> Bool in return item1 < item2 })
     
     作为函数参数(隐式参数类型)
     array.sort({ (item1, item2) -> Bool in return item1 < item2 })
     
     作为函数参数(隐式参数类型、隐式返回类型)
     array.sort({ (item1, item2) in return item1 < item2 })
     
     作为函数最后的参数
     array.sort { (item1, item2) in return item1 < item2 }
     
     作为函数最后的参数(使用简略参数命名方式)
     array.sort { return $0 < $1 }
     
     作为函数最后的参数(隐式返回值)
     array.sort { $0 < $1 }
     
     作为函数最后的参数(as a reference to an existing function)
     array.sort(<)
     */
    
    ///
    /// 配置服务器地址闭包
    ///
    /// - Parameters:
    ///   - config: 服务器地址配置.
    ///
    typealias TXConfigServerAddressClosures = (_ config:TXServerAddressConfig) -> Void
    
    /**
     1.open 和 public 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，你会使用 open 或 public 级别来指定框架的外部接口
     2.internal 只在应用程序或框架内部使用
     3.fileprivate 文件内使用
     4.private 当前作用域内使用
     说明1：open 为最高访问级别（限制最少），private 为最低访问级别（限制最多）。
     说明2：open 只能作用于类和类的成员，它和 public 的区别主要在于 open 限定的类和成员能够在模块外能被继承和重写，在下面的 子类 这一节中有详解。将类的访问级别显示指定为 open 表明你已经设计好了类的代码，并且充分考虑过这个类在其他模块中用作父类时的影响。
     */
    
    /// Release环境服务器地址(存储属性并且只能在当前作用域内使用)
    private var releaseSA: TXServerAddress = .init()
    
    /// DeBug环境服务器地址(存储属性并且只能在当前作用域内使用)
    private var deBugSA: TXServerAddress = .init()
    
    /// Release环境服务器地址(计算属性)
    var releaseServerAddress: TXServerAddress {
        get {
            self.releaseSA;
        }
    }
    
    /// DeBug环境服务器地址(计算属性)
    var deBugServerAddress: TXServerAddress {
        get {
            self.deBugSA;
        }
    }
    
    /// Run环境类型(存储属性)
    var runType: TXSACRunType = .TXSACRunTypeRelease
    
    /// 服务器地址(计算属性)
    var serverAddress: String? {
        get {
            if self.runType == .TXSACRunTypeRelease {
                return self.releaseServerAddress.serverAddress
            }else {
                return self.deBugServerAddress.serverAddress
            }
        }
    }
    
    /// 服务器端口(计算属性)
    var serverPort: String? {
        get {
            if self.runType == .TXSACRunTypeRelease {
                return self.releaseServerAddress.serverPort
            }else {
                return self.deBugServerAddress.serverPort
            }
        }
    }
    
    /**
     将一段代码禁用掉而不是通过删掉这段代码有时候是非常方便的。容易想到三种应用场景:
     1.对于一个子类，需要将其父类中的某个或某些方法禁用。
     2.为了保持对低版本或文档的支持而需要保留的老代码。
     3.当你需要创建一个有一个存储型常量属性的对象，需要在实例初始化的时候调用特定的初始化方法完成初始化，
     并且不希望其他使用者调用默认的init方法，因为为常量设置一个默认值是行不通的，这时候你就可以将init方法标记为不可用.
     
     用法：@available(<platform>, unavailable: <version>, message: <message>)
     
     注意: platform 参数的值为 * ，表示任意平台均不可用.unavailable 参数的值为空，表示方法不可用，无论当前是哪个版本.
     */
    
    /// 禁止使用init
    @available (*, unavailable)
    init() {
        
    }
    
    ///
    /// 构造方法
    ///
    /// - Parameters:
    ///   - configServerAddressCompletion: 配置服务器地址回调.
    ///
    init(configServerAddressCompletion: TXConfigServerAddressClosures) {
        configServerAddressCompletion(self)
    }
    
    typealias T = TXServerAddressConfig

    func copy() -> TXServerAddressConfig {
        return self
    }
    
    func mutableCopy() -> TXServerAddressConfig {
        return .init { (config) in
            config.releaseServerAddress.serverAddress = self.releaseServerAddress.serverAddress
            config.releaseServerAddress.serverPort = self.releaseServerAddress.serverPort
            config.deBugServerAddress.serverAddress = self.deBugServerAddress.serverAddress
            config.deBugServerAddress.serverPort = self.deBugServerAddress.serverPort
            config.runType = self.runType
        };
    }
    
}
