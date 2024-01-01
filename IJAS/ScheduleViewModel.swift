
//
//  StudentViewModel.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/29/23.
//

import Foundation
import FirebaseDatabase
final class ScheduleViewModel: ObservableObject {
    @Published var schedules: [Schedule] = []
    private var hasLoadedData = false

    private lazy var databasePath: DatabaseReference? = {

        let ref = Database.database().reference().child("1xAh9SNk0wZA0Rc_mlOwBGC12DWgonbezX4wZGVKw3eo").child("schedule")
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
                    let schedule = try self.decoder.decode(Schedule.self, from: scheduleData)
                    self.schedules.append(schedule)
                    self.hasLoadedData = true

                    //print (students.count)
                    //self.announcements.sort { $0.id < $1.id }

                } catch {
                    print("an error occurred", error)
                }
              }
        self.schedules.sort { $0.id < $1.id }


    }
    

    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}

