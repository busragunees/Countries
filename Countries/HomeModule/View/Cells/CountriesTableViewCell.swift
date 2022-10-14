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
        self.saveIconImage.callback = {
            StorageManager.shared.addCountry(item) { CountryEntity in
                
            }
        }
    }
}
