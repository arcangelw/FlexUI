//
//  Builders.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

public struct EmptyBuilder: _FlexViewType {
    public func flex_make() -> [any FlexView] {
        []
    }
}

public struct MultiBuilder: _FlexViewType {
    private let elements: [(any _FlexViewType)?]

    init(_ elements: [(any _FlexViewType)?]) {
        self.elements = elements
    }

    public func flex_make() -> [any FlexView] {
        return elements.compactMap { $0 }.flatMap { $0.flex_make() }
    }
}

public struct OptionalBuilder: _FlexViewType {
    private let content: (any _FlexViewType)?

    init(content: () -> (any _FlexViewType)?) {
        self.content = content()
    }

    public func flex_make() -> [any FlexView] {
        content?.flex_make() ?? []
    }
}

public struct ConditionalBuilder: _FlexViewType {
    private let content: any _FlexViewType

    init(trueContent: any _FlexViewType) {
        content = trueContent
    }

    init(falseContent: any _FlexViewType) {
        content = falseContent
    }

    public func flex_make() -> [any FlexView] {
        return content.flex_make()
    }
}
