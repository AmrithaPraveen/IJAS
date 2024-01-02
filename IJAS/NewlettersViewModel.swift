//
//  NewlettersViewModel.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/1/24.
//

import Foundation

//
//  StudentViewModel.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/29/23.
//

import FirebaseDatabase
final class NewslettersViewModel: ObservableObject {
    @Published var newsletters: [Newsletter] = []
    private var hasLoadedData = false

    private lazy var databasePath: DatabaseReference? = {

        let ref = Database.database().reference().child("1xAh9SNk0wZA0Rc_mlOwBGC12DWgonbezX4wZGVKw3eo").child("newsletters")
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
                    let scheduleData = try JSONSerialization.data(withJSONObject: json)
                    let schedule = try self.decoder.decode(Newsletter.self, from: scheduleData)
                    self.newsletters.append(schedule)
                    self.hasLoadedData = true


                } catch {
                    print("an error occurred", error)
                }
              }
        self.newsletters.sort { $0.id > $1.id }


    }
    

    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}

