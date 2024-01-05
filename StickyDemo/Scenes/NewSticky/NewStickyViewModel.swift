//
//  NewStickyViewModel.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

protocol NewStickyViewModel {
  var text: String { get }
  func saveData(description: String, completion: @escaping (Bool) -> Void)
}

struct NewStickyViewModelImp: NewStickyViewModel {
  let repositoryNote: RepositoryNote
  let itemViewModel: ItemBoardViewModel?
  
  var text: String {
    itemViewModel?.description ?? ""
  }
  
  func saveData(description: String, completion: @escaping (Bool) -> Void) {
    if let itemViewModel = itemViewModel {
      repositoryNote.updateNote(uuid: itemViewModel.id, description: description, completion: completion)
    } else {
      repositoryNote.saveNote(description: description, completion: completion)
    }
    
  }
}
