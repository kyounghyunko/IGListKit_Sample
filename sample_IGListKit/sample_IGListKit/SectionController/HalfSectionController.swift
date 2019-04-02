//
//  HalfSectionController.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

class HalfSectionController: ListSectionController {
    
    var currentScreen: HalfScreen?
    
    override func didUpdate(to object: Any) {
        guard let halfScreen = object as? HalfScreen else {
            return
        }
        
        if halfScreen.isLeft {
            self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 5)
        } else {
            self.inset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 0)
        }
        
        currentScreen = halfScreen
    }
    
    // TODO: numberOfItems
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        var cell: UICollectionViewCell = UICollectionViewCell()
        guard let halfScreen = currentScreen else {
            return cell
        }
        
        guard let ctx = collectionContext else {
            return cell
        }
        
        let nibName = String(describing: HalfScreenCell.self)
        cell = ctx.dequeueReusableCell(withNibName: nibName, bundle: nil, for: self, at: index)
        
        (cell as? HalfScreenCell)?.updateWithCell(object: halfScreen)
        
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = UIScreen.main.bounds.width / 2 - 5
        let height = width * 23 / 16
        return CGSize(width: width, height: height)
    }
    
}
