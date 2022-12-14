//
//  SavedTableViewCell.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var saveIconImage: UIImageView!{
        didSet {
            self.saveIconImage.tappable = true
        }
    }
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setItem(item: CountryEntity) {
        countryNameLabel.text = item.name
        self.saveIconImage.callback = {
           
        }
    }
}

