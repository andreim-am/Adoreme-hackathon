//
//  ContentView.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import SwiftUI

struct ChatView: View {
    @State var message: String = ""
    @StateObject var chatViewModel = ChatViewModel()
    @State var messages: [ChatMessage] = []
    var body: some View {
        VStack {
            Text("Shop assistent")
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
            
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading) {
                    MessageView(contentMessage: "Hello, how can I help you?", isCurrentUser: false)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    ForEach(messages, id: \.message) { message in
                        
                        MessageView(contentMessage: message.message, isCurrentUser: message.isFromUser)
                            .frame(maxWidth: .infinity, alignment: message.isFromUser ? .trailing : .leading)
                            .padding(.horizontal)
                    }
                }.padding(.top)
            }
            
            Spacer()
            
            HStack {
                TextField("Type here", text: $message)
                .textFieldStyle(.roundedBorder)
                .padding(.leading)
                
                Button {
                    messages.append(ChatMessage(message: message, isFromUser: true))
                    chatViewModel.message(message: Message(input: message, info: MessageInfo()))
                    message = ""
                } label: {
                    Image(systemName: "chevron.up.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }.padding(.trailing)
            }.onReceive(chatViewModel.$chatResponse) { response in
                guard let newMessage = response.0 else {
                    guard let error = response.1 else {
                        return
                    }
                    print("error")
                   return
                }
                
                messages.append(ChatMessage(message: newMessage.text, isFromUser: false))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
