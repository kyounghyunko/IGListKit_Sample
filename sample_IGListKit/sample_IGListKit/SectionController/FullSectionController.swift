//
//  FullSectionController.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

class FullSectionController: ListSectionController {
    
    var currentScreen: FullScreen?
    
    override func didUpdate(to object: Any) {
        guard let fullScreen = object as? FullScreen else {
            return
        }
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        currentScreen = fullScreen
    }
    
    // TODO: numberOfItems
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        var cell: UICollectionViewCell = UICollectionViewCell()
        guard let fullScreen = currentScreen else {
            return cell
        }
        
        guard let ctx = collectionContext else {
            return UICollectionViewCell()
        }
        
        let nibName = String(describing: FullScreenCell.self)
        cell = ctx.dequeueReusableCell(withNibName: nibName , bundle: nil, for: self, at: index)
        
        (cell as? FullScreenCell)?.updateWithCell(object: fullScreen)
        
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * 5 / 8
        return CGSize(width: width, height: height)
    }
}

