//
//  PositionMargins.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexMarginModifier: _FlexModifierType {
    var marginLeftPointer: FlexValuePointer
    var marginTopPointer: FlexValuePointer
    var marginRightPointer: FlexValuePointer
    var marginBottomPointer: FlexValuePointer
    var marginStartPointer: FlexValuePointer
    var marginEndPointer: FlexValuePointer
    var marginHorizontalPointer: FlexValuePointer
    var marginVerticalPointer: FlexValuePointer
    var marginPointer: FlexValuePointer

    init(
        marginLeft: CGFloat? = FlexValue.None,
        marginTop: CGFloat? = FlexValue.None,
        marginRight: CGFloat? = FlexValue.None,
        marginBottom: CGFloat? = FlexValue.None,
        marginStart: CGFloat? = FlexValue.None,
        marginEnd: CGFloat? = FlexValue.None,
        marginHorizontal: CGFloat? = FlexValue.None,
        marginVertical: CGFloat? = FlexValue.None,
        margin: CGFloat? = FlexValue.None
    ) {
        marginLeftPointer = FlexValuePointer(marginLeft)
        marginTopPointer = FlexValuePointer(marginTop)
        marginRightPointer = FlexValuePointer(marginRight)
        marginBottomPointer = FlexValuePointer(marginBottom)
        marginStartPointer = FlexValuePointer(marginStart)
        marginEndPointer = FlexValuePointer(marginEnd)
        marginHorizontalPointer = FlexValuePointer(marginHorizontal)
        marginVerticalPointer = FlexValuePointer(marginVertical)
        marginPointer = FlexValuePointer(margin)
    }

    init(
        marginLeft: FPercent? = nil,
        marginTop: FPercent? = nil,
        marginRight: FPercent? = nil,
        marginBottom: FPercent? = nil,
        marginStart: FPercent? = nil,
        marginEnd: FPercent? = nil,
        marginHorizontal: FPercent? = nil,
        marginVertical: FPercent? = nil,
        margin: FPercent? = nil
    ) {
        marginLeftPointer = FlexValuePointer(marginLeft)
        marginTopPointer = FlexValuePointer(marginTop)
        marginRightPointer = FlexValuePointer(marginRight)
        marginBottomPointer = FlexValuePointer(marginBottom)
        marginStartPointer = FlexValuePointer(marginStart)
        marginEndPointer = FlexValuePointer(marginEnd)
        marginHorizontalPointer = FlexValuePointer(marginHorizontal)
        marginVerticalPointer = FlexValuePointer(marginVertical)
        marginPointer = FlexValuePointer(margin)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setNoOptionalValue(marginLeftPointer, flex.marginLeft(_:), flex.marginLeft(_:))
        setNoOptionalValue(marginTopPointer, flex.marginTop(_:), flex.marginTop(_:))
        setNoOptionalValue(marginRightPointer, flex.marginRight(_:), flex.marginRight(_:))
        setNoOptionalValue(marginBottomPointer, flex.marginBottom(_:), flex.marginBottom(_:))
        setNoOptionalValue(marginStartPointer, flex.marginStart(_:), flex.marginStart(_:))
        setNoOptionalValue(marginEndPointer, flex.marginEnd(_:), flex.marginEnd(_:))
        setNoOptionalValue(marginHorizontalPointer, flex.marginHorizontal(_:), flex.marginHorizontal(_:))
        setNoOptionalValue(marginVerticalPointer, flex.marginVertical(_:), flex.marginVertical(_:))
        setNoOptionalValue(marginPointer, flex.margin(_:), flex.margin(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPositionModifierType {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: value))
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: percent))
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: value))
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: percent))
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: value))
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: percent))
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: value))
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: percent))
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: value))
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: percent))
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: value))
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: percent))
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: value))
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: percent))
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: value))
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: percent))
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: insets.left, marginTop: insets.top, marginRight: insets.right, marginBottom: insets.bottom))
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: directionalInsets.top, marginBottom: directionalInsets.bottom, marginStart: directionalInsets.leading, marginEnd: directionalInsets.trailing))
    }

    @discardableResult
    func margin(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: value))
    }

    @discardableResult
    func margin(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: percent))
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: value))
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: percent))
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: value))
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: percent))
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: value))
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: percent))
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: value))
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: percent))
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: value))
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: percent))
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: value))
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: percent))
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: value))
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: percent))
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: value))
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: percent))
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: insets.left, marginTop: insets.top, marginRight: insets.right, marginBottom: insets.bottom))
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: directionalInsets.top, marginBottom: directionalInsets.bottom, marginStart: directionalInsets.leading, marginEnd: directionalInsets.trailing))
    }

    @discardableResult
    func margin(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: value))
    }

    @discardableResult
    func margin(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: percent))
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }
}

public extension FlexModifiedContent where Modifier == FlexMarginModifier {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> Self {
        modifier.marginLeftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> Self {
        modifier.marginLeftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> Self {
        modifier.marginTopPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> Self {
        modifier.marginTopPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> Self {
        modifier.marginRightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> Self {
        modifier.marginRightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> Self {
        modifier.marginBottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> Self {
        modifier.marginBottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> Self {
        modifier.marginStartPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> Self {
        modifier.marginStartPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> Self {
        modifier.marginEndPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> Self {
        modifier.marginEndPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> Self {
        modifier.marginHorizontalPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> Self {
        modifier.marginHorizontalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> Self {
        modifier.marginVerticalPointer.value = FlexValue(value)
        return marginTop(value).marginBottom(value)
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> Self {
        modifier.marginVerticalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> Self {
        marginLeft(insets.left).marginTop(insets.top).marginRight(insets.right).marginBottom(insets.bottom)
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> Self {
        marginStart(directionalInsets.leading).marginTop(directionalInsets.top).marginEnd(directionalInsets.trailing).marginBottom(directionalInsets.bottom)
    }

    @discardableResult
    func margin(_ value: CGFloat) -> Self {
        modifier.marginPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func margin(_ percent: FPercent) -> Self {
        modifier.marginPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> Self {
        marginVertical(vertical).marginHorizontal(horizontal)
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> Self {
        marginVertical(vertical).marginHorizontal(horizontal)
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Self {
        marginTop(top).marginHorizontal(horizontal).marginBottom(bottom)
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> Self {
        marginTop(top).marginHorizontal(horizontal).marginBottom(bottom)
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        marginTop(top).marginLeft(left).marginBottom(bottom).marginRight(right)
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> Self {
        marginTop(top).marginLeft(left).marginBottom(bottom).marginRight(right)
    }
}
