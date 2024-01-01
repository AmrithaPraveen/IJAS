import SwiftUI

import SwiftUI
import MapKit

struct IJAS2024View: View {
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 39.842_464,longitude: -88.974_295),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header Section with Dates, Venue, and Map
                VStack(spacing: 10) {
                    Text("IJAS STATE EXPOSITION 2024")
                        .font(.headline)
                        .fontWeight(.bold)

                    Text("Dates: May 3rd and 4th")
                        .foregroundColor(.secondary)

                    Text("Venue: Millikin University")
                        .foregroundColor(.secondary)
                    Text("1184 W Main St, Decatur, IL 62522")
                        .foregroundColor(.secondary)
                    // Map View (Replace with your actual map implementation)
                    Map(coordinateRegion: $region)
                        .frame(height: 150)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.secondary, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                // Navigation Links with Improved Design
                LinkCard(destination: ProjectListView(), imageName: "doc.text", label: "Project Directory")

                LinkCard(destination: ScheduleView(), imageName: "calendar", label: "Schedule")

                LinkCard(destination: AwardsView(), imageName: "star", label: "Awards")

                Spacer()
            }
            .padding()
            .navigationBarTitle("IJAS 2024", displayMode: .inline)
        }
    }
}

struct LinkCard<Destination: View>: View {
    var destination: Destination
    var imageName: String
    var label: String

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 18)
                    .foregroundColor(.white)

                Text(label)
                    .foregroundColor(.white)
                    .font(.headline)

                Spacer()
            }
            .padding(12)
            .background(Color.green)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}






struct AwardsView: View {
    var body: some View {
        Text("Awards Content Goes Here")
            .navigationBarTitle("Awards", displayMode: .inline)
    }
}

struct MapView: View {
    var body: some View {
        // Replace with your actual map implementation
        Color.blue.opacity(0.5)
    }
}

