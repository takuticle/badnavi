//
//  Team.swift
//  badnavi
//
//  Created by 永田拓也 on 2019/04/03.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import Foundation

// 試合開始時にサーバーかレシーバーかの定義
enum SorR {
    case server
    case receiver
}

// 試合開始時に左コートか右コートか
enum Court {
    case leftCourt
    case rightCourt
}

class Team {
    var name : String           // チーム名
    var player1 : Player        // プレイヤ情報
    var player2 : Player?       // シングルスならこっちはnilにする
    var sor : SorR              // 最初がサーバーかレシーバーか。えいやー。
    var court : Court           // 最初のコート位置（左右）
    
    var isSingles : Bool {        // シングルスかダブルスかを計算して返すプロパティ
        return (self.player2 == nil)
    }
    var isDoubles : Bool {
        return (self.player2 != nil)
    }
    
    var fstServer : Bool {
        return (self.sor == SorR.server)
    }
    var fstReceiver : Bool {
        return (self.sor == SorR.receiver)
    }
    
    var fstLeftCourt : Bool {
        return (self.court == Court.leftCourt)
    }
    var fstRightCourt : Bool {
        return (self.court == Court.rightCourt)
    }
    
    // すべての情報を使ってチームを作る
    init(name:String, p1:Player, p2:Player?, first:SorR, court:Court) {
        self.name = name
        self.player1 = p1
        self.player2 = p2
        self.sor = first
        self.court = court
    }
    
    // 最低限の情報でチームを作る
    convenience init(p1:Player, first:SorR, court:Court){
        self.init(name:p1.name, p1:p1, p2:nil, first:first, court:court)
    }
}
