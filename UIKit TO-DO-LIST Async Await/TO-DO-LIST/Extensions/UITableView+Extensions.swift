//
//  UITableView+Extensions.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import UIKit

extension UITableView {
    func showEmptyState(_ title: String) {
        
        let lblEmptyMessage = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 63))
        lblEmptyMessage.textAlignment = .center
        lblEmptyMessage.numberOfLines = 3
        lblEmptyMessage.lineBreakMode = .byWordWrapping
        lblEmptyMessage.textColor = .darkText.withAlphaComponent(0.4)
        lblEmptyMessage.text = title
        
        backgroundView = lblEmptyMessage
    }
    
    func deleteEmptyState() {
        DispatchQueue.main.async {
            self.backgroundView = nil
        }
    }
}
