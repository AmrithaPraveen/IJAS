//
//  Project.swift
//  IJAS
//
//  Created by Amritha Praveen on 12/31/23.
//

import Foundation

struct Project: Identifiable, Codable {
    var id: String
    var Region: String
    var ProjectName: String
    var ProjectNumber: String
    var Category: String
    var SchoolId: String
    var SchoolName: String
    var FirstStudentName: String
    var SecondStudentName: String
    var ThirdStudentName: String
    var SafetyCheck: String
    var Score: String
}
