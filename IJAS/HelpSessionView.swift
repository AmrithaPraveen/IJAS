//
//  HelpSessionView.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/1/24.
//

import SwiftUI

struct HelpSessionView: View {
    @ObservedObject private var viewModel = HelpSessionViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.helpsessions) { session in
                NavigationLink(destination: HelpSessionDetailView(session: session)) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date: \(session.Date)")
                            .font(.headline)
                        Text("Time: \(session.Time)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Contact: \(session.Contact)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        // Add more session details as needed
                    }
                    .padding()
                    
                }
            }
            .navigationBarTitle("Help Sessions", displayMode: .inline)
            .onAppear {
                viewModel.listentoRealtimeDatabase()
            }
            .onDisappear(){
                viewModel.stopListening()
            }
        }
    }
}

//struct HelpSessionRow: View {
//    var session: HelpSession
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text(session.Title)
//                .font(.headline)
//            Text("Date: \(session.Date)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text("Time: \(session.Time)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text("Description: \(session.Description)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            Text("Zoom Link: \(session.Link)")
//                .font(.subheadline)
//                .foregroundColor(.blue)
//                .onTapGesture {
//                    // Handle tap on the Zoom link (open in browser or perform a custom action)
//                }
//            // Add more session details as needed
//        }
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.systemBackground)))
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//        )
//        .padding(.horizontal)
//    }
//}
struct HelpSessionRow: View {
    var session: HelpSession

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(session.Title)
                .font(.title)
                .foregroundColor(Color.green) // Use a vibrant primary color
            Text("Date: \(session.Date)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Time: \(session.Time)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Description: \(session.Description)")
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Text("Zoom Link:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Link(session.Link, destination: URL(string: session.Link)!)
                    .font(.subheadline)
                    .foregroundColor(.green) // Use an accent color for links
            }
            // Add more session details as needed
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.white)) // Use a background color
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1) // Add a border with a distinct color
        )
        .padding(.horizontal)
    }
}

struct HelpSessionDetailView: View {
    var session: HelpSession

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
//            Text("Help Session Detail")
//                .font(.headline)
//                .padding()

            HelpSessionRow(session: session)

            // Add more details about the help session as needed
        }
        .padding()
    }
}

struct HelpSession: Identifiable, Codable {
    var id:String
    var Title: String
    var Date: String
    var Time: String
    var Description:String
    var Link: String
    var Contact: String
}
