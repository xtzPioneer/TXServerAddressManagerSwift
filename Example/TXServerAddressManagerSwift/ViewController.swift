//
//  ViewController.swift
//  TXServerAddressManagerSwift
//
//  Created by 张雄 on 04/22/2020.
//  Copyright (c) 2020 张雄. All rights reserved.
//

import UIKit
import TXServerAddressManagerSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager:TXServerAddressManager = .configsServerAddress(configs: { () -> Dictionary<String, TXServerAddressConfig> in
            
            var serverAddressConfigs:Dictionary <String,TXServerAddressConfig> = Dictionary <String,TXServerAddressConfig>()
            
            let serverAddressConfig1:TXServerAddressConfig = .init(configServerAddressCompletion: { (config) in
                config.releaseServerAddress.serverAddress = "http:www.baidu.com"
                config.releaseServerAddress.serverPort = "8080"
                config.deBugServerAddress.serverAddress = "192.168.1.198"
                config.deBugServerAddress.serverPort = "80"
                config.runType = .TXSACRunTypeRelease
            })
            
            let serverAddressConfig2:TXServerAddressConfig = serverAddressConfig1.mutableCopy()
            serverAddressConfig2.runType = .TXSACRunTypeDeBug
            
            serverAddressConfigs["test1"] = serverAddressConfig1
            serverAddressConfigs["test2"] = serverAddressConfig2
            
            return serverAddressConfigs
        })

        print("test1:\(manager.configs["test1"]?.serverAddress ?? "无值")")
        print("test2:\(manager.configs["test2"]?.serverAddress ?? "无值")")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
