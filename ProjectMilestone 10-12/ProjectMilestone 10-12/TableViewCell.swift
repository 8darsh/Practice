//
//  TableViewCell.swift
//  ProjectMilestone 10-12
//
//  Created by Adarsh Singh on 09/09/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var imgLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
