//
//  TableViewDataSourceAndDelegate.swift
//  ListOfCameras
//
//  Created by Андрей Горбунов on 30.11.2021.
//

import UIKit

enum Segues: String {
    case showStreet = "viewStreet"
}

class TableViewDataSourceAndDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    
    private let sizeHeader: CGFloat = 40.0
    private static let cellOfCamera = "cameraCell"
    private let urlString = "https://orionnet.online/api/v2/preview_images/"

    private weak var parentVC: TableViewController!
    
    init(vc: TableViewController) {
        self.parentVC = vc
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parentVC.result?.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: TableViewDataSourceAndDelegate.cellOfCamera) as? CameraViewCell

        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: TableViewDataSourceAndDelegate.cellOfCamera) as? CameraViewCell
        }

        let url = URL(string: urlString+String(parentVC.elementsPreviewId[indexPath.row]))
        
        cell?.cameraView.load(url: url!)
        cell?.nameStreet.text = parentVC.result?.data[indexPath.row].title

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cameraID = parentVC.elementsPreviewId[indexPath.row]
        
        parentVC.performSegue(withIdentifier: Segues.showStreet.rawValue, sender: cameraID)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sizeHeader
    }
    
}
