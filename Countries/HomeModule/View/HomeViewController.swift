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
    private var items: [CountryCellViewModel] = []
    private let viewModel = CountryListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
// For tableView delegate and register func
    func setupUI() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
       // viewModel.viewDelegate = self
        registerTableView()
    }
    private func registerTableView() {
        self.homeTableView.register(.init(nibName: "CountriesTableViewCell", bundle: nil), forCellReuseIdentifier: countryCellReuseIdentifier)
    }
}

// TableView functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: countryCellReuseIdentifier) as! CountriesTableViewCell
        cell.countryNameLabel.text = items[indexPath.row]
        return cell
    }
}
