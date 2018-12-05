//
//  ViewController.swift
//  SwiftTest
//
//  Created by je_ffy on 2017/6/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let dataArray = [(titleName: "TableView", controllerName: "JFTableViewController"),
                     (titleName: "Fonts", controllerName: "JFFontsViewController"),
                     (titleName: "Test", controllerName: "JFTestViewController")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.view.addSubview(tableView)
        tableView.reloadData()
        
        
    }
    // MARk: - UITableViewDelagate && UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = dataArray[indexPath.row]
        
        cell.textLabel?.text = dic.titleName;
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = dataArray[indexPath.row]
        guard  let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return
        }
        guard let classfullName = NSClassFromString(nameSpace + "." + dic.controllerName) else {
            return
        }
        guard let childVC = classfullName as? UIViewController.Type else {
            return
        }
        
        let childVCtroller = childVC.init();
        childVCtroller.title = dic.titleName
        self.navigationController?.pushViewController(childVCtroller, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

