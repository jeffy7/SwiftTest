//
//  JFTabBarController.swift
//  SwiftTest
//
//  Created by je_ffy on 2018/12/5.
//  Copyright © 2018年 je_ffy. All rights reserved.
//

import UIKit

class JFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let v1  = JFUINavigationController.init(rootViewController: ViewController())
        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(named: "home_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal))
        v1.tabBarItem = item1
        
        let v2 = JFUINavigationController.init(rootViewController: JFFontsViewController())
        let item2 : UITabBarItem = UITabBarItem (title: "筛选", image: UIImage(named: "search_normal")?.withRenderingMode(.alwaysOriginal
            ), selectedImage: UIImage(named: "search_selected")?.withRenderingMode(.alwaysOriginal))
        v2.tabBarItem = item2
        
        let v3 = JFUINavigationController.init(rootViewController: JFTestViewController())
        let item3 : UITabBarItem = UITabBarItem (title: "收藏", image: UIImage(named: "collect_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "collect_selected")?.withRenderingMode(.alwaysOriginal))
        v3.tabBarItem = item3
        
        let v4 = JFUINavigationController.init(rootViewController: JFTestViewController())
        let item4 : UITabBarItem = UITabBarItem (title: "我", image: UIImage(named: "mine_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "mine_selected")?.withRenderingMode(.alwaysOriginal   ))
        v4.tabBarItem = item4
        
        let tabArray = [v1, v2, v3, v4]
        self.viewControllers = tabArray
        
    
        
        
//        let viewController = JFUINavigationController.init(rootViewController: ViewController())
//        let qqqqqqqqq = JFUINavigationController.init(rootViewController: JFFontsViewController())
//        let viewController2 = JFUINavigationController.init(rootViewController: JFTestViewController())



        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
