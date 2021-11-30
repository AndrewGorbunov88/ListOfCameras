//
//  Models.swift
//  ListOfCameras
//
//  Created by Андрей Горбунов on 29.11.2021.
//

import Foundation

struct Result: Codable {
    let data: [ResultCamera]
}

struct ResultCamera: Codable {
    let id: Int
    let title: String
    let city_id: Int
    let city: String
    let latitude: String
    let longitude: String
    let camera_group_title: String
    let group_title: String
}
