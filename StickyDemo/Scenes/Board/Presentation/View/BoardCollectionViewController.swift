//
//  BoardCollectionViewController.swift
//  StickyDemo
//
//  Created by iOS Pozol on 02/01/24.
//

import UIKit
import Combine

final class BoardCollectionViewController: UICollectionViewController {
  //MARK: Public Variables
  
  //MARK: Private Variables
  private let viewModel: BoardViewModel
  private var cancellables: Set<AnyCancellable> = []
  //MARK: LifeCycle
  init(layout: UICollectionViewFlowLayout, viewModel: BoardViewModel) {
    self.viewModel = viewModel
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
    configSuscriptions()
    viewModel.viewDidLoad()
  }
  
  //MARK: Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
    collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    
  }
  
  func configSuscriptions() {
    viewModel.options.sink { [weak self] options in
      guard let self = self else {
        return
      }
      switch options {
      case .reloadData:
        collectionView.reloadData()
      case .viewDidLoad:
        print("something here")
      }
    }.store(in: &cancellables)
  }
}

//MARK: BoardCollectionViewController+Extension
extension BoardCollectionViewController {
  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath)
  -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? BoardCollectionViewCell else { return UICollectionViewCell() }
    
    let itemViewModel = viewModel.getItemBoardViewModel(index: indexPath)
    cell.viewModel = itemViewModel
    cell.delegate = self
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.currentItemsBoardCount
  }
}

//MARK: BoardCollectionViewController+BoardCollectionViewCellDelegate
extension BoardCollectionViewController: BoardCollectionViewCellDelegate {
  func didCloseButton(uuid: String) {
    viewModel.deleteItemBoardViewModel(uuid: uuid)
  }
}
