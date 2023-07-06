//
//  Message.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

struct Message: Codable {
    var input: String
    var info: MessageInfo
    var history: [String] = []
}

struct MessageInfo: Codable {
    var membership = "vip_cold"
    var bra_size = "32C"
    var dress_size = "8"
    var panty_size = "XS"
}
