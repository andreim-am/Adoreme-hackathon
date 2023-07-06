//
//  Response.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

struct Response: Decodable {
    var text: String
    var products: String?
    var suggestion: String?
    var type: String?
}
