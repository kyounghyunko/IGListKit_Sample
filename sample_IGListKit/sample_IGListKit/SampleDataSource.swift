//
//  SampleDataSource.swift
//  sample_IGListKit
//
//  Created by ko on 2019/04/01.
//  Copyright © 2019年 ko. All rights reserved.
//

import IGListKit

// stubメソッドを生成しないにするとNSObject継承要
// objects: データソース
// listAdapter: cellのコントローラー

class SampleDataSource: NSObject, ListAdapterDataSource {
    
    var count = 10
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return Constants().getObjects(count: count)
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is FullScreen {
            return FullSectionController()
        } else {
            return HalfSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
