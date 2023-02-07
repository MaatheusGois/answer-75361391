//
//  ViewController.swift
//  PassImageExample
//
//  Created by Matheus Gois on 06/02/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    var image = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callAPI() {
        self.image = "http://www.tropicopia.com/house-plant/thumbnails/5556.jpg"
    }

    @IBAction func next() {
        guard let detailController = storyboard?.instantiateViewController(withIdentifier: "showDetails") as? PlantDetailsViewController else {
            return
        }

        detailController.imageURL = image

        present(detailController, animated: true)
    }
}
