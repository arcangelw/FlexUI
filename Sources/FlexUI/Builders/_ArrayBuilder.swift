//
//  _ArrayBuilder.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

@resultBuilder
public struct _ArrayBuilder {
    public static func buildExpression(_ expression: any FlexView) -> [any FlexView] {
        [expression]
    }

    public static func buildExpression(_ expression: (any FlexView)?) -> [any FlexView] {
        [expression].compactMap { $0 }
    }

    public static func buildExpression(_ expression: [any FlexView]) -> [any FlexView] {
        expression
    }

    public static func buildBlock() -> [any FlexView] {
        []
    }

    public static func buildBlock(_ segments: [any FlexView]...) -> [any FlexView] {
        segments.flatMap { $0 }
    }

    public static func buildIf(_ segments: [any FlexView]?...) -> [any FlexView] {
        segments.flatMap { $0 ?? [] }
    }

    public static func buildEither(first: [any FlexView]) -> [any FlexView] {
        first
    }

    public static func buildEither(second: [any FlexView]) -> [any FlexView] {
        second
    }

    public static func buildArray(_ components: [[any FlexView]]) -> [any FlexView] {
        components.flatMap { $0 }
    }

    public static func buildLimitedAvailability(_ component: [any FlexView]) -> [any FlexView] {
        component
    }
}
