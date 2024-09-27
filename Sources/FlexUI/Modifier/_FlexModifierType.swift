//
//  _FlexModifierType.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

#if canImport(FlexLayoutYoga)
    import FlexLayoutYoga
#endif
import FlexLayout

public protocol _FlexModifierType {
    func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable
}

extension _FlexModifierType {
    var setValue: (_ pointer: FlexValuePointer, _ setPoint: (CGFloat?) -> Flex, _ setPercent: ((FPercent) -> Flex)?) -> Void {
        return { pointer, setPoint, setPercent in
            switch pointer.value {
            case let .point(value):
                _ = setPoint(value!)
            case let .percent(value):
                _ = setPercent?(value)
            default: ()
            }
        }
    }

    var setNoOptionalValue: (_ pointer: FlexValuePointer, _ setPoint: (CGFloat) -> Flex, _ setPercent: ((FPercent) -> Flex)?) -> Void {
        return { pointer, setPoint, setPercent in
            switch pointer.value {
            case let .point(value) where value != nil:
                _ = setPoint(value!)
            case let .percent(value):
                _ = setPercent?(value)
            default: ()
            }
        }
    }
}

public protocol _FlexModifierContentType {
    associatedtype Content: _FlexViewType
    associatedtype Modifier: _FlexModifierType
    var content: Content { get }
    var modifier: Modifier { get }
    func modify(_ element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable
}

public extension _FlexViewType {
    func modifier<Modifier: _FlexModifierType>(_ modifier: Modifier) -> FlexModifiedContent<Self, Modifier> {
        FlexModifiedContent(content: self, modifier: modifier)
    }

    func modify(_ modify: @escaping (any _FlexView & _FlexDefinable) -> Void) -> FlexModifiedContent<Self, FlexModifier> {
        modifier(FlexModifier { element in
            modify(element)
            return element
        })
    }
}

public extension _FlexViewType where Self: _FlexModifierContentType {
    func modifier<NewModifier: _FlexModifierType>(_ newModifier: NewModifier) -> FlexModifiedContent<Content, NewModifier> {
        FlexModifiedContent<Content, NewModifier>(content: content, modifier: newModifier, previousModifier: FlexModifier(modify(_:)))
    }
}

public struct FlexModifiedContent<Content: _FlexViewType, Modifier: _FlexModifierType>:
    _FlexViewType, _FlexModifierContentType
{
    public let content: Content
    public let modifier: Modifier
    fileprivate let previousModifier: FlexModifier?

    init(
        content: Content,
        modifier: Modifier,
        previousModifier: FlexModifier? = nil
    ) {
        self.content = content
        self.modifier = modifier
        self.previousModifier = previousModifier
    }

    public func flex_make() -> [any _FlexView & _FlexDefinable] {
        content.flex_make().map(modify(_:))
    }

    public func modify(_ element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        return modifier.modify(element: previousModifier?.modify(element: element) ?? element)
    }
}

public struct FlexModifier: _FlexModifierType {
    private let _modify: (any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable

    public init(
        _ modify: @escaping (any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable
    ) {
        _modify = modify
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        _modify(element)
    }
}
