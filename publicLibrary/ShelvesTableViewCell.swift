//
//  ShelvesTableViewCell.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/29/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class ShelvesTableViewCell: UITableViewCell {

  @IBOutlet weak var labelShelves: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
