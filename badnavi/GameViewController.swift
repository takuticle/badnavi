//
//  GameViewController.swift
//  badnavi
//
//  Created by KASAIRYOGO on 2018/12/02.
//  Copyright © 2018年 Takuya NAGATA. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.timestamp!.description
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
//    var detailItem: Event? {
//        didSet {
//            // Update the view.
//            configureView()
//        }
//    }
}

