import Foundation
import SwiftUI

struct Newsletter: Identifiable, Codable {
    var id: String
    var Title: String
    var Highlights: String
    var Link: String
}

struct NewslettersView: View {
    @StateObject private var viewModel = NewslettersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.newsletters.sorted(by: { $0.id > $1.id })) { newsletter in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(newsletter.Title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text(newsletter.Highlights)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineLimit(5) // Adjust the line limit based on your preference
                    }
                    Spacer()

                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                )
                .onTapGesture {
                    if let url = URL(string: newsletter.Link) {
                        UIApplication.shared.open(url)
                    }
                }
            }
            .navigationBarTitle("Monthly Newsletters", displayMode: .inline)
            .onAppear {
                viewModel.listentoRealtimeDatabase()
            }
            .onDisappear {
                viewModel.stopListening()
            }
            .listStyle(PlainListStyle())
        }
    }
}

    //struct NewsletterRow: View {
    //    var newsletter: Newsletter
    //
    //    var body: some View {
    //        HStack {
    //            Image(systemName: "newspaper")
    //                .resizable()
    //                .frame(width: 40, height: 40)
    //                .foregroundColor(.green) // Customize the color
    //
    //            VStack(alignment: .leading) {
    //                // Use DateFormatter to format the date
    //                Text("Month: \(newsletter.Title)")
    //                    .font(.headline)
    //                Text("Highlights: \(newsletter.Highlights)")
    //                    .font(.subheadline)
    //                    .foregroundColor(.gray)
    //            }
    //        }
    //        .padding(8)
    //        .onTapGesture {
    //            if let url = URL(string: newsletter.Link) {
    //                UIApplication.shared.open(url)
    //            }
    //        }
    //    }
    //    // Function to format the date string
    //}
    

