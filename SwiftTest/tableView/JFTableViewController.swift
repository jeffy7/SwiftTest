//
//  JFTableViewController.swift
//  SwiftTest
//
//  Created by je_ffy on 2017/6/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

import UIKit

class JFTableViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource {


    
    var headers = ["A", "B", "C", "D", "E"]
    
    var dataArray = [
                 ["Amy", "Alice", "Antony", "Alexander", "Aaron","Amy", "Alice", "Antony", "Alexander", "Aaron"],
                 ["Bryant", "Black", "Block", "Barry", "Barton","Bryant", "Black", "Block", "Barry", "Barton"],
                 ["Carter", "Cash", "Calvin", "Charles", "Christian","Carter", "Cash", "Calvin", "Charles", "Christian"],
                 ["David", "Dominic", "Dwight", "Devin", "Derrick","David", "Dominic", "Dwight", "Devin", "Derrick"],
                 ["Edison", "Edward", "Elton", "Elvis", "Eric","Edison", "Edward", "Elton", "Elvis", "Eric","Edison", "Edward", "Elton", "Elvis", "Eric","Edison", "Edward", "Elton", "Elvis", "Eric"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let editButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action:#selector(JFTableViewController.pushNextPage))
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.reloadData()


        // Do any additional setup after loading the view.
    }
    func pushNextPage()  {
        self.navigationController?.pushViewController(JFTableSortViewController(), animated: true)
    }
    // MARK: - UITableViewDelagate && UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // MARK: - 索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return headers
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var currentIndex = 0
        //MARK: 遍历索引值
        for character in headers {
            
            //MARK: 判断索引值和组名称是否相等，返回组坐标
            if character == title {
                return currentIndex
            }
            
            currentIndex += 1
        }
        return 0
    }
    
    // MARK: - 左划删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 如果是删除操作
        if editingStyle == .delete {
            // 从数组中移除对应位置的数据
            dataArray[indexPath.section].remove(at: indexPath.row)
            // 删除表格中对应行的数据
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    // MARK: - 左划选项按钮，与左划删除冲突
    /*
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
     
     let like = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "like") { action, index in
     print("You have tapped like button")
     
     }
     like.backgroundColor = UIColor.red
     
     let chat = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "talk") { action, index in
     print("You have tapped chat button")
     }
     chat.backgroundColor = UIColor.blue
     
     let share = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "share") { action, index in
     let activityItem = self.dataArray[indexPath.section][indexPath.row]
     let activityViewController = UIActivityViewController.init(activityItems: [activityItem as String], applicationActivities: nil)
     self.present(activityViewController, animated: true, completion: {
     
     })
     
     }
     share.backgroundColor = UIColor.black
     
     return [share,chat,like]
     }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
