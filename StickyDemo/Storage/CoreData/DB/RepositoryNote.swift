//
//  Data+Note.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import CoreData
import UIKit

protocol RepositoryNote {
    func saveNote(description: String)
//    func allTodo() -> [SNote]
//    func deleteTodo(uuid: String)
//    func updateTodo(uuid: String, title: String)
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
//    
//    func allTodo() -> [Todo] {
//        let fetchListRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
//        var lists = [Todo]()
//        do {
//            lists = try context.fetch(fetchListRequest)
//        } catch {
//            print(error.localizedDescription)
//        }
//        return lists
//    }
//    
//    func deleteTodo(uuid: String) {
//        searchTodo(uuid: uuid) { [weak self] todo in
//            guard let self = self else {return }
//            do {
//                self.context.delete(todo)
//                try self.context.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    func updateTodo(uuid: String, title: String) {
//        searchTodo(uuid: uuid) { [weak self] todo in
//            guard let self = self else {return }
//            do {
//                todo.title = title
//                try self.context.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    private func searchTodo(uuid: String, completion: @escaping(Todo) -> Void ) {
//        let fetchListRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
//        let predicate: NSPredicate = NSPredicate(format: "id == %@", uuid)
//        fetchListRequest.predicate = predicate
//        
//        do {
//            let objects = try context.fetch(fetchListRequest)
//            guard let todo = objects.first else { return }
//            completion(todo)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
}

