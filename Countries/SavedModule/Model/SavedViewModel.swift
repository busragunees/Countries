//
//  SavedViewModel.swift
//  Countries
//
//  Created by Büşra Güneş on 14.10.2022.
//

import Foundation

protocol SavedViewModelProtocol: AnyObject{
    func didCellItemFetch(_ items: [CountryEntity]?)
}

class SavedViewModel{
    
    weak var viewDelegate: SavedViewModelProtocol?
    
    func getCountries(){
        StorageManager.shared.fetchData { result in
                switch result {
                case .success(let list):
                    let items = (list as? [CountryEntity])
                    if let items = items{
                        self.viewDelegate?.didCellItemFetch(items)
                    }
                case .failure(_): break
                }
            }
        }
    }
 



