//
//  Match.swift
//  badnavi
//
//  Created by 永田拓也 on 2019/04/19.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import Foundation

// 試合の状態
enum MatchState {
    case before     // 試合開始前
    case during     // 試合中
    case over       // 試合終了（過去ログ）
    case pause      // 試合中断中（アプリを最小化したとか
    case interval   // 試合中の休憩中
}

class Match {
    var tournamentName:String = ""      // 大会名
    var matchName:String = ""           // 試合名
    var matchStartTime:Date?            // 試合開始日時（試合ナビ画面に移った時間）
    var matchEndTime:Date?              // 試合終了日時（マッチポイントが終わった時間）
    var matchState:MatchState = MatchState.before   // 今の試合の状態
    
    var teamL:Team              // 左チーム
    var teamR:Team              // 右チーム
    var firstSver:Player        // 最初にサーブするプレイヤー
    var firstRcvr:Player        // 最初にレシーブするプレイヤー
    
    var gamesOfMatch:Int8 = 3   // 試合のゲーム数。デフォは3。
    var basePoints:Int8 = 0     // ゲーム開始時のポイント数。デフォは0。
    
    var pointHistories:NSMutableArray?              // ポイント取得履歴の配列を入れる配列。
    private var currentPointHistory:NSMutableArray? // 今のゲームのポイント取得履歴
    var gameHistory:NSMutableArray?                 // ゲーム勝利履歴を入れる配列。
    
    var umpire:Player?          // 主審（将来の拡張用）
    var svJudge:Player?         // サービスジャッジ（将来の拡張用）
    var lineJudge1:Player?      // 線審（将来の拡張用）
    var lineJudge2:Player?
    var lineJudge3:Player?
    var lineJudge4:Player?
    var lineJudge5:Player?
    var lineJudge6:Player?
    var lineJudge7:Player?
    var lineJudge8:Player?
    var lineJudge9:Player?
    var lineJudge10:Player?
    
    var staff1:Player?          // その他お手伝いする人たち（将来の拡張用）
    var staff2:Player?
    var staff3:Player?
    var staff4:Player?
    
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
    
    // 試合開始時に呼ぶメソッド
        // 開始日時を記録したり試合ステータスを変更したりしてくれる
    
    // ほか、試合制御のメソッドをいくらか作る必要がある

}
