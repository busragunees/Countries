//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import Foundation

protocol CountryListViewModelProtocol:AnyObject{
    func didCellItemFetch(_ items: [CountryResponseModel])
    func showEmptyView()
    func hideEmptyView()
}

class CountryListViewModel{
    
    weak var viewDelegate: CountryListViewModelProtocol?
    
    func getCountries() {
        NetworkManager.instance.getCountries { items in
            print("items geliyor mu", items?.data?.count)
            if (items?.data?.count == 0)
            {
                self.viewDelegate?.hideEmptyView()
                self.viewDelegate?.didCellItemFetch(items!)
            }
        } fail: {
            self.viewDelegate?.showEmptyView()
            self.viewDelegate?.showError()
            print("çok hatalay vayy")
        }
    }
  
}
