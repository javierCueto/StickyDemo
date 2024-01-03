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
  
  //MARK: LifeCycle
  init(layout: UICollectionViewFlowLayout) {
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
    let firstScene = UIApplication.shared.connectedScenes.first // may be nil
              if let w = firstScene as? UIWindowScene {
                  let screenSize = w.screen.bounds
                print("screenSize", screenSize)
              }
  }
}

//MARK: BoardCollectionViewController+Extension
extension BoardCollectionViewController { }
