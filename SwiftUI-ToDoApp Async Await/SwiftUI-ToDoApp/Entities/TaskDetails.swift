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
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            return "N/A"
        }
    }
}
