//
//  BoardViewModelDummy.swift
//  StickyDemo
//
//  Created by iOS Pozol on 03/01/24.
//

import Foundation

struct BoardViewModelDummy: BoardViewModel {
  
  private let notes: [Note] = [
    Note(date: Date(), description: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is g packages and web page editors now use Lorem Ipsum as their default model text, and a search  like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
    Note(date: Date(), description: "s that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
    
  ]
  
  var currentItemsBoardCount: Int {
    notes.count
  }
  
  func getItemBoardViewModel(index: IndexPath) -> ItemBoardViewModel {
    let currentNote = notes[index.row]
    
    return ItemBoardViewModel(note: currentNote)
  }
}
