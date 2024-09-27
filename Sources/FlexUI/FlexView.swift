//
//  FlexView.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public protocol FlexView {
    associatedtype View: UIView
    var view: View { get }
    @discardableResult
    func define(superFlex: FlexLayout.Flex) -> Self
}
