//
//  CustomTableViewCell.swift
//  swimeeKeijiban
//
//  Created by 張翔 on 2018/10/26.
//  Copyright © 2018 張翔. All rights reserved.
//

import UIKit

//投稿を表示するためのカスタムセル
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel! //名前表示用Label
    @IBOutlet var commentLabel: UILabel! //本文表示用Label
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
