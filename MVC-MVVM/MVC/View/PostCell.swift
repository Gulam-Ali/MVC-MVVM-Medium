//
//  PostCell.swift
//  MVC-MVVM
//
//  Created by Sachin Mittal on 12/07/23.
//

import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
