//
//  DetailViewModel.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import Foundation

protocol DetailsViewModelProtocol:AnyObject{
    func didCellItemFetch(_ detail: CountryDetail?) //apiye uygun model gelecek
    func showEmptyView()
    func hideEmptyView()
    func showError()
}

class DetailsViewModel{
    
    weak var viewDelegate: DetailsViewModelProtocol?
    
    func getCountryDetails(countryId: String){
        NetworkManager.instance.getCountryDetails(countryId: countryId) { detailResponse in
            self.viewDelegate?.didCellItemFetch(detailResponse?.data)
        } fail: {
        }
    }
}
