//
//  BoardViewModelImp.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import Combine
import Foundation

final class BoardViewModelImp: BoardViewModel {

  let repositoryNotes: RepositoryNote
  
  var notes: [Note] = []
  
  var currentItemsBoardCount: Int {
    notes.count
  }
  
  var options: PassthroughSubject<BoardViewModelOptions, Never> = PassthroughSubject<BoardViewModelOptions, Never>()
  
  init(repositoryNotes: RepositoryNote) {
    self.repositoryNotes = repositoryNotes
  }
  
  func getItemBoardViewModel(index: IndexPath) -> ItemBoardViewModel {
    let currentNote = notes[index.row]
    
    return ItemBoardViewModel(note: currentNote)
  }
  
  func deleteItemBoardViewModel(uuid: String) {
    
  }
  
  func viewDidLoad() {
    notes = repositoryNotes.allNotes()
  }
  
  func loadNewData() {
    notes = repositoryNotes.allNotes()
    options.send(.reloadData)
  }
  
}
