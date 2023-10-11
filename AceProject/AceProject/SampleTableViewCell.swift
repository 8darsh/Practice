//
//  SampleTableViewCell.swift
//  AceProject
//
//  Created by Adarsh Singh on 11/10/23.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
