//
//  StreetViewController.swift
//  ListOfCameras
//
//  Created by Андрей Горбунов on 29.11.2021.
//

import UIKit
import WebKit

class StreetViewController: UIViewController {

    @IBOutlet weak var streetWebView: WKWebView!
    private var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelShow))
        
        if let cameraID = id {

            let link = URL(string:"https://krkvideo7.orionnet.online/cam\(cameraID)/embed.html")!
            let request = URLRequest(url: link)
            streetWebView.load(request)

        } else {
            print("Something wrong")
        }

    }
    
    func setCameraId(id: Int) {
        self.id = id
    }
    
    @objc private func cancelShow() {
        dismiss(animated: true, completion: nil)
    }

}
