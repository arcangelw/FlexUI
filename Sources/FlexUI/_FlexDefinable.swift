//
//  _FlexDefinable.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

public protocol _FlexDefinable {
    @discardableResult
    func define(superFlex: Flex) -> any _FlexView
}
