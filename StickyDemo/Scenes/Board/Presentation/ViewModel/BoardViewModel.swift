//
//  BoardViewModel.swift
//  StickyDemo
//
//  Created by iOS Pozol on 02/01/24.
//

import Foundation
import Combine

protocol BoardViewModel {
  var currentItemsBoardCount: Int { get }
  var options: PassthroughSubject<BoardViewModelOptions, Never> { get }
  func getItemBoardViewModel(index: IndexPath) -> ItemBoardViewModel
  func deleteItemBoardViewModel(uuid: String)
  func viewDidLoad()
  func loadNewData()
}
