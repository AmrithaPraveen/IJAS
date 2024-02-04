//
//  Award.swift
//  IJAS
//
//  Created by Amritha Praveen on 2/4/24.
//

import Foundation
import SwiftUI


struct Award: Identifiable,Codable {
    let id: String
    let AwardName: String
    let Category: String
    let Division: String
    let ProjectNumber: String
    let Name: String
    let Title: String
    let School: String
    let Region: String
}
