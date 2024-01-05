//
//  RepositoryNote.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import CoreData
import UIKit

protocol RepositoryNote {
  func saveNote(description: String)
  func allNotes() -> [Note]
  func deleteNote(uuid: String)
  func updateNote(uuid: String, description: String)
}

final class RepositoryNoteImp: RepositoryNote  {
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  func saveNote(description: String) {
    let note = SNote(context: context)
    note.descriptionText = description
    note.date = Date()
    note.uuid = UUID()
    do {
      try context.save()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func allNotes() -> [Note] {
    let fetchListRequest: NSFetchRequest<SNote> = SNote.fetchRequest()
    var notes = [Note]()
    do {
      notes = try context.fetch(fetchListRequest).map { $0.toNote() }
    } catch {
      print(error.localizedDescription)
    }
    return notes
  }
  
  func deleteNote(uuid: String) {
    searchNote(uuid: uuid) { [weak self] todo in
      guard let self = self else {return }
      do {
        self.context.delete(todo)
        try self.context.save()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func updateNote(uuid: String, description: String) {
    searchNote(uuid: uuid) { [weak self] note in
      guard let self = self else {return }
      do {
        note.descriptionText = description
        try self.context.save()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  private func searchNote(uuid: String, completion: @escaping(SNote) -> Void ) {
    let fetchListRequest: NSFetchRequest<SNote> = SNote.fetchRequest()
    let predicate: NSPredicate = NSPredicate(format: "uuid == %@", uuid)
    fetchListRequest.predicate = predicate
    
    do {
      let objects = try context.fetch(fetchListRequest)
      guard let notes = objects.first else { return }
      completion(notes)
    } catch {
      print(error.localizedDescription)
    }
  }
}

