//
//  AlbumCell.swift
//  Assignment3b-mlb0119
//
//  Created by Annaka Brewer on 7/23/20.
//  Copyright © 2020 Annaka Brewer. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    var title: String = "" {
        didSet {
            if (title != oldValue) {
                titleLabel.text = title
            }
        }
    }
    var artist: String = "" {
        didSet {
            if (artist != oldValue) {
                artistLabel.text = artist
            }
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
}
