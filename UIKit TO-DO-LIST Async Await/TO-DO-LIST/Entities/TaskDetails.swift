//
//  TaskDetails.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import Foundation

struct TaskDetails: Codable {
    var `description`: String?
    var day: Int?
    
    // Local
    var dayStr: String {
        guard let day = self.day else {
            return "N/A"
        }
        
        switch day {
        case 1:
            return "Mon"
        case 2:
            return "Tue"
        case 3:
            return "Wed"
        case 4:
            return "Thur"
        case 5:
            return "Frid"
        case 6:
            return "Sat"
        case 7:
            return "Sun"
        default:
            return "N/A"
        }
    }
}
