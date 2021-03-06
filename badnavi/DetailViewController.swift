//
//  DetailViewController.swift
//  badnavi
//
//  Created by 永田拓也 on 2018/11/22.
//  Copyright © 2018年 Takuya NAGATA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //モーダルを表示する
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "GameSettingNavi")
        self.present(nextVC, animated: false, completion: nil)
    }
    
    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}

