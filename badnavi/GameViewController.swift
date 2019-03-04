//
//  GameViewController.swift
//  badnavi
//
//  Created by KASAIRYOGO on 2018/12/02.
//  Copyright © 2018年 Takuya NAGATA. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    enum BtnType:Int {
        case BtnTypeLeft = 10
        case BtnTypeRight = 11
    }

    //宣言
    //ボタン
    @IBOutlet weak var rightScoreBtn:UIButton!
    @IBOutlet weak var leftScoreBtn:UIButton!
    
    //ラベル
    @IBOutlet weak var infoLbl:UILabel!
    @IBOutlet weak var timeLbl:UILabel!
    @IBOutlet weak var rightGameLbl:UILabel!
    @IBOutlet weak var leftGameLbl:UILabel!
    
    //スコア
    var rightScore = 0
    var leftScore = 0
    
    //ゲーム
    var rightGameScore = 0
    var leftGameScore = 0
    
    /// 画面初期設定
    func configureView() {
        ///スコアボタン設定
        //タグ設定
        rightScoreBtn.tag = BtnType.BtnTypeRight.rawValue
        leftScoreBtn.tag = BtnType.BtnTypeLeft.rawValue
        
        //ボタンのタイトル設定
        rightScoreBtn.setTitle("0", for:UIControl.State.normal)
        leftScoreBtn.setTitle("0", for:UIControl.State.normal)
        
        ///ゲームラベル設定
        rightGameLbl.text = "0"
        leftGameLbl.text = "0"
        
        ///情報ラベル設定
        infoLbl.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    // MARK: - Action
    
    /// スコアボタン押下
    ///
    /// - Parameter sender: ボタン情報
    @IBAction func TapScore(sender:AnyObject) {
        let tappedButton:UIButton = sender as! UIButton
        
        var updateScore = 0
        
        if tappedButton.tag == BtnType.BtnTypeLeft.rawValue {
            leftScore += 1
            updateScore = leftScore
        }else{
            rightScore += 1
            updateScore = rightScore
        }
        
        //ボタンの値変更
        tappedButton.setTitle(String(updateScore), for:UIControl.State.normal)
        
        //判定処理（点数毎）
        
        //判定処理（取得ゲーム数毎）
    }
    
    /// 戻るボタン押下
    ///
    /// - Parameter sender: ボタン情報
    @IBAction func TapReturn(sender:AnyObject){
        //一個前の値に戻す
        
        
    }
    
    /// ゲームリセットボタン押下
    ///
    /// - Parameter sender: ボタン情報
    @IBAction func TapReset(sender:AnyObject){
        //暫定
        rightScore = 0
        leftScore = 0
        navigationController?.popToRootViewController(animated: true)
        
        
        //確認アラートを表示する
        
        //アラートにてOKが押されたら、ゲーム設定画面に遷移する。
        
    }
}

