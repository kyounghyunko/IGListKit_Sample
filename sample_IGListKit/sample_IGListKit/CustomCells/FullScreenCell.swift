//
//  FullScreenCell.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import UIKit

class FullScreenCell: UICollectionViewCell {
    
    @IBOutlet weak var indexLabel: UILabel!
    
    @IBOutlet private weak var viewWidthConstraint: NSLayoutConstraint!
    
    func updateWithCell(object: FullScreen) {
        indexLabel.text = object.indexText
    }
    
}
