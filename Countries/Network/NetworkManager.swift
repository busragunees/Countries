//
//  NetworkManager.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let instance = NetworkManager()
    
    let headers : HTTPHeaders = [
        "Accept": "*/*",
        "User-Agent": "Mozilla/5.0 (compatible; Rigor/1.0.0; http://rigor.com)",
        "X-RapidAPI-Key": "17587e2df3msh770e3ef00f6c673p11e429jsn25b252c89814",
        "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
    ]
    //Alamofire generic olarak fetch edilir.
    public func fetch<T:Codable,R:Encodable> (_ method: HTTPMethod, url: String, requestModel: R?, model: T.Type, completion: @escaping (AFResult<Codable>) -> Void)
    {
        AF.request(
            url,
            method: method,
            parameters: NetworkManager.toParameters(model: requestModel),
            encoding: URLEncoding.default,
            headers: headers
        )
        .responseData{ response in
            
            switch response.result {
            case .success(let value):
                do{
                    let responseJsonData = JSON(value)
                    let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                    completion(.success(responseModel))
                }
                catch let parsingError{
                    print("Success (error): \(parsingError)")
                }
                
            case .failure(let error):
                print("Failure: \(error)")
                completion(.failure(error))
                
            default: fatalError("Fatal error.")
                
            }
        }
    }
    struct Empty: Encodable{
        
    }
    static func toParameters<T: Encodable>(model: T?) -> [String:AnyObject]?
    {
        if(model == nil)
        {
            return nil
        }
        
        let jsonData = modelToJson(model:model)
        let parameters = jsonToParameters(from: jsonData!)
        return parameters! as [String: AnyObject]
    }
    
    static func modelToJson<T: Encodable>(model:T)  -> Data?
    {
        return try! JSONEncoder().encode(model.self)
    }
    
    static func jsonToParameters(from data: Data) -> [String: Any]?
    {
        return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    }
    
    //MARK: - get countries function.
    public func getCountries(complition: @escaping (CountryResponseModel?) -> Void,fail:  @escaping()-> Void){
        var requestModel = CountryListRequestModel(limit: "10")
        
        NetworkManager.instance.fetch(HTTPMethod.get, url: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries" , requestModel: requestModel, model:CountryResponseModel.self ) { response in
            switch(response)
            {
            case .success(let model):
                let countryModel = model as! CountryResponseModel
                complition(countryModel)
            case .failure(let error):
                fail()
                break
            }
        }
    }
    //MARK: - get countries detail function.
    public func getCountryDetails(countryId: String,complition: @escaping (CountryDetailResponseModel?) -> Void,fail:  @escaping()-> Void){
        
        NetworkManager.instance.fetch(HTTPMethod.get, url: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryId)" , requestModel: Empty(), model:CountryDetailResponseModel.self ) { response in
            switch(response)
            {
            case .success(let model):
                let countryModel = model as! CountryDetailResponseModel
                complition(countryModel)
            case .failure(let error):
                fail()
                break
            }
        }
    }
}



