//
//  MessageView.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import SwiftUI

struct MessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(contentMessage: "test", isCurrentUser: false)
    }
}
