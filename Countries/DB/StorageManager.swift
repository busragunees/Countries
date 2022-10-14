//
//  StorageManager.swift
//  Countries
//
//  Created by Büşra Güneş on 14.10.2022.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Countries")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext
    
    private init() {
        context = persistentContainer.viewContext
    }
}

extension StorageManager {
    
    func fetchData(completion: (Result<[CountryEntity], Error>) -> Void)  {
        let fetchRequest = CountryEntity.fetchRequest()
        
        do {
            let country = try context.fetch(fetchRequest)
            completion(.success(country))
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addCountry(_ country: Country, completion: (CountryEntity) -> Void) {
        let item = CountryEntity(context: context)
        item.name = country.name
        item.wikiDataId = country.wikiDataId
        item.code = country.code
        saveContext()
        completion(item)
    }
    
    func deleteCountry(item: CountryEntity) {
        context.delete(item)
        saveContext()
    }
}

