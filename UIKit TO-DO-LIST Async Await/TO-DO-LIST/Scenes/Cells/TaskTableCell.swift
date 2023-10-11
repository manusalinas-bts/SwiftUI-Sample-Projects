//
//  TaskTableCell.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import UIKit

class TaskTableCell: UITableViewCell {
    @IBOutlet private var btnToggle: UIButton!
    @IBOutlet private var lblDay: UILabel!
    @IBOutlet private var lblTitle: UILabel!
    @IBOutlet private var lblInfo: UILabel!
    
    var onSelection: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func selectedStyle(_ selected: Bool, for item: ToDoTask) {
        // Styling...
        btnToggle.isSelected = selected
        btnToggle.setImage(selected ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle"), for: .normal)
        lblDay.backgroundColor = selected ? .gray.withAlphaComponent(0.3) : .purple.withAlphaComponent(0.1)
        lblDay.textColor = selected ? .darkGray : .purple
        
        // Visibility style
        lblInfo.alpha = selected ? 0.5 : 1.0
        contentView.alpha = selected ? 0.85 : 1.0
        
        // Text Formatting...
        let attrTitle = NSMutableAttributedString(string:  item.title ?? "")
        
        if selected {
            attrTitle.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSRange(location: 0, length: attrTitle.length))
        }
        
        lblTitle.attributedText = attrTitle
        
        if let detail = item.details {
            lblDay.text = detail.dayStr.uppercased()
            lblInfo.text = detail.description
        }
    }
    
    @IBAction
    private func selectTask(_ sender: UIButton) {
        onSelection?()
    }
}
