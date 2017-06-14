//
//  JFTableSortViewController.swift
//  SwiftTest
//
//  Created by je_ffy on 2017/6/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

import UIKit

class JFTableSortViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray :Array = ["Amy", "Alice"]
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TableViewEdit"
        let editButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action:#selector(self.editTableView))
        self.navigationItem.rightBarButtonItem = editButtonItem
        
        tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    func editTableView()  {
        tableView.isEditing = !tableView.isEditing
    }
    // MARK: - UITableViewDelagate && UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        
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

    // MARK: -
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 如果是删除操作
        if editingStyle == .delete {
            // 从数组中移除对应位置的数据
            dataArray.remove(at: indexPath.row)
            // 删除表格中对应行的数据
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }

    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //移动数据源
        let sourceItem = dataArray[sourceIndexPath.row]
        
        dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(sourceItem, at: destinationIndexPath.row)
        print(dataArray)
        
    }
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
