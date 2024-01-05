//
//  DummyLocalDataService.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import Foundation

final class DummyDataLocalService: LocalDataService {
  private var notes: [Note] = []
  
  public static var shared: DummyDataLocalService = DummyDataLocalService()
  
  private init() { }

  func saveNote(description: String, completion: @escaping (Bool) -> Void) {
    let note = Note(uuid: UUID().uuidString, date: Date(), description: description)
    notes.append(note)
    completion(true)
  }
  
  func allNotes(completion: @escaping ([Note]) -> Void) {
    completion(notes)
  }
  
  func deleteNote(uuid: String, completion: @escaping (Bool) -> Void) {
    notes.removeAll { $0.uuid == uuid }
    completion(true)
  }
  
  func updateNote(uuid: String, description: String, completion: @escaping (Bool) -> Void) {
    notes.removeAll { $0.uuid == uuid }
    let note = Note(uuid: UUID().uuidString, date: Date(), description: description)
    notes.append(note)
    completion(true)
  }
}
