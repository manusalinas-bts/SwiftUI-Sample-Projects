//
//  Persistence.swift
//  FoodPin
//
//  Created by Simon Ng on 20/10/2022.
//

import CoreData
import UIKit

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let restaurant = Restaurant(context: viewContext)
        
        restaurant.name = "Cafe Deadend"
        restaurant.type = "Coffee & Tea Shop"
        restaurant.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
        restaurant.phone = "232-923423"
        restaurant.summary = "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal."
        restaurant.image = (UIImage(named: "cafedeadend")?.pngData())!
        restaurant.isFavorite = false
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    static var testData: [Restaurant]? = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Restaurant")
        return try? PersistenceController.preview.container.viewContext.fetch(fetchRequest) as? [Restaurant]
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FoodPin")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
