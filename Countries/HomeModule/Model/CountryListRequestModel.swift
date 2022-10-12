//
//  CountryListRequestModel.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import Foundation

struct CountryListRequestModel: Codable {
    var limit: String?
    
    init(limit: String? = nil) {
        self.limit = limit
    }
}
