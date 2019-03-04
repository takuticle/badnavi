//
//  CourtSettingViewController.swift
//  badnavi
//
//  Created by 笠井　亮吾 on 2019/02/12.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import UIKit

class CourtSettingViewController: UIViewController {
    
    func configureView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    /// 戻るボタン押下
    ///
    /// - Parameter sender: ボタン情報
    @IBAction func TapReturn(sender:AnyObject){
        navigationController?.popToRootViewController(animated: true)
    }
}
