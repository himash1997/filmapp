//
//  TableViewCell.swift
//  Film App
//
//  Created by Himash Nadeeshan on 4/19/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.10
        title.numberOfLines = 2
        
    }


}
