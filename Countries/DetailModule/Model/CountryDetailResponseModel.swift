//
//  CountryDetailResponseModel.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import Foundation

struct CountryDetailResponseModel: Codable {
    var data:CountryDetail?
}

struct CountryDetail: Codable {
    var name:String?
    var flagImageUri:String?
    var wikiDataId:String?
    var code:String?
}

