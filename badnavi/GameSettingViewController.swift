//
//  GameSettingViewController.swift
//  badnavi
//
//  Created by 笠井　亮吾 on 2019/02/12.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import UIKit

//デフォルト値
let DEFAULT_SCORE = 21
let DEFAULT_GAME_SCORE = 3
let DEFAULT_GAME_TYPE = GameType.Doubles.rawValue

enum GameType:Int {
    case Singles = 0
    case Doubles = 1
}

class GameSettingViewController: UIViewController {
    
    ///IBOutlet宣言
    //textfield
    @IBOutlet weak var scoreTf:UITextField!
    @IBOutlet weak var gameTf:UITextField!
    //segmentedcontroller
    @IBOutlet weak var gameTypeSc:UISegmentedControl!
    //stepper
    @IBOutlet weak var gameSt:UIStepper!
    @IBOutlet weak var scoreSt:UIStepper!
    
    ///変数、定数宣言
    //スコア
    var score = DEFAULT_SCORE
    var gameScore = DEFAULT_GAME_SCORE
    //ゲーム種別
    var gameType = GameType.Doubles.rawValue
    
    /// 画面初期設定
    func configureView() {
        ///デフォルト値の設定
        //コートタイプ
        gameTypeSc.selectedSegmentIndex = GameType.Doubles.rawValue
        //スコア数
        scoreTf.text = String(score)
        scoreTf.isUserInteractionEnabled = false
        scoreSt.value = Double(score)
        //ゲーム数
        gameTf.text = String(gameScore)
        gameTf.isUserInteractionEnabled = false
        gameSt.value = Double(gameScore)
        //サーブコートボタン
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    /// セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? CourtSettingViewController
        let _ = next?.view
        next?.gameType = gameType
        next?.gameScore = gameScore
        next?.score = score
        next?.configureView()
    }
    
    /// ゲーム種別ボタン押下
    ///
    /// - Parameter sender: 部品情報
    @IBAction func tapCourtTypeSc( sc: UISegmentedControl) {
        print(sc.selectedSegmentIndex)
        gameType = sc.selectedSegmentIndex
    }
    
    /// ステッパー押下
    ///
    /// - Parameter sender: 部品情報
    @IBAction func tapStepper( stepper: UIStepper) {
        if stepper.tag == gameSt.tag {
            gameScore = Int(stepper.value)
            gameTf.text = String(gameScore)
        }else {
            score = Int(stepper.value)
            scoreTf.text = String(score)
        }
    }
}
