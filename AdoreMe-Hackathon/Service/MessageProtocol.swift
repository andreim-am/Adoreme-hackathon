//
//  MessageProtocol.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

protocol MessageProtocol {
    static func message(message: Message) async throws -> (Data?, NetworkError?)
}
