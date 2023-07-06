//
//  ChatViewModel.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var chatResponse: (Response?, NetworkError?) = (nil, nil)
    
    func message(message: Message) {
        Task {
            let response = try await Repository.shared.message(message: message)
            
            DispatchQueue.main.async {
                self.chatResponse = response
            }
        }
    }
}
