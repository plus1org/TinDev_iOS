//
//  HideBackButtonText.swift
//  TinDev
//
//  Created by mttm on 13.07.2023.
//

import UIKit

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
