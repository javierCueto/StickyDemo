//
//  View+ScreenSize.swift
//  StickyDemo
//
//  Created by iOS Pozol on 03/01/24.
//

import UIKit

extension UIView {
  var screenSize: CGRect {
    return (UIApplication.shared.connectedScenes.first as?
            UIWindowScene)?.screen.bounds ?? CGRect()
  }
}
