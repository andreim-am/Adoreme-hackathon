//
//  MessageService.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

struct MessageService: MessageProtocol {
    static func message(message: Message) async throws -> (Data?, NetworkError?) {
        
        guard let url = URL(string:"https://us-central1-adoreme-ai.cloudfunctions.net/agent") else {
            return (nil, .invalidURL )
        }
        
        var networkError: NetworkError?
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(message)
            request.httpBody = jsonData

            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                networkError = httpResponse.toNetworkError()
              }

            return (data, networkError)
        } catch {
            let errorCode = (error as NSError).code
            switch errorCode {
            case -1004:
                return (nil, .serverDown)
                
            default:
                return (nil, .unexpectedError)
            }
        }
    }
}
