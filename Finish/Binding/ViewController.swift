//
//  ViewController.swift
//  Binding
//
//  Created by Itunu Raimi on 03/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    let observableHelper = ObservableHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateText() {
        observableHelper.textToUpdate.bind { _ in
            DispatchQueue.main.async { [weak self] in
                self?.quoteLabel.text = self?.observableHelper.textToUpdate.value
            }
        }
    }
    
    @IBAction func generateRandomQuote(_ sender: Any) {
        observableHelper.generateRandomQuote()
        updateText()
    }
    
}

