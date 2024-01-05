//
//  LocalDataService.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import CoreData

protocol LocalDataService {
  func saveNote(description: String, completion: @escaping (Bool) -> Void)
  func allNotes(completion: @escaping ([Note]) -> Void)
  func deleteNote(uuid: String, completion: @escaping (Bool) -> Void)
  func updateNote(uuid: String, description: String, completion: @escaping (Bool) -> Void)
}

final class CoreDataLocalService: LocalDataService {
  let context: NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  func saveNote(description: String, completion: @escaping (Bool) -> Void) {
    let note = SNote(context: context)
    note.descriptionText = description
    note.date = Date()
    note.uuid = UUID()
    do {
      try context.save()
      completion(true)
    } catch {
      completion(false)
      print(error.localizedDescription)
    }
  }
  
  func allNotes(completion: @escaping ([Note]) -> Void) {
    let fetchListRequest: NSFetchRequest<SNote> = SNote.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
    fetchListRequest.sortDescriptors = [sortDescriptor]
    var notes = [Note]()
    do {
      notes = try context.fetch(fetchListRequest).map { $0.toNote() }
    } catch {
      print(error.localizedDescription)
    }
    completion(notes)
  }
  
  func deleteNote(uuid: String, completion: @escaping (Bool) -> Void) {
    searchNote(uuid: uuid) { [weak self] note in
      guard let self = self else { return }
      guard let note = note else { return completion(false)}
      do {
        self.context.delete(note)
        try self.context.save()
        completion(true)
      } catch {
        print(error.localizedDescription)
        completion(false)
      }
    }
  }
  
  func updateNote(uuid: String, description: String, completion: @escaping (Bool) -> Void) {
    searchNote(uuid: uuid) { [weak self] note in
      guard let self = self else { return }
      guard let note = note else { return completion(false)}
      do {
        note.descriptionText = description
        note.date = Date()
        try self.context.save()
        completion(true)
      } catch {
        print(error.localizedDescription)
        completion(false)
      }
    }
  }
  
  private func searchNote(uuid: String, completion: @escaping(SNote?) -> Void) {
    let fetchListRequest: NSFetchRequest<SNote> = SNote.fetchRequest()
    let predicate: NSPredicate = NSPredicate(format: "uuid == %@", uuid)
    fetchListRequest.predicate = predicate
    
    do {
      let objects = try context.fetch(fetchListRequest)
      guard let notes = objects.first else { return }
      completion(notes)
    } catch {
      print(error.localizedDescription)
      completion(nil)
    }
  }
}
