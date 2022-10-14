//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import Foundation

protocol HomeViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [Country]?) 
    func showEmptyView()
    func hideEmptyView()
    func showError()
}

class HomeViewModel{
    
    weak var viewDelegate: HomeViewModelProtocol?
    
    func getCountries() {
        NetworkManager.instance.getCountries { countryResponse in // countryResponse: apiden gelen Network man. dan gelen reponse
            print("items yani response geliyor mu", countryResponse?.data?.count)
            if (countryResponse?.data?.isEmpty == false)
            {
            self.viewDelegate?.hideEmptyView()
            self.viewDelegate?.didCellItemFetch(countryResponse?.data)
            }
        }
        fail: {
            self.viewDelegate?.showEmptyView()
            self.viewDelegate?.showError()
            print("data gelmiyor")
        }
    }
}
//-protokoller ile- apiden gelen countryResponse, HomeViewController'a aktarılır.
