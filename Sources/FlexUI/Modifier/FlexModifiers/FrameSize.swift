//
//  FrameSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexSizeModifier: _FlexModifierType {
    var widthPointer: FlexValuePointer
    var heightPointer: FlexValuePointer

    init(sideLength: CGFloat) {
        widthPointer = FlexValuePointer(sideLength)
        heightPointer = FlexValuePointer(sideLength)
    }

    init(size: CGSize) {
        widthPointer = FlexValuePointer(size.width)
        heightPointer = FlexValuePointer(size.height)
    }

    init(width: CGFloat? = FlexValue.None, height: CGFloat? = FlexValue.None) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    init(width: FPercent? = nil, height: FPercent? = nil) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setValue(widthPointer, flex.width(_:), flex.width(_:))
        setValue(heightPointer, flex.height(_:), flex.height(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func frame(width: CGFloat? = FlexValue.None, height: CGFloat? = FlexValue.None) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func frame(width: CGFloat? = FlexValue.None, height: CGFloat? = FlexValue.None) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Modifier == FlexSizeModifier {
    @discardableResult
    func size(_ size: CGSize) -> Self {
        modifier.widthPointer.value = FlexValue(size.width)
        modifier.heightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> Self {
        modifier.widthPointer.value = FlexValue(sideLength)
        modifier.heightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func width(_ width: CGFloat?) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    @discardableResult
    func height(_ height: CGFloat?) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    @discardableResult
    func width(_ width: FPercent) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    @discardableResult
    func height(_ height: FPercent) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    @discardableResult
    func frame(width: CGFloat? = FlexValue.None, height: CGFloat? = FlexValue.None) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        modifier.heightPointer.value = FlexValue(height)
        return self
    }
}
