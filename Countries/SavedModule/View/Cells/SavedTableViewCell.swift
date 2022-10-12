//
//  SavedTableViewCell.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
    @IBOutlet weak var saveIconImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
