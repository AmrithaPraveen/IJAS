
//
//  ProjectModelView.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/31/23.
//

import Foundation
import FirebaseDatabase
final class AwardViewModel: ObservableObject {
    @Published var awards: [Award] = []
    private var hasLoadedData = false

    private lazy var databasePath: DatabaseReference? = {

        let ref = Database.database().reference().child("1xAh9SNk0wZA0Rc_mlOwBGC12DWgonbezX4wZGVKw3eo").child("awards")
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
                    let bird = try self.decoder.decode(Award.self, from: birdData)
                    self.awards.append(bird)
                    self.hasLoadedData = true

                    //print (students.count)
                    //self.announcements.sort { $0.id < $1.id }

                } catch {
                    print("an error occurred", error)
                }
              }
        self.awards.sort { $0.id < $1.id }


    }
    

    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
    
    
}


