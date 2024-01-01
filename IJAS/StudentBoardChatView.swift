//
//  StudentBoardChatView.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/1/24.
//

import Foundation
import SwiftUI

struct StudentBoardChatView: View {
    @State private var messageInput = ""
    @State private var messages: [Message] = []

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages) { message in
                    MessageView(message: message)
                }
            }
            .padding()

            HStack {
                TextField("Type your message...", text: $messageInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Send") {
                    sendMessage()
                }
                .padding()
            }
        }
        .navigationTitle("Student Board Chat")
        .onAppear {
            // Load initial chat messages if needed
            loadInitialMessages()
        }
    }

    func sendMessage() {
        // Implement message sending logic here
        // You may need to update the messages array or send data to a backend
        // Example:
        messages.append(Message(content: messageInput, sender: "User"))
        messageInput = ""
    }

    func loadInitialMessages() {
        // Implement logic to load initial messages if needed
        // Example:
        messages = [
            Message(content: "Hello!", sender: "Student Board Member 1"),
            Message(content: "Hi there!", sender: "Student Board Member 2")
            // Add more messages as needed
        ]
    }
}

struct Message: Identifiable {
    var id = UUID()
    var content: String
    var sender: String
}

struct MessageView: View {
    var message: Message

    var body: some View {
        HStack {
            if message.sender == "User" {
                Spacer()
            }

            Text(message.content)
                .padding(10)
                .background(message.sender == "User" ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)

            if message.sender != "User" {
                Spacer()
            }
        }
        .padding(.vertical, 5)
    }
}

struct StudentBoardChatView_Previews: PreviewProvider {
    static var previews: some View {
        StudentBoardChatView()
    }
}
