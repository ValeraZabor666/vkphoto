//
//  CollectionEntity.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

struct Response: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var count: Int
    var items: [Photo]
}

struct Photo: Decodable {
    var date: Double
    var sizes: [Size]
}

struct Size: Decodable {
    var url: URL
}

class AllData {
    static let sharedData = AllData()
    
    var date: Double?
    var image: UIImage?
}
