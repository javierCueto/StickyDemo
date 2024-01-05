//
//  BoardCollectionViewCell.swift
//  StickyDemo
//
//  Created by iOS Pozol on 03/01/24.
//

import UIKit

protocol BoardCollectionViewCellDelegate: AnyObject {
  func didCloseButton(uuid: String)
}

final class BoardCollectionViewCell: UICollectionViewCell {
  
  weak var delegate: BoardCollectionViewCellDelegate?
  
  var viewModel: ItemBoardViewModel? {
    didSet {
      reloadData()
    }
  }
  
  let closeButton: UIButton = {
    let button = UIButton(type: .close)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    button.widthAnchor.constraint(equalToConstant: 20).isActive = true
    return button
  }()
  
  let topDateView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.heightAnchor.constraint(equalToConstant: 30).isActive = true
    view.backgroundColor = .systemGray6
    view.backgroundColor = .systemYellow.withAlphaComponent(0.6)
    return view
  }()
  
  let mainView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray4
    view.backgroundColor = .systemYellow
    return view
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 8, weight: .light)

    return label
  }()
  
  let labelStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .top
    return stackView
  }()
  
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textColor = .black
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    configureUserInterface()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUserInterface() {
    addSubview(topDateView)
    topDateView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topDateView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topDateView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    topDateView.addSubview(closeButton)
    closeButton.centerYAnchor.constraint(equalTo: topDateView.centerYAnchor).isActive = true
    closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
    
    closeButton.addAction(closeButtonAction(), for: .touchUpInside)
    
    topDateView.addSubview(dateLabel)
    dateLabel.topAnchor.constraint(equalTo: topDateView.topAnchor).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: topDateView.leadingAnchor, constant: 10).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: topDateView.trailingAnchor).isActive = true
    dateLabel.bottomAnchor.constraint(equalTo: topDateView.bottomAnchor).isActive = true
    
    addSubview(mainView)
    mainView.topAnchor.constraint(equalTo: topDateView.bottomAnchor).isActive = true
    mainView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    mainView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    mainView.addSubview(labelStackView)
    labelStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
    labelStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
    labelStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
    labelStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
    
    labelStackView.addArrangedSubview(descriptionLabel)
    
    layer.cornerRadius = 5
    clipsToBounds = true
  }
  
  func reloadData() {
    dateLabel.text = viewModel?.date
    descriptionLabel.text = viewModel?.description
  }
  
  private func closeButtonAction() -> UIAction {
    UIAction { [weak self] _ in
      self?.delegate?.didCloseButton(uuid: self?.viewModel?.id ?? "")
    }
  }
}
