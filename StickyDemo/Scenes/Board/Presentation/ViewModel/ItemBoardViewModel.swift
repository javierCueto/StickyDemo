//
//  ItemBoardViewModel.swift
//  StickyDemo
//
//  Created by iOS Pozol on 03/01/24.
//

struct ItemBoardViewModel {
  private let note: Note
  
  var date: String {
    note.date.formatted(date: .abbreviated, time: .complete)
  }
  
  var description: String {
    note.description
  }
  
  init(note: Note) {
    self.note = note
  }
}
