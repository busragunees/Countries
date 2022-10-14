//
//  SavedViewController.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import UIKit

class SavedViewController: UIViewController {
    @IBOutlet weak var savedTableView: UITableView!
    var savedList:[CountryEntity] = []
    var savedCellReuseIdentifier = "savedCellIdentfy"
    
    var viewModel = SavedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedTableView.delegate = self
        savedTableView.dataSource = self
        viewModel.viewDelegate = self
        registerTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getCountries()
    }
    
    private func registerTableView() {
        self.savedTableView.register(.init(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: savedCellReuseIdentifier)
    }
}

extension SavedViewController: SavedViewModelProtocol{
    func didCellItemFetch(_ items: [CountryEntity]?) {
        if let items = items {
            savedList = items
            savedTableView.reloadData()
        }
    }
}

extension SavedViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: savedCellReuseIdentifier) as! SavedTableViewCell
        cell.setItem(item: (savedList[indexPath.row]))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailIdentfy") as! DetailViewController
        detailVC.countryCode = savedList[indexPath.row].code
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
   
}
