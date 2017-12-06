//
//  ViewController.swift
//  Project2
//
//  Created by iKnet on 16/7/5.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontIndex = 0

    @IBOutlet weak var textTab: UITableView!
    @IBOutlet weak var changeFontBtn: UIButton!
    
    
    @IBAction func changeFont(sender: AnyObject) {
        
        fontIndex = (fontIndex + 1)%3
        textTab.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTab.delegate = self
        textTab.dataSource = self
        
        //设置cell不可点击
        textTab.allowsSelection = false
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                print(font)
            }
        }
        
        changeFontBtn.layer.cornerRadius = 55
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = textTab.dequeueReusableCellWithIdentifier("FontCell",forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex],size: 16)
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

    
}
