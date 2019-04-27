//
//  Match.swift
//  badnavi
//
//  Created by 永田拓也 on 2019/04/19.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import Foundation

let rarryState_serviceOver = 1

// 試合の状態
enum MatchState {
    case before         // 試合開始前
    case during         // 試合中
    case duringGameP    // 試合中（ゲームポイント）
    case duringMatchP   // 試合中（マッチポイント）
    case over           // 試合終了（過去ログ）
    case suspend        // 試合中断中（アプリを最小化したとか）
    case interval_11    // 休憩中（11点に達したとき）
    case interval_CC    // 休憩中（チェンジコート）
    case interval_etc   // 休憩中（その他）
}

// コート上の位地
enum posOfCourt {
    case LeftUp     // 左上
    case LeftLow    // 左下
    case RightUp    //      右上
    case RightLow   //      右下
}

class Match {
    var tournamentName:String = ""      // 大会名
    var matchName:String = ""           // 試合名
    private var matchStartTime:Date?    // 試合開始日時（試合ナビ画面に移った時間）
    private var matchEndTime:Date?      // 試合終了日時（マッチポイントが終わった時間）
    var matchState:MatchState = MatchState.before   // 今の試合の状態
    
    private var teamL:Team              // 左チーム
    private var teamR:Team              // 右チーム
    private var firstSver:Player        // 最初にサーブするプレイヤー
    private var firstRcvr:Player        // 最初にレシーブするプレイヤー
    
    private var gamesOfMatch:Int8 = 3   // 試合のゲーム数。デフォは3。
    private var basePoints:Int8 = 0     // ゲーム開始時のポイント数。デフォは0。
    
    // ポイント取得履歴の配列を入れる配列。
    private var pointHistories:NSMutableArray?
    private var gameHistory:NSMutableArray?                 // ゲーム勝利履歴を入れる配列。
    
    private var umpire:Player?  // 主審（将来の拡張用）
    private var svJudge:Player?         // サービスジャッジ（将来の拡張用）
    private var lineJudge1:Player?      // 線審（将来の拡張用）
    private var lineJudge2:Player?
    private var lineJudge3:Player?
    private var lineJudge4:Player?
    private var lineJudge5:Player?
    private var lineJudge6:Player?
    private var lineJudge7:Player?
    private var lineJudge8:Player?
    private var lineJudge9:Player?
    private var lineJudge10:Player?
    
    private var staff1:Player?          // その他お手伝いする人たち（将来の拡張用）
    private var staff2:Player?
    private var staff3:Player?
    private var staff4:Player?
    
    // 左チームの点数
    var pointsOfLeft : Int8 {
        return 0        // コンパイルエラー抑止の仮return
    }
    // 右チームの点数
    var pointsOfRight : Int8 {
        return 0        // コンパイルエラー抑止の仮return
    }
    
    // 左チームのゲーム数
    var gameOfLeft : Int8 {
        return 0        // コンパイルエラー抑止の仮return
    }
    
    // 右チームのゲーム数
    var gameOfRight : Int8 {
        return 0        // コンパイルエラー抑止の仮return
    }
    
    // 初期化
    init(tname:String,       mname:String,      tL:Team,    tR:Team,
         firstSver:Player,   firstRcvr:Player,  gamesOfMatch:Int8, basePoints:Int8){
        self.tournamentName = tname
        self.matchName = mname
        self.teamL = tL
        self.teamR = tR
        self.firstSver = firstSver
        self.firstRcvr = firstRcvr
        self.gamesOfMatch = gamesOfMatch
        self.basePoints = basePoints
    }
    
    // 初期化（ゲーム数、ポイント数を指定）
    convenience init(tname:String,       mname:String,      tL:Team,    tR:Team,
                     firstSver:Player,   firstRcvr:Player){
        self.init(tname:tname, mname:mname, tL:tL, tR:tR,
                  firstSver:firstSver, firstRcvr:firstRcvr,
                  gamesOfMatch:3, basePoints:0)
    }
    
    // 左チームがポイント獲得
    func rallyWonByLeft() {
        
    }
    // 右チームがポイント獲得
    func rallyWonByRight() {
        
    }
    
    // 状態を一つもどす処理
    func rollback(){
        
    }
    
    // ゲーム開始（またはインターバル終了）
    func playGame(){
        
    }
    
    // 位置からのプレイヤー情報取得
    func getPlayer(posision:posOfCourt) -> (player:Player, isServicer:Bool) {
        return (self.teamL.player1, true)        // コンパイルエラー抑止の仮return
    }

}
