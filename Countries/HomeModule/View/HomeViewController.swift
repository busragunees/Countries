//
//  HomeViewController.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeTableView: UITableView!
    private let countryCellReuseIdentifier = "countryTableViewCell"
    private var countries: [Country]? = []
    private let viewModel = HomeViewModel()
    private let savedViewModel = SavedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        viewModel.getCountries()
    }
    
// For tableView delegate and register func
    func setupUI() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        viewModel.viewDelegate = self
        savedViewModel.viewDelegate = self
        registerTableView()
    }
    private func registerTableView() {
        self.homeTableView.register(.init(nibName: "CountriesTableViewCell", bundle: nil), forCellReuseIdentifier: countryCellReuseIdentifier)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func didCellItemFetch(_ items: [Country]?) {
        countries = items
        savedViewModel.getCountries()
        homeTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}

extension HomeViewController: SavedViewModelProtocol{
    func didFecthCountriesFromDB(_ items: [CountryEntity]?) {
        if let countries = countries, let items = items{
            for (index, item) in countries.enumerated(){
                if ((items.contains(where: {
                    $0.code == item.code
                }))){
                    self.countries?[index].isSaved = true
                }
            }
        }
        homeTableView.reloadData()
    }
}

// TableView functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailIdentfy") as! DetailViewController
        detailVC.countryCode = countries?[indexPath.row].code
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: countryCellReuseIdentifier) as! CountriesTableViewCell
        let item = (countries?[indexPath.row])!
        cell.setItem(item: item)
        cell.saveIconImage.callback = {
            if item.isSaved == true {
                StorageManager.shared.deleteCountry(item: item)
                self.countries?[indexPath.row].isSaved = false
            }else{
                StorageManager.shared.addCountry(item) { item in
                    self.countries?[indexPath.row].isSaved = true
                }
            }
            tableView.reloadData()
        }
        return cell
    }
}
