//
//  CountriesTableViewCell.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    @IBOutlet weak var saveIconImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setItem(item: CountryResponseModel) {
        //countryNameLabel.text = item.data?.name
    }
}
