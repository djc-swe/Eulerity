//
//  ViewController.swift
//  Eulerity
//
//  Created by Daniel Condly on 6/28/23.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getJSON()
    }
    
    @objc func didTapImage(_ sender: UITapGestureRecognizer) {
        print("hello didTapImage(), \(sender)")
    }
    
    private func getJSON() {
        AF.request("https://eulerity-hackathon.appspot.com/pets").response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                self.createPosts(json: json)
            case .failure(let error):
                print(error)
                let message = "Cannot retrieve images"
                let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
   private func createPosts(json: JSON) {
        var posts:[CaptionableImageView] = []
       
        for i in 0...json.count - 1 {
            let post = CaptionableImageView()
            let imageURL = URL(string: json[i]["url"].stringValue)

            post.imageOutlet?.kf.indicatorType = .activity
            post.imageOutlet.kf.setImage(with: imageURL)
            post.imageOutlet.isUserInteractionEnabled = true
            post.imageOutlet.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImage(_:))))
            
            post.title = json[i]["title"].stringValue
            post.created = json[i]["created"].stringValue
            post.descript = json[i]["description"].stringValue
            
            posts.append(post)
            self.imageStackView.insertArrangedSubview(post, at: 1)
        }
    }
}
