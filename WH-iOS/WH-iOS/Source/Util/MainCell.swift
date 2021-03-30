//
//  MainCell.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/03/29.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var detailBtn: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var reviewNumLbl: UILabel!
    @IBOutlet weak var recommendBtn:UIButton!
    @IBOutlet weak var heartBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
