//
//  BoardViewModel.swift
//  StickyDemo
//
//  Created by iOS Pozol on 02/01/24.
//

import Foundation

protocol BoardViewModel {
  var currentItemsBoardCount: Int { get }
  func getItemBoardViewModel(index: IndexPath) -> ItemBoardViewModel
}
