//
//  CourtSettingViewController.swift
//  badnavi
//
//  Created by 笠井　亮吾 on 2019/02/12.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import UIKit

enum ServeCourt:Int {
    case Right = 1
    case Left = 2
}

let SERVE_SELECT = "●";
let SERVE_UNSELECT = "○";

class CourtSettingViewController: UIViewController, UITextFieldDelegate {
    
    ///IBOutlet宣言
    //textfiled
    @IBOutlet weak var nameLeftTopTf:UITextField!
    @IBOutlet weak var nameLeftMiddleTf:UITextField!
    @IBOutlet weak var nameLeftBottomTf:UITextField!
    @IBOutlet weak var nameRightTopTf:UITextField!
    @IBOutlet weak var nameRightMiddleTf:UITextField!
    @IBOutlet weak var nameRightBottomTf:UITextField!
    //button
    @IBOutlet weak var courtChangeBtn:UIButton!
    @IBOutlet weak var leftServeBtn:UIButton!
    @IBOutlet weak var rightServeBtn:UIButton!
    //imageview
    @IBOutlet weak var courtIv:UIImageView!
    
    ///変数、定数宣言
    //スコア
    var score = DEFAULT_SCORE
    var gameScore = DEFAULT_GAME_SCORE
    //ゲーム種別
    var gameType = GameType.Doubles.rawValue
    //サーブコート
    var isServeLeft = true;
    
    /// 画面初期設定
    func configureView() {
        ///コート表示設定
        let isDoubles = (gameType == GameType.Doubles.rawValue)
        //名前
        nameLeftTopTf.isHidden = !isDoubles
        nameLeftTopTf.delegate = self
        nameLeftMiddleTf.isHidden = isDoubles
        nameLeftMiddleTf.delegate = self
        nameLeftBottomTf.isHidden = !isDoubles
        nameLeftBottomTf.delegate = self
        nameRightTopTf.isHidden = !isDoubles
        nameRightTopTf.delegate = self
        nameRightMiddleTf.isHidden = isDoubles
        nameRightMiddleTf.delegate = self
        nameRightBottomTf.isHidden = !isDoubles
        nameRightBottomTf.delegate = self
        //コート画像
        let courtImageName = (isDoubles ? "DoublesCourt.png" : "SinglesCourt.png")
        courtIv.image = UIImage(named: courtImageName)
        
        //サーブボタン
        leftServeBtn.setTitle(SERVE_SELECT, for:UIControl.State.normal)
        rightServeBtn.setTitle(SERVE_UNSELECT, for:UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    
    // MARK: - Action
    
    /// コートチェンジボタン押下
    ///
    /// - Parameter sender: 部品情報
    @IBAction func tapCourtChangeBtn(btn:UIButton){
        
        if gameType == GameType.Doubles.rawValue {
            let beforeNameLeftTop = nameLeftTopTf.text
            let beforeNameBottomTop = nameLeftBottomTf.text
            nameLeftTopTf.text = nameRightTopTf.text
            nameLeftBottomTf.text = nameRightBottomTf.text
            nameRightTopTf.text = beforeNameLeftTop
            nameRightBottomTf.text = beforeNameBottomTop
        }else{
            let beforeNameLeftMiddle = nameLeftMiddleTf.text
            nameLeftMiddleTf.text = nameRightMiddleTf.text
            nameRightMiddleTf.text = beforeNameLeftMiddle
        }
    }
    
    /// サーブ設定ボタン押下
    ///
    /// - Parameter sender: 部品情報
    @IBAction func tapServeBtn(btn:UIButton){
        
        isServeLeft = (btn.tag == leftServeBtn.tag)
        leftServeBtn.setTitle((isServeLeft ? SERVE_SELECT:SERVE_UNSELECT), for:UIControl.State.normal)
        rightServeBtn.setTitle((!isServeLeft ? SERVE_SELECT:SERVE_UNSELECT), for:UIControl.State.normal)
    }
    
    // MARK: - Delgate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        //選手名設定画面に遷移する
        let nameInputViewController = self.storyboard?.instantiateViewController(withIdentifier: "NameInputViewController") as! NameInputViewController
        nameInputViewController.selectedTf = textField
        self.navigationController?.pushViewController(nameInputViewController, animated: true)
        
        // TextFieldの編集を開始させない
        return false
    }
}
