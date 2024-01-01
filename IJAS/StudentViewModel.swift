//
//  StudentViewModel.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/29/23.
//

import Foundation
import FirebaseDatabase
final class StudentViewModel: ObservableObject {
    @Published var birds: [StudentBoard] = []
    
    private lazy var databasePath: DatabaseReference? = {

        let ref = Database.database().reference().child("1xAh9SNk0wZA0Rc_mlOwBGC12DWgonbezX4wZGVKw3eo").child("studentboard")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    

    func listentoRealtimeDatabase() {
        print ("liastedn")
        var students: [StudentBoard] = []
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
                    let bird = try self.decoder.decode(StudentBoard.self, from: birdData)
                      birds.append(bird)
                    students.append(bird)
                    //print (students.count)
                    //self.birds.sort { $0.id < $1.id }

                } catch {
                    print("an error occurred", error)
                }
              }
        self.birds.sort { $0.id > $1.id }

    
    }
    

    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
