//
//  StarViewController.swift
//  Stars-with-Luis
//
//  Created by Ilgar Ilyasov on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var starListTextView: UITextView!
    
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Functions
    @IBAction func listStarButtonTapped(_ sender: Any) {
        var output = ""
        
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away.\n"
        }
        
        starListTextView.text = output
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
              let distanceString = distanceTextField.text,
              let distance = Double(distanceString) else { return }
        
        starController.createStar(withName: name, distance: distance)
    }
    
}
