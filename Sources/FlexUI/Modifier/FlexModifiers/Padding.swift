//
//  Padding.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexPaddingModifierType {}

public struct FlexPaddingModifier: _FlexModifierType {
    var paddingLeftPointer: FlexValuePointer
    var paddingTopPointer: FlexValuePointer
    var paddingRightPointer: FlexValuePointer
    var paddingBottomPointer: FlexValuePointer
    var paddingStartPointer: FlexValuePointer
    var paddingEndPointer: FlexValuePointer
    var paddingHorizontalPointer: FlexValuePointer
    var paddingVerticalPointer: FlexValuePointer
    var paddingPointer: FlexValuePointer

    init(
        paddingLeft: CGFloat? = FlexValue.None,
        paddingTop: CGFloat? = FlexValue.None,
        paddingRight: CGFloat? = FlexValue.None,
        paddingBottom: CGFloat? = FlexValue.None,
        paddingStart: CGFloat? = FlexValue.None,
        paddingEnd: CGFloat? = FlexValue.None,
        paddingHorizontal: CGFloat? = FlexValue.None,
        paddingVertical: CGFloat? = FlexValue.None,
        padding: CGFloat? = FlexValue.None
    ) {
        paddingLeftPointer = FlexValuePointer(paddingLeft)
        paddingTopPointer = FlexValuePointer(paddingTop)
        paddingRightPointer = FlexValuePointer(paddingRight)
        paddingBottomPointer = FlexValuePointer(paddingBottom)
        paddingStartPointer = FlexValuePointer(paddingStart)
        paddingEndPointer = FlexValuePointer(paddingEnd)
        paddingHorizontalPointer = FlexValuePointer(paddingHorizontal)
        paddingVerticalPointer = FlexValuePointer(paddingVertical)
        paddingPointer = FlexValuePointer(padding)
    }

    init(
        paddingLeft: FPercent? = nil,
        paddingTop: FPercent? = nil,
        paddingRight: FPercent? = nil,
        paddingBottom: FPercent? = nil,
        paddingStart: FPercent? = nil,
        paddingEnd: FPercent? = nil,
        paddingHorizontal: FPercent? = nil,
        paddingVertical: FPercent? = nil,
        padding: FPercent? = nil
    ) {
        paddingLeftPointer = FlexValuePointer(paddingLeft)
        paddingTopPointer = FlexValuePointer(paddingTop)
        paddingRightPointer = FlexValuePointer(paddingRight)
        paddingBottomPointer = FlexValuePointer(paddingBottom)
        paddingStartPointer = FlexValuePointer(paddingStart)
        paddingEndPointer = FlexValuePointer(paddingEnd)
        paddingHorizontalPointer = FlexValuePointer(paddingHorizontal)
        paddingVerticalPointer = FlexValuePointer(paddingVertical)
        paddingPointer = FlexValuePointer(padding)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setNoOptionalValue(paddingLeftPointer, flex.paddingLeft(_:), flex.paddingLeft(_:))
        setNoOptionalValue(paddingTopPointer, flex.paddingTop(_:), flex.paddingTop(_:))
        setNoOptionalValue(paddingRightPointer, flex.paddingRight(_:), flex.paddingRight(_:))
        setNoOptionalValue(paddingBottomPointer, flex.paddingBottom(_:), flex.paddingBottom(_:))
        setNoOptionalValue(paddingStartPointer, flex.paddingStart(_:), flex.paddingStart(_:))
        setNoOptionalValue(paddingEndPointer, flex.paddingEnd(_:), flex.paddingEnd(_:))
        setNoOptionalValue(paddingHorizontalPointer, flex.paddingHorizontal(_:), flex.paddingHorizontal(_:))
        setNoOptionalValue(paddingVerticalPointer, flex.paddingVertical(_:), flex.paddingVertical(_:))
        setNoOptionalValue(paddingPointer, flex.padding(_:), flex.padding(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPaddingModifierType {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: value))
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: percent))
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: value))
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: percent))
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: value))
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: percent))
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: value))
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: percent))
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: value))
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: percent))
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: value))
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: percent))
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: value))
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: percent))
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: value))
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: percent))
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: insets.left, paddingTop: insets.top, paddingRight: insets.right, paddingBottom: insets.bottom))
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: directionalInsets.top, paddingBottom: directionalInsets.bottom, paddingStart: directionalInsets.leading, paddingEnd: directionalInsets.trailing))
    }

    @discardableResult
    func padding(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: value))
    }

    @discardableResult
    func padding(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: percent))
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexPaddingModifierType {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: value))
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: percent))
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: value))
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: percent))
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: value))
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: percent))
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: value))
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: percent))
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: value))
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: percent))
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: value))
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: percent))
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: value))
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: percent))
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: value))
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: percent))
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: insets.left, paddingTop: insets.top, paddingRight: insets.right, paddingBottom: insets.bottom))
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: directionalInsets.top, paddingBottom: directionalInsets.bottom, paddingStart: directionalInsets.leading, paddingEnd: directionalInsets.trailing))
    }

    @discardableResult
    func padding(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: value))
    }

    @discardableResult
    func padding(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: percent))
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }
}

public extension FlexModifiedContent where Modifier == FlexPaddingModifier {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> Self {
        modifier.paddingLeftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> Self {
        modifier.paddingLeftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> Self {
        modifier.paddingTopPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> Self {
        modifier.paddingTopPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> Self {
        modifier.paddingRightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> Self {
        modifier.paddingRightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> Self {
        modifier.paddingBottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> Self {
        modifier.paddingBottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> Self {
        modifier.paddingStartPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> Self {
        modifier.paddingStartPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> Self {
        modifier.paddingEndPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> Self {
        modifier.paddingEndPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> Self {
        modifier.paddingHorizontalPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> Self {
        modifier.paddingHorizontalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> Self {
        modifier.paddingVerticalPointer.value = FlexValue(value)
        return paddingTop(value).paddingBottom(value)
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> Self {
        modifier.paddingVerticalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> Self {
        paddingLeft(insets.left).paddingTop(insets.top).paddingRight(insets.right).paddingBottom(insets.bottom)
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> Self {
        paddingStart(directionalInsets.leading).paddingTop(directionalInsets.top).paddingEnd(directionalInsets.trailing).paddingBottom(directionalInsets.bottom)
    }

    @discardableResult
    func padding(_ value: CGFloat) -> Self {
        modifier.paddingPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func padding(_ percent: FPercent) -> Self {
        modifier.paddingPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> Self {
        paddingVertical(vertical).paddingHorizontal(horizontal)
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> Self {
        paddingVertical(vertical).paddingHorizontal(horizontal)
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Self {
        paddingTop(top).paddingHorizontal(horizontal).paddingBottom(bottom)
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> Self {
        paddingTop(top).paddingHorizontal(horizontal).paddingBottom(bottom)
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        paddingTop(top).paddingLeft(left).paddingBottom(bottom).paddingRight(right)
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> Self {
        paddingTop(top).paddingLeft(left).paddingBottom(bottom).paddingRight(right)
    }
}
