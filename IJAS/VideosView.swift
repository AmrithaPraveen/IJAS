//
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit
import AVKit
//struct VideosView: View {
////    @Binding var presentSideMenu: Bool
//
//    var body:some View{
//        List{
//            VideoListView(videoURL: "https://www.youtube.com/watch?v=CHWwCu6ddEw")
//            VideoListView(videoURL: "https://www.youtube.com/watch?v=QcybZgiUoHU")
//        }
//           }
//    }
//

import YouTubePlayerKit

struct VideoItem: Identifiable, Codable {
    var id: String
    var Title: String
    var Link: String
}

struct VideosView: View {
    @ObservedObject private var viewModel = VidoeViewModel()


    var body: some View {
        List(viewModel.videos) { video in
            VideoCell(video: video)
        }
        .navigationTitle("How-to Videos")

        .onAppear {
            viewModel.listentoRealtimeDatabase()
        }
        .onDisappear {
            viewModel.stopListening()
        }
    }
}

struct VideoCell: View {
    var video: VideoItem

    var body: some View {
        VStack(alignment: .leading) {
            YouTubePlayerView(YouTubePlayer(stringLiteral: video.Link))
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()

            Text(video.Title)
                .font(.headline)
                .padding(.vertical, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
        .padding(.vertical, 8)
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}

