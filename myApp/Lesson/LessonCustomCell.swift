//
//  MainCustomCell.swift
//  myApp
//
//  Created by Hatto on 13/6/2564 BE.
//

import UIKit

class LessonCustomCell: UITableViewCell {

    let lbLessonName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lbLessonName.translatesAutoresizingMaskIntoConstraints = false
        lbLessonName.textAlignment = .center
        lbLessonName.textColor = .black
        lbLessonName.font = UIFont.init(name: "Montserrat-Bold", size: 18)

        contentView.addSubview(lbLessonName)
        
        NSLayoutConstraint.activate([
            lbLessonName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lbLessonName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            lbLessonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lbLessonName.heightAnchor.constraint(equalToConstant: 90),
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lbLessonName.backgroundColor = .clear
        contentView.backgroundColor = UIColor.init(rgb: 0xFFF8F5)
        contentView.layer.cornerRadius = 20
        contentView.dropShadow(bound: false)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 14, bottom: 0, right: 14))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
