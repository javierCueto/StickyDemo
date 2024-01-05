//
//  NewStickyViewController.swift
//  StickyDemo
//
//  Created by iOS Pozol on 04/01/24.
//

import UIKit

protocol NewStickyViewControllerDelegate: AnyObject {
  func didFinishSave()
}

final class NewStickyViewController: UIViewController {
  //MARK: Public Variables
  private weak var delegate: NewStickyViewControllerDelegate?
  private let viewModel: NewStickyViewModel
  
  //MARK: Private Variables
  let noteTextView: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    textView.font = .systemFont(ofSize: 14)
    textView.backgroundColor = .systemBackground.withAlphaComponent(0.1)
    textView.textColor = .black
    return textView
  }()
  
  //MARK: LifeCycle
  init(delegate: NewStickyViewControllerDelegate, viewModel: NewStickyViewModel ) {
    self.viewModel = viewModel
    self.delegate = delegate
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUserInterface()
  }
  
  //MARK: Helpers
  private func configUserInterface() {
    view.backgroundColor = .systemYellow
    
    let addBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNote))
    addBarButtonItem.tintColor = .black
    
    navigationItem.rightBarButtonItem = addBarButtonItem
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .systemYellow.withAlphaComponent(0.6)
    appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.compactAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
    
    view.addSubview(noteTextView)
    noteTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    
    noteTextView.text = viewModel.text
  }
  
  @objc
  private func saveNote() {
    viewModel.saveData(description: noteTextView.text) { [weak self] isSuccess in
      self?.delegate?.didFinishSave()
      self?.dismiss(animated: true)
    }
  }
}

//MARK: NewStickyViewController+Extension
extension NewStickyViewController { }
