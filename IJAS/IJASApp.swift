//
//  IJASApp.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/2/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct IJASApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            //MainTabbedView()
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        

        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                print("User is not logged in")
                // User is not logged in
            } else {
                print("User logged in")
                // User is logged in
            }
        }
        
        return true
    }
}
