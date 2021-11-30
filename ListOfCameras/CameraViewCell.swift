//
//  CameraViewCell.swift
//  ListOfCameras
//
//  Created by Андрей Горбунов on 29.11.2021.
//

import UIKit

class CameraViewCell: UITableViewCell {

    @IBOutlet weak var cameraView: UIImageView!
    
    @IBOutlet weak var nameStreet: UILabel! {
        didSet {
            self.nameStreet.font = UIFont(name: "Helvetica Neue", size: 20.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
