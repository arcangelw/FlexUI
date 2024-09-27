//
//  FrameMaxSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexMaxSizeModifier: _FlexModifierType {
    var maxWidthPointer: FlexValuePointer
    var maxHeightPointer: FlexValuePointer

    init(sideLength: CGFloat) {
        maxWidthPointer = FlexValuePointer(sideLength)
        maxHeightPointer = FlexValuePointer(sideLength)
    }

    init(size: CGSize) {
        maxWidthPointer = FlexValuePointer(size.width)
        maxHeightPointer = FlexValuePointer(size.height)
    }

    init(maxWidth: CGFloat? = FlexValue.None, maxHeight: CGFloat? = FlexValue.None) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    init(maxWidth: FPercent? = nil, maxHeight: FPercent? = nil) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setValue(maxWidthPointer, flex.maxWidth(_:), flex.maxWidth(_:))
        setValue(maxHeightPointer, flex.maxHeight(_:), flex.maxHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = FlexValue.None, maxHeight: CGFloat? = FlexValue.None) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = FlexValue.None, maxHeight: CGFloat? = FlexValue.None) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Modifier == FlexMaxSizeModifier {
    @discardableResult
    func maxSize(_ size: CGSize) -> Self {
        modifier.maxWidthPointer.value = FlexValue(size.width)
        modifier.maxHeightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> Self {
        modifier.maxWidthPointer.value = FlexValue(sideLength)
        modifier.maxHeightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = FlexValue.None, maxHeight: CGFloat? = FlexValue.None) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }
}
