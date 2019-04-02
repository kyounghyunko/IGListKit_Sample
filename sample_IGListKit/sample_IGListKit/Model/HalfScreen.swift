//
//  HalfScreen.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

class HalfScreen: ListDiffable {
    
    private var identifier: String = UUID().uuidString
    private(set) var indexText: String
    private(set) var isLeft: Bool
    
    init(index: Int) {
        self.indexText = String(index)
        self.isLeft = (index + 1) % 3 != 0
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? HalfScreen else {
            return false
        }
        
        return self.identifier == object.identifier
    }
    
}
