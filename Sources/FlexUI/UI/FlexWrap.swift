//
//  FlexWrap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

public enum FlexWrap {
    case wrap(lineSpacing: CGFloat = 0, alignContent: Flex.AlignContent = .start)
    case noWrap
}
