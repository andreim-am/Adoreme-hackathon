//
//  Repository.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

struct Repository {
    static let shared = Repository()
    
    func message(message: Message) async throws -> (Response?, NetworkError?) {
        do {
            let(data, error) = try await MessageService.message(message: message)
            
            guard let data = data else {
                guard let error = error else {
                    return (nil, .unexpectedError)
                }
                
                return (nil, error)
            }
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                return (response, nil)
            } catch {
                return (nil, .jsonDecoder)
            }
        }
    }
}
