//
//  FrameMinSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexMiniSizeModifier: _FlexModifierType {
    var minWidthPointer: FlexValuePointer
    var minHeightPointer: FlexValuePointer

    init(sideLength: CGFloat) {
        minWidthPointer = FlexValuePointer(sideLength)
        minHeightPointer = FlexValuePointer(sideLength)
    }

    init(size: CGSize) {
        minWidthPointer = FlexValuePointer(size.width)
        minHeightPointer = FlexValuePointer(size.height)
    }

    init(minWidth: CGFloat? = FlexValue.None, minHeight: CGFloat? = FlexValue.None) {
        minWidthPointer = FlexValuePointer(minWidth)
        minHeightPointer = FlexValuePointer(minHeight)
    }

    init(minWidth: FPercent? = nil, minHeight: FPercent? = nil) {
        minWidthPointer = FlexValuePointer(minWidth)
        minHeightPointer = FlexValuePointer(minHeight)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setValue(minWidthPointer, flex.minWidth(_:), flex.minWidth(_:))
        setValue(minHeightPointer, flex.minHeight(_:), flex.minHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func frame(minWidth: CGFloat? = FlexValue.None, minHeight: CGFloat? = FlexValue.None) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func frame(minWidth: CGFloat? = FlexValue.None, minHeight: CGFloat? = FlexValue.None) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Modifier == FlexMiniSizeModifier {
    @discardableResult
    func minSize(_ size: CGSize) -> Self {
        modifier.minWidthPointer.value = FlexValue(size.width)
        modifier.minHeightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> Self {
        modifier.minWidthPointer.value = FlexValue(sideLength)
        modifier.minHeightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    @discardableResult
    func frame(minWidth: CGFloat? = FlexValue.None, minHeight: CGFloat? = FlexValue.None) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }
}
