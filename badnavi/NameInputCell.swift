//
//  NameInputCell.swift
//  badnavi
//
//  Created by 笠井　亮吾 on 2019/04/08.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import UIKit

class NameInputCell: UITableViewCell, UITextFieldDelegate {
    ///IBOutlet宣言
    //textfiled
    @IBOutlet weak var nameInputTf:UITextField!
    var selectedTf:UITextField!
    
    //画面初期設定
    func configureView() {
        //初期値設定
        nameInputTf.delegate = self
        
        //プレースホルダの設定
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
        
        //定義
        NotificationCenter.default.addObserver(self, selector: #selector(NameInputCell.textDidChange(notification:)), name: UITextField.textDidChangeNotification, object: nameInputTf)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func textDidChange(notification: NSNotification) {
        selectedTf.text = nameInputTf.text
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
