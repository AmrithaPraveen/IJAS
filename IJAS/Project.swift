//
//  Project.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/31/23.
//

import Foundation

struct Project: Identifiable, Codable {
    var id: String
    var Region: Int
    var ProjectName: String
    var Category: String
    var SchoolId: Int
    var SchoolName: String
    var FirstStudentName: String
    var SecondStudentName: String
    var ThirdStudentName: String
    var SafetyCheck: String
    var Score: String
}
