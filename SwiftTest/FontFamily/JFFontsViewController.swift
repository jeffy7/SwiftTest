//
//  JFFontsViewController.swift
//  SwiftTest
//
//  Created by je_ffy on 2017/6/15.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

import UIKit

class JFFontsViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource {

    var someInts = [Int]()
    var dataArray  = [Array<Any>]()

    var cellFontName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - PrepareData
        for familyName in UIFont.familyNames {
            var array : [String] = [String]()
            print("familtName ============== ",familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                array.append(fontName)
                
                print("\nfontName = ",fontName)
                
            }
            dataArray.append(array)
        }
        
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray[section] as AnyObject).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row] as? String
        cell.textLabel?.font = UIFont(name: cellFontName, size: 14)
    
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellFontName = dataArray[indexPath.section][indexPath.row] as! String
        
        print(cellFontName)
        
        tableView.reloadData()
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
