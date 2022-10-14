//
//  DetailViewController.swift
//  Countries
//
//  Created by Büşra Güneş on 12.10.2022.
//

import UIKit
import Kingfisher
import SVGKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var viewInfoBtn: UIButton!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var country: CountryDetail?
    private let viewModel = DetailsViewModel()
    var countryCode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        viewModel.getCountryDetails(countryId: countryCode ?? "")
        self.viewInfoBtn.addTarget(self, action: #selector(goToURL), for: .touchUpInside)
    }
    @objc func goToURL(){
        let webKitVC = self.storyboard?.instantiateViewController(withIdentifier: "webKitIdentfy") as! WebKitViewController
        print("https://www.wikidata.org/wiki/\(String(describing: country?.wikiDataId))")
        webKitVC.wikiURL = "https://www.wikidata.org/wiki/\(country?.wikiDataId! ?? "")"
        self.navigationController?.pushViewController(webKitVC, animated: true)
    }
}

extension DetailViewController: DetailsViewModelProtocol {
    func didCellItemFetch(_ detail: CountryDetail?) {
        country = detail
        self.detailImage.kf.setImage(with: URL(string: detail?.flagImageUri ?? ""), options: [.processor(SVGImgProcessor())])
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
