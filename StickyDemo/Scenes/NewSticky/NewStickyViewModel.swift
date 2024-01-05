//
//  NewStickyViewModel.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

protocol NewStickyViewModel {
  func saveData(description: String)
}

struct NewStickyViewModelImp: NewStickyViewModel {
  let repositoryNote: RepositoryNote
  
  func saveData(description: String) {
    repositoryNote.saveNote(description: description)
  }
}
