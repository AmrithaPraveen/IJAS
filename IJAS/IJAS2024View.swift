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
//                    Map(coordinateRegion: $region)
//                        .frame(height: 150)
//                        .cornerRadius(15)
//                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.secondary, lineWidth: 1))
//                        .padding(.horizontal, 20)
//                        .padding(.bottom, 10)
                    InteractiveMapView()
                        
                }

                // Navigation Links with Improved Design
                LinkCard(destination: ProjectListView(), imageName: "doc.text", label: "Project Directory - Paper")
                LinkCard(destination: ProjectListView(), imageName: "doc.text", label: "Project Directory - Poster")

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




struct InteractiveMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.842464, longitude: -88.974295),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    // Add pins with annotations for important locations
    private let locations: [Location] = [
        Location(title: "Registration Desk", coordinate: CLLocationCoordinate2D(latitude: 39.842464, longitude: -88.974295)),
        Location(title: "Project Areas", coordinate: CLLocationCoordinate2D(latitude: 39.842, longitude: -88.975)),
        Location(title: "Auditorium", coordinate: CLLocationCoordinate2D(latitude: 39.841, longitude: -88.974)),
    ]

    @State private var selectedLocation: Location?

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: false, annotationItems: locations) { location in
            MapPin(coordinate: location.coordinate, tint: .blue)
        }
        .onTapGesture {
            let tapCoordinate = region.center
            if let tappedLocation = findTappedLocation(coordinate: tapCoordinate) {
                // Handle tap on selected location
                selectedLocation = tappedLocation
                print("Tapped on \(tappedLocation.title)")
            }
        }
        .onAppear {
            // Set the region based on the annotations
            region.center = locations.first?.coordinate ?? CLLocationCoordinate2D(latitude: 39.842464, longitude: -88.974295)
        }
    }

    private func findTappedLocation(coordinate: CLLocationCoordinate2D) -> Location? {
        for location in locations {
            if location.coordinate.latitude == coordinate.latitude &&
                location.coordinate.longitude == coordinate.longitude {
                return location
            }
        }
        return nil
    }
}


struct Location: Identifiable {
    var id = UUID()
    var title: String
    var coordinate: CLLocationCoordinate2D
}

struct InteractiveMapView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveMapView()
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

