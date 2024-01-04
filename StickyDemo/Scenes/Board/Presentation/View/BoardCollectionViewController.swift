//
//  BoardCollectionViewController.swift
//  StickyDemo
//
//  Created by iOS Pozol on 02/01/24.
//

import UIKit

final class BoardCollectionViewController: UICollectionViewController {
  //MARK: Public Variables
  
  //MARK: Private Variables
  private let viewModel: BoardViewModel
  
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
  }
  
  //MARK: Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemBackground
    collectionView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
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
    cell.setData(viewModel: itemViewModel)
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.currentItemsBoardCount
  }
}
