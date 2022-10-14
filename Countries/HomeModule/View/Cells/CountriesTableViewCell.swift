//
//  CountriesTableViewCell.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    @IBOutlet weak var saveIconImage: UIImageView!{
        didSet {
            self.saveIconImage.tappable = true
        }
    }
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(item: Country) {
        countryNameLabel.text = item.name
        if item.isSaved == true {
            saveIconImage.image = UIImage(named: "icn_like_active")
        }else{
            saveIconImage.image = UIImage(named: "icn_like")
        }
    }
}


/*StorageManager.shared.addCountry(item) { CountryEntity in
}*/
