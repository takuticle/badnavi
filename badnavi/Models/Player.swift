//
//  Player.swift
//  badnavi
//
//  Created by 永田拓也 on 2019/04/03.
//  Copyright © 2019 Takuya NAGATA. All rights reserved.
//

import Foundation

enum Gender {
    case male
    case female
    case noteither
}

class Player {
    var name : String
    var gender : Gender
    var belongs :String?
    
    // 初期化。すべての値を設定。
    init(name:String, gender:Gender, belongs:String){
        self.name = name
        self.gender = gender
        self.belongs = belongs
    }

    // 名前と性別を指定した初期化。convenience をつけると、上のinitを内部で呼ぶ便利化initが用意できる。
    convenience init(name:String, gender:Gender){
        self.init(name:name, gender:gender, belongs:"")
    }
    
    convenience init(name:String) {
        self.init(name:name, gender:Gender.noteither, belongs:"")
    }
    
}
