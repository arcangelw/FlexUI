//
//  FlexWrap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import Foundation

public enum FlexWrap {
    case wrap(lineSpacing: CGFloat = 0, alignContent: Flex.AlignContent = .start)
    case noWrap

    var wrap: Flex.Wrap {
        switch self {
        case .wrap:
            return .wrap
        case .noWrap:
            return .noWrap
        }
    }

    var lineSpacing: CGFloat {
        switch self {
        case let .wrap(lineSpacing, _):
            return lineSpacing
        case .noWrap:
            return 0
        }
    }

    var alignContent: Flex.AlignContent {
        switch self {
        case let .wrap(_, alignContent):
            return alignContent
        case .noWrap:
            return .start
        }
    }
}
