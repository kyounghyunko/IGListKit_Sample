//
//  Constants.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

struct Constants {

    func getObjects(count: Int) -> [ListDiffable] {
        var objects = [ListDiffable]()
        for index in 0...count {
            if index % 3 == 0 {
                objects.append(FullScreen(text: "\(index)"))
            } else {
                objects.append(HalfScreen(index: index))
            }
        }
        return objects
    }
}

