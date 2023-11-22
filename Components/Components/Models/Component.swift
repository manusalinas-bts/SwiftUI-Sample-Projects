//
//  Component.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import Foundation

struct MyComponent: Identifiable {
    var id: SUIComponents
    var name: String


    static func mockingComponents() -> [MyComponent] {
        var mocks = [MyComponent]()

        SUIComponents.allCases.forEach { component in
            mocks.append(MyComponent(id: component, name: component.rawValue))
        }

        return mocks
    }
}

// MARK: - Data source
enum SUIComponents: String, CaseIterable {
    case list, groupBox, contentUnavailableView, buttons
}
