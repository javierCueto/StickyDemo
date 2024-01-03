//
//  BoardSceneFactory.swift
//  StickyDemo
//
//  Created by iOS Pozol on 02/01/24.
//

import UIKit

struct BoardSceneFactory {
  func makeBoardScene() -> UIViewController {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 200, height: 200)
    return BoardCollectionViewController(layout: layout)
  }
}
