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
    let height = (UIView().screenSize.width / 2) - 15
    layout.itemSize = CGSize(width: height, height: height)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    layout.minimumInteritemSpacing = .zero
    let boardViewModelDummy: BoardViewModelDummy = BoardViewModelDummy()
    let controller = BoardCollectionViewController(layout: layout, viewModel: boardViewModelDummy)
    controller.title = "Board"
    return controller
  }
  
}
