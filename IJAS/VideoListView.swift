
import SwiftUI
import YouTubePlayerKit


struct VideoListView: View {
    let videoURL: String
    
    init(videoURL:String){
        self.videoURL = videoURL
    }
    
    var body: some View {
        //  WWDC 2019 Keynote
        YouTubePlayerView(YouTubePlayer(stringLiteral: videoURL))
        
        
    }
}

