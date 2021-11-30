//
//  TableViewController.swift
//  ListOfCameras
//
//  Created by Андрей Горбунов on 29.11.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var elementsPreviewId = [Int]()
    var result: Result?
    
    private var dataSourceAndDelegate: TableViewDataSourceAndDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
        
        for element in result!.data {
            elementsPreviewId.append(element.id)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 20.0)!]
        
        let data = TableViewDataSourceAndDelegate(vc: self)
        
        dataSourceAndDelegate = data
        self.tableView.dataSource = dataSourceAndDelegate
        self.tableView.delegate = dataSourceAndDelegate
        
    }
    
    //MARK: - Methods
    private func parseJSON() {
        
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
            if let result = result {
                print(result)
            } else {
                print("Failed")
            }
            return
        }
        catch {
            print("Error: \(error)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.showStreet.rawValue {
            
            let vc = segue.destination as? UINavigationController
            
            if let viewStreetController = vc?.topViewController as? StreetViewController {
                
                if let webAdressID = sender as? Int {
                    viewStreetController.setCameraId(id: webAdressID)
                }
                
            }
        }
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

