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
    private let viewModel = HomeViewModel() //buraya ne vermek mantıklı?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.getCountries()
        
    }
// For tableView delegate and register func
    func setupUI() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        viewModel.viewDelegate = self
        registerTableView()
    }
    private func registerTableView() {
        self.homeTableView.register(.init(nibName: "CountriesTableViewCell", bundle: nil), forCellReuseIdentifier: countryCellReuseIdentifier)
    }
}
extension HomeViewController: HomeViewModelProtocol {
    func didCellItemFetch(_ items: [Country]?) {
        countries = items
        homeTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
}


// TableView functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.storyboard?.instantiateViewController(withIdentifier: "detailIdentfy") as! DetailViewController
        self.navigationController?.pushViewController(cell, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: countryCellReuseIdentifier) as! CountriesTableViewCell
        cell.countryNameLabel.text = countries?[indexPath.row].name
       // cell.backgroundColor = UIColor.white
        return cell
    }
   
}
