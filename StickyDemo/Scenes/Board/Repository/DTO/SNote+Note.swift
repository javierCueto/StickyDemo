//
//  SNote+Note.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import Foundation

extension SNote {
  func toNote() -> Note {
    Note(
      uuid: uuid?.uuidString ?? "",
      date: date ?? Date(),
      description: descriptionText ?? "")
  }
}
