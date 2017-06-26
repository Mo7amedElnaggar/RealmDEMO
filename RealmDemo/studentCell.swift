//
//  studentCell.swift
//  RealmDemo
//
//  Created by Mohamed El-Naggar on 6/26/17.
//  Copyright © 2017 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class studentCell: UITableViewCell {
    
    var student: Student? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var imageViewStudent: UIImageView!

    @IBOutlet weak var fullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        makeImageViewCircle()
        self.selectionStyle = .none
    }
    
    private func updateCell() {
        fullName.text = student!.fullName
        //email.text = student!.mail
    }
    
    private func makeImageViewCircle() {
        
        imageViewStudent.layer.borderWidth = 0
        imageViewStudent.layer.masksToBounds = false
        imageViewStudent.layer.borderColor = UIColor.clear.cgColor
        imageViewStudent.layer.cornerRadius = self.imageViewStudent.bounds.width / 2.0
        imageViewStudent.clipsToBounds = true
        
    }
}










