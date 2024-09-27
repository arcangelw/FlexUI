//
//  PositionInset.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexInsetModifier: _FlexModifierType {
    var leftPointer: FlexValuePointer
    var topPointer: FlexValuePointer
    var rightPointer: FlexValuePointer
    var bottomPointer: FlexValuePointer
    var startPointer: FlexValuePointer
    var endPointer: FlexValuePointer

    init(
        left: CGFloat? = FlexValue.None,
        top: CGFloat? = FlexValue.None,
        right: CGFloat? = FlexValue.None,
        bottom: CGFloat? = FlexValue.None,
        start: CGFloat? = FlexValue.None,
        end: CGFloat? = FlexValue.None
    ) {
        leftPointer = FlexValuePointer(left)
        topPointer = FlexValuePointer(top)
        rightPointer = FlexValuePointer(right)
        bottomPointer = FlexValuePointer(bottom)
        startPointer = FlexValuePointer(start)
        endPointer = FlexValuePointer(end)
    }

    init(
        left: FPercent? = nil,
        top: FPercent? = nil,
        right: FPercent? = nil,
        bottom: FPercent? = nil,
        start: FPercent? = nil,
        end: FPercent? = nil
    ) {
        leftPointer = FlexValuePointer(left)
        topPointer = FlexValuePointer(top)
        rightPointer = FlexValuePointer(right)
        bottomPointer = FlexValuePointer(bottom)
        startPointer = FlexValuePointer(start)
        endPointer = FlexValuePointer(end)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setNoOptionalValue(leftPointer, flex.left(_:), flex.left(_:))
        setNoOptionalValue(topPointer, flex.top(_:), flex.top(_:))
        setNoOptionalValue(rightPointer, flex.right(_:), flex.right(_:))
        setNoOptionalValue(bottomPointer, flex.bottom(_:), flex.bottom(_:))
        setNoOptionalValue(startPointer, flex.start(_:), flex.start(_:))
        setNoOptionalValue(endPointer, flex.end(_:), flex.end(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPositionModifierType {
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Modifier == FlexInsetModifier {
    @discardableResult
    func left(_ value: CGFloat) -> Self {
        modifier.leftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func left(_ percent: FPercent) -> Self {
        modifier.leftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func top(_ value: CGFloat) -> Self {
        modifier.topPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func top(_ percent: FPercent) -> Self {
        modifier.topPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func right(_ value: CGFloat) -> Self {
        modifier.rightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func right(_ percent: FPercent) -> Self {
        modifier.rightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> Self {
        modifier.bottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> Self {
        modifier.bottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func start(_ value: CGFloat) -> Self {
        modifier.startPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func start(_ percent: FPercent) -> Self {
        modifier.startPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func end(_ value: CGFloat) -> Self {
        modifier.endPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func end(_ percent: FPercent) -> Self {
        modifier.endPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> Self {
        return left(value).right(value)
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> Self {
        return left(percent).right(percent)
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> Self {
        return top(value).bottom(value)
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> Self {
        return top(percent).bottom(percent)
    }

    @discardableResult
    func all(_ value: CGFloat) -> Self {
        return left(value).top(value).right(value).bottom(value)
    }

    @discardableResult
    func all(_ percent: FPercent) -> Self {
        return left(percent).top(percent).right(percent).bottom(percent)
    }
}
