//
//  _ArrayBuilder.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

@resultBuilder
public struct _ArrayBuilder<Element: _FlexView> {
    public static func buildExpression(_ expression: Element) -> [Element] {
        [expression]
    }

    public static func buildExpression(_ expression: Element?) -> [Element] {
        [expression].compactMap { $0 }
    }

    public static func buildExpression(_ expression: [Element]) -> [Element] {
        expression
    }

    public static func buildBlock() -> [Element] {
        []
    }

    public static func buildBlock(_ segments: [Element]...) -> [Element] {
        segments.flatMap { $0 }
    }

    public static func buildIf(_ segments: [Element]?...) -> [Element] {
        segments.flatMap { $0 ?? [] }
    }

    public static func buildEither(first: [Element]) -> [Element] {
        first
    }

    public static func buildEither(second: [Element]) -> [Element] {
        second
    }

    public static func buildArray(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }

    public static func buildLimitedAvailability(_ component: [Element]) -> [Element] {
        component
    }
}
