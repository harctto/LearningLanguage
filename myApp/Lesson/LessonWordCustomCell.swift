//
//  LessonWordCustomCell.swift
//  myApp
//
//  Created by Hatto on 21/6/2564 BE.
//

import UIKit

class LessonWordCustomCell: UITableViewCell {

    @IBOutlet weak var lbWord: UILabel!
    @IBOutlet weak var lbReading: UILabel!
    @IBOutlet weak var lbMeaning: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        contentView.layer.cornerRadius = 20
        contentView.dropShadow(bound: false)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 14, bottom: 0, right: 14))
    }
}
