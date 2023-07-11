//
//  HeaderTableViewCell.swift
//  Custom Cells practice
//
//  Created by Артём Потёмкин on 11.07.2023.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet var fullNameLabel: UILabel!
    
    @IBAction func phoneButtonPressed() {
        print("Calling \(fullNameLabel.text ?? "")...")
    }
    
    
}
