//
//  StarController.swift
//  Stars-with-Luis
//
//  Created by Ilgar Ilyasov on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class StarController {
    private(set) var stars = [Star]()
    
    func createStar(withName name: String, distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
    
    
}
