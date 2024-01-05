//
//  BoardViewModelDummy.swift
//  StickyDemo
//
//  Created by iOS Pozol on 03/01/24.
//

import Foundation
import Combine

final class BoardViewModelDummy: BoardViewModel {
  
  var options: PassthroughSubject<BoardViewModelOptions, Never> = PassthroughSubject<BoardViewModelOptions, Never>()
  
  
  
  private var notes: [Note] = []
  
  var currentItemsBoardCount: Int {
    notes.count
  }
  
  func viewDidLoad() {
    notes = [
      
      Note(uuid: UUID().uuidString, date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
      
    ]
    options.send(.reloadData)
  }
  
  func getItemBoardViewModel(index: IndexPath) -> ItemBoardViewModel {
    let currentNote = notes[index.row]
    
    return ItemBoardViewModel(note: currentNote)
  }
  
  func deleteItemBoardViewModel(uuid: String) {
    notes.removeAll { $0.uuid == uuid }
    options.send(.reloadData)
  }
  
  func loadNewData() {
    notes.append(Note(uuid: UUID().uuidString, date: Date(), description: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is g packages and web page editors now use Lorem Ipsum as their default model text, and a search  like)."))
    options.send(.reloadData)
  }
  
}
