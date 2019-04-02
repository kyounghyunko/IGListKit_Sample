//
//  ViewController.swift
//  sample_IGListKit
//
//  Created by ko on 2019/03/29.
//  Copyright © 2019年 ko. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource = SampleDataSource()
    
    lazy var adapter: ListAdapter =  {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
        adapter.collectionView = collectionView
        adapter.dataSource = dataSource
        return adapter
    }()
    
    var isUpdateData = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _ = adapter
        self.adapter.scrollViewDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        if let collectionView = self.adapter.collectionView {
            collectionView.alpha = 0.0
            let before = collectionView.contentOffset
            
            UIView.animate(withDuration: 0, animations: {
                self.adapter.reloadData(completion: nil)
                collectionView.setContentOffset(.zero, animated: false)
            }) { (_) in
                collectionView.collectionViewLayout.invalidateLayout()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    collectionView.setContentOffset(before, animated: false)
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        collectionView.alpha = 1.0
                    })
                    
                    // 200pxごとに背景にリボンの繰り返しを交互に表示する
                    let aLineImage = UIImage(named: "backgroundA")!
                    let bLineImage = UIImage(named: "backgroundB")!
                    let imageAspectHeight = aLineImage.size.height * collectionView.frame.width / aLineImage.size.width
                    
                    UIGraphicsBeginImageContextWithOptions(collectionView.contentSize, false, 0.0)
                    var height: CGFloat = 200
                    
                    var isUseAImage = false
                    while height < collectionView.contentSize.height {
                        isUseAImage.toggle()
                        
                        if isUseAImage {
                            aLineImage.draw(in: CGRect(x: 0,
                                                       y: height,
                                                       width: collectionView.frame.width,
                                                       height: imageAspectHeight))
                        } else {
                            bLineImage.draw(in: CGRect(x: 0,
                                                       y: height,
                                                       width: collectionView.frame.width,
                                                       height: imageAspectHeight))
                        }
                        
                        height += 200
                        height += imageAspectHeight
                    }
                    
                    let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    if let unwrapBackgroundImage = backgroundImage {
                        collectionView.backgroundColor = UIColor(patternImage: unwrapBackgroundImage)
                    }
                })
                
            }
        }
    }
    
    func updateCell() {
        
        dataSource.count += 10
        adapter.reloadData(completion: nil)
        
        self.isUpdateData = true
    }
}

extension ViewController: UIScrollViewDelegate {
    
    /// スクロール行った時
    ///
    /// - Parameter scrollView: UIScrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = contentHeight - scrollView.frame.size.height
        // offsetYがスクロールにビューより大きい場合更新する
        if offsetY >= height && isUpdateData {
            self.isUpdateData = false
            self.updateCell()
        }
    }
}

