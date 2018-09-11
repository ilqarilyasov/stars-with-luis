//
//  StarController.swift
//  Stars-with-Luis
//
//  Created by Ilgar Ilyasov on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class StarController {
    
    // MARK: -Properties
    private(set) var stars = [Star]()
    
    private var persistantFileURL: URL? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return directory.appendingPathComponent("stars.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: -Functions
    func createStar(withName name: String, distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
    
    // MARK: -Persistence
    func saveToPersistentStore() {
        guard let url = persistantFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode([stars])
            try data.write(to: url)
            
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistantFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            stars = try decoder.decode([Star].self, from: data)
            
        } catch  {
            NSLog("Error loading stars data: \(error)")
        }
    }
    
}
