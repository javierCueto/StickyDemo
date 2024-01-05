//
//  RepositoryNote.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import CoreData
import UIKit

protocol RepositoryNote {
  func saveNote(description: String, completion: @escaping (Bool) -> Void)
  func allNotes(completion: @escaping ([Note]) -> Void)
  func deleteNote(uuid: String, completion: @escaping (Bool) -> Void)
  func updateNote(uuid: String, description: String, completion: @escaping (Bool) -> Void)
}

final class RepositoryNoteImp: RepositoryNote  {
  
  private let localDataService: LocalDataService
  //private let remoteDataService: ApiServices
  
  init(localDataService: LocalDataService) {
    self.localDataService = localDataService
  }
  
  func saveNote(description: String, completion: @escaping (Bool) -> Void) {
    localDataService.saveNote(description: description, completion: completion)
  }
  
  func allNotes(completion: @escaping ([Note]) -> Void) {
    localDataService.allNotes(completion: completion)
  }
  
  func deleteNote(uuid: String, completion: @escaping (Bool) -> Void) {
    localDataService.deleteNote(uuid: uuid, completion: completion)
  }
  
  func updateNote(uuid: String, description: String, completion: @escaping (Bool) -> Void) {
    localDataService.updateNote(uuid: uuid, description: description, completion: completion)
  }
  
}

