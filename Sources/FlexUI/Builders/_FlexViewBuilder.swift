//
//  _FlexViewBuilder.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

public protocol _FlexViewType {
    func flex_make() -> [any _FlexView & _FlexDefinable]
}

extension Array: _FlexViewType where Element: _FlexViewType {
    public func flex_make() -> [any _FlexView & _FlexDefinable] {
        flatMap {
            $0.flex_make()
        }
    }
}

public extension _FlexViewType where Self: _FlexView & _FlexDefinable {
    func flex_make() -> [any _FlexView & _FlexDefinable] {
        return [self]
    }
}

@resultBuilder public struct _FlexViewBuilder {
    public static func buildBlock() -> EmptyBuilder {
        EmptyBuilder()
    }

    public static func buildBlock(_ content: any _FlexViewType) -> any _FlexViewType {
        content
    }

    public static func buildBlock(_ content: (any _FlexViewType)...) -> MultiBuilder {
        MultiBuilder(content)
    }

    public static func buildBlock(_ content: (any _FlexViewType)?...) -> MultiBuilder {
        MultiBuilder(content)
    }

    public static func buildIf(_ content: (any _FlexViewType)?) -> OptionalBuilder {
        return OptionalBuilder(content: { content })
    }

    public static func buildEither(first: any _FlexViewType) -> ConditionalBuilder {
        ConditionalBuilder(trueContent: first)
    }

    public static func buildEither(second: any _FlexViewType) -> ConditionalBuilder {
        ConditionalBuilder(falseContent: second)
    }

    public static func buildExpression(_ expression: any _FlexViewType) -> any _FlexViewType {
        return expression
    }

    public static func buildExpression(_ expression: (any _FlexViewType)?) -> OptionalBuilder {
        return OptionalBuilder(content: { expression })
    }

    public static func buildExpression(_ expression: [any _FlexViewType]) -> MultiBuilder {
        MultiBuilder(expression)
    }

    public static func buildArray(_ content: [any _FlexViewType]) -> MultiBuilder {
        MultiBuilder(content)
    }

    public static func buildLimitedAvailability(_ content: [any _FlexViewType]) -> MultiBuilder {
        MultiBuilder(content)
    }
}

extension UIView: _FlexViewType {
    public func flex_make() -> [any _FlexDefinable & _FlexView] {
        return [FlexItem(self)]
    }
}

extension Optional: _FlexViewType where Wrapped: _FlexViewType {
    public func flex_make() -> [any _FlexDefinable & _FlexView] {
        map { $0.flex_make() } ?? []
    }
}
