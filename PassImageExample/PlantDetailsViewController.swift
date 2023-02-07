//
//  PlantDetailsViewController.swift
//  PassImageExample
//
//  Created by Matheus Gois on 06/02/23.
//

import UIKit

class PlantDetailsViewController: UIViewController {

    // image view for the plant
    @IBOutlet weak var plantImage: UIImageView!
    var imageURL: String = ""

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if !imageURL.isEmpty {
            if let url = URL(string: imageURL) {
                self.downloadImage(from: url)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async { [weak self] in
                self?.plantImage.image = UIImage(data: data)
            }
        }
    }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
