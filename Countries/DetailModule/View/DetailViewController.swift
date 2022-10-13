//
//  DetailViewController.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var viewInfoBtn: UIButton!
    @IBOutlet weak var countryNameLabel: UILabel!

    private let viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        viewModel.getCountryDetails(countryId: "TR")
        //self.viewInfoBtn.addTarget(self, action: #selector(goToURL), for: .touchUpInside)
    }
    @objc func goToURL(){
        let webKitVC = self.storyboard?.instantiateViewController(withIdentifier: "webKitIdentfy") as! WebKitViewController
        self.navigationController?.pushViewController(webKitVC, animated: true)
    }
}

extension DetailViewController: DetailsViewModelProtocol {
    func didCellItemFetch(_ detail: CountryDetail?) {
        self.detailImage.kf.setImage(with: URL(string: detail?.flagImageUri ?? ""))
        self.countryCodeLabel.text = detail?.code
        self.countryNameLabel.text = detail?.name
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func showError() {
        
    }
    
    
}
