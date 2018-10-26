//
//  Post.swift
//  swimeeKeijiban
//
//  Created by 張翔 on 2018/10/26.
//  Copyright © 2018 張翔. All rights reserved.
//

import Foundation

//投稿のデータ用のクラス
class Post {
    var name: String //名前
    var comment: String //本文
    var date: Date //投稿日
    
    init(name: String, comment: String, date: Date){
        self.name = name
        self.comment = comment
        self.date = date
    }
}
