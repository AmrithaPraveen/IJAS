//
//  AnnouncementsView.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/31/23.
//

import Foundation
import SwiftUI



struct AnnouncementsView: View {
    @StateObject private var viewModel = AnnoucementViewModel()
    var body: some View {
            NavigationView {
                List(viewModel.announcements) { announcement in
                    NavigationLink(destination: AnnouncementDetail(announcement: announcement)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(announcement.Title)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                            Text(announcement.Description)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(2) // Limiting description to 2 lines for a clean look
                        }
                        .padding(1)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(UIColor.white))
                 //               .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                        )
                        .padding(.vertical, 1)
                    }
                }
                .listStyle(PlainListStyle()) // Remove default list background
                .navigationBarTitle("Announcements", displayMode: .inline)
                .onAppear {
                    viewModel.listentoRealtimeDatabase()
                }
                .onDisappear {
                    viewModel.stopListening()
                }
            }
        }
    }

    struct AnnouncementDetail: View {
        var announcement: Announcement

        var body: some View {
            VStack(spacing: 16) {
                Text(announcement.Title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)

                Text(announcement.Description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Link("Learn more", destination: URL(string: announcement.Link)!)
                    .foregroundColor(.green)
                    .padding()
            }
            .padding()
            .navigationBarTitle(announcement.Title, displayMode: .inline)
        }
    }
