//
//  _FlexView.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import UIKit

public protocol _FlexView {
    associatedtype View: UIView
    var view: View { get }
}
