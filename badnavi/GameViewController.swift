//
//  GameViewController.swift
//  badnavi
//
//  Created by KASAIRYOGO on 2018/12/02.
//  Copyright © 2018年 Takuya NAGATA. All rights reserved.
//

import UIKit

enum BtnType:Int {
    case Left = 10
    case Right = 11
}

//参考URL：http://www.jef-badminton.jp/100monsyu/korunoshikata.html
enum PointAction:Int {
    case Point = 1 //ポイント取得
    case GamePoint = 2 //ゲームポイント：あと1点でゲームの勝敗を決する時
    case GameEnd = 3 //ゲーム終了
    case MatchPoint = 4 //マッチポイント：あと1点で試合そのものの勝敗を決する時
    case MatchEnd = 5 //試合終了
}

class GameViewController: UIViewController {
    ///IBOutlet宣言
    //button
    @IBOutlet weak var rightScoreBtn:UIButton!
    @IBOutlet weak var leftScoreBtn:UIButton!
    //label
    @IBOutlet weak var infoLbl:UILabel!
    @IBOutlet weak var timeLbl:UILabel!
    @IBOutlet weak var rightGameLbl:UILabel!
    @IBOutlet weak var leftGameLbl:UILabel!
    
    ///変数、定数宣言
    //スコア
    var endScore = DEFAULT_SCORE
    var endGameScore = DEFAULT_GAME_SCORE
    //ゲーム種別
    var gameType = GameType.Doubles.rawValue
    //スコア
    var rightScore = 0
    var leftScore = 0
    //ゲーム
    var rightGameScore = 0
    var leftGameScore = 0
    
    /// 画面初期設定
    func configureView() {
        ///スコアボタン設定
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
        
        if tappedButton.tag == leftScoreBtn.tag {
            leftScore += 1
            updateScore = leftScore
        }else{
            rightScore += 1
            updateScore = rightScore
        }
        
        //ボタンの値変更
        tappedButton.setTitle(String(updateScore), for:UIControl.State.normal)
        
        //判定処理（点数毎）
        //別メソッド
        
        
        //判定処理（取得ゲーム数毎）
    }
    
    
    /// ポイント取得時のアクション種別を取得する
    ///
    /// - Returns: ポイント取得時のアクションを返す
    func getPointAction() -> (PointAction){
        
        var pointAction = PointAction.Point
        
        let diff = rightScore - leftScore
        let isDeuce = (diff > 1 || diff < -1)
        
        // 30点か、21点以上で差が2点以上開いている場合はゲーム終了
        let isGameEnd = ((rightScore == 30 || leftScore == 30)
                        || ((rightScore >= 21 || leftScore >= 21) && !isDeuce))
        // 29点か、20点以上で点数差がある場合はゲームポイント
        let isGamePoint = ((rightScore == 29 || leftScore == 29)
            || ((rightScore >= 20 || leftScore >= 20) && (rightScore == leftScore)))
        //試合がもう終わるかどうか。
        let isLastGame = (rightScore == 1 || leftScore == 1)
        
        if isGameEnd && isLastGame {
            pointAction = PointAction.MatchEnd
        }else if isGameEnd && !isLastGame {
            pointAction = PointAction.GameEnd
        }else if isGamePoint && isLastGame {
            pointAction = PointAction.MatchPoint
        }else if isGamePoint && !isLastGame {
            pointAction = PointAction.GamePoint
        }
        
        return pointAction
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

