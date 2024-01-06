//
//  PosterProjectViewModel.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/6/24.
//

import Foundation
import FirebaseDatabase
final class PosterProjectViewModel: ObservableObject {
    @Published var posterprojects: [Project] = []
    private var hasLoadedData = false

    private lazy var databasePath: DatabaseReference? = {

        let ref = Database.database().reference().child("1xAh9SNk0wZA0Rc_mlOwBGC12DWgonbezX4wZGVKw3eo").child("posterprojects")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    

    func listentoRealtimeDatabase() {
        guard !hasLoadedData else {
                    // Data has already been loaded, no need to listen again
                    return
                }
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let birdData = try JSONSerialization.data(withJSONObject: json)
                    let bird = try self.decoder.decode(Project.self, from: birdData)
                    self.posterprojects.append(bird)
                    self.hasLoadedData = true

                    //print (students.count)
                    //self.announcements.sort { $0.id < $1.id }

                } catch {
                    print("an error occurred", error)
                }
              }
        self.posterprojects.sort { $0.id < $1.id }


    }
    

    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
    
    
}


