//
//  Team.swift
//  badnavi
//
//  Created by 永田拓也 on 2019/04/03.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import Foundation

// 試合開始時に左コートか右コートか
enum Court {
    case leftCourt
    case rightCourt
}

class Team {
    var name : String           // チーム名
    var player1 : Player        // プレイヤ情報
    var player2 : Player?       // シングルスならこっちはnilにする
    
    var isSingles : Bool {        // シングルスかダブルスかを計算して返すプロパティ
        return (self.player2 == nil)
    }
    var isDoubles : Bool {
        return (self.player2 != nil)
    }
    
    // すべての情報を使ってチームを作る
    init(name:String, p1:Player, p2:Player?) {
        self.name = name
        self.player1 = p1
        self.player2 = p2
    }
    
    // 最低限の情報でチームを作る
    convenience init(p1:Player){
        self.init(name:p1.name, p1:p1, p2:nil)
    }
    convenience init(p1:Player, p2:Player){
        self.init(name:p1.name + "&" + p2.name, p1:p1, p2:p2)
    }
}
