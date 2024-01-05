//
//  NewStickySceneFactory.swift
//  StickyDemo
//
//  Created by iOS Pozol on 05/01/24.
//

import UIKit

struct NewStickySceneFactory {
  let localService: LocalDataService
  
  func makeNewStickyViewController(
    title: String, itemViewModel: ItemBoardViewModel? = nil,
    delegate: NewStickyViewControllerDelegate
  ) -> UIViewController{
    let controller = NewStickyViewController(
      delegate: delegate,
      viewModel: NewStickyViewModelImp(repositoryNote: RepositoryNoteImp(localDataService: localService), itemViewModel: itemViewModel))
    controller.title = title
    return UINavigationController(rootViewController: controller)
  }
}

