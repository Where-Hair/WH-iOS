//
//  DetailCell.swift
//  WH-iOS
//
//  Created by 문지수 on 2021/05/06.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var heartLbl: UILabel!
    @IBOutlet weak var heartNumLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
