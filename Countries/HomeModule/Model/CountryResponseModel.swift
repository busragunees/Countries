//
//  CountryModel.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import Foundation

struct CountryResponseModel: Codable {
    var data: [Country]?
}

struct Country: Codable {
    var code: String?
    var currencyCodes: [String]?
    var name: String?
    var wikiDataId: String?
    var isSaved: Bool? = false
    
}
