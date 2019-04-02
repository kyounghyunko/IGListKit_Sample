//
//  FullScreen.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

// Cellデータ-FullScreen
class FullScreen: ListDiffable {
    
    private var identifier: String = UUID().uuidString
    private(set) var indexText: String
    
    init(text: String) {
        self.indexText = text
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        // データがFullScreenリタンfalse
        guard let object = object as? FullScreen else {
            return false
        }
        return self.identifier == object.identifier
    }
    
}
