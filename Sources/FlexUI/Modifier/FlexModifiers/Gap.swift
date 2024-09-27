//
//  Gap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

@available(*, deprecated, renamed: "FlexSpacingModifier", message: "Will be removed in a future major release.")
public typealias FlexGapModifier = FlexSpacingModifier
@available(*, deprecated, renamed: "_FlexSpacingModifierType", message: "Will be removed in a future major release.")
public typealias _FlexGapModifierType = _FlexSpacingModifierType

public protocol _FlexSpacingModifierType {}

public struct FlexSpacingModifier: _FlexModifierType {
    var horizontalSpacingPointer: FlexValuePointer
    var verticalSpacingPointer: FlexValuePointer
    var spacingPointer: FlexValuePointer

    init(
        columnGap: CGFloat? = FlexValue.None,
        rowGap: CGFloat? = FlexValue.None,
        gap: CGFloat? = FlexValue.None
    ) {
        horizontalSpacingPointer = FlexValuePointer(columnGap)
        verticalSpacingPointer = FlexValuePointer(rowGap)
        spacingPointer = FlexValuePointer(gap)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        setNoOptionalValue(horizontalSpacingPointer, flex.columnGap(_:), nil)
        setNoOptionalValue(verticalSpacingPointer, flex.rowGap(_:), nil)
        setNoOptionalValue(spacingPointer, flex.gap(_:), nil)
        return element
    }
}

public extension _FlexViewType where Self: _FlexSpacingModifierType {
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(horizontal: value)
    }

    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(vertical: value)
    }

    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(value)
    }

    @discardableResult
    func spacing(horizontal value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(columnGap: value))
    }

    @discardableResult
    func spacing(vertical value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(rowGap: value))
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(gap: value))
    }
}

public extension FlexModifiedContent where Content: _FlexSpacingModifierType {
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(horizontal: value)
    }

    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(vertical: value)
    }

    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(value)
    }

    @discardableResult
    func spacing(horizontal value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(columnGap: value))
    }

    @discardableResult
    func spacing(vertical value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(rowGap: value))
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(gap: value))
    }
}

public extension FlexModifiedContent where Modifier == FlexSpacingModifier {
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> Self {
        return spacing(horizontal: value)
    }

    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> Self {
        return spacing(vertical: value)
    }

    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> Self {
        return spacing(value)
    }

    @discardableResult
    func spacing(horizontal value: CGFloat) -> Self {
        modifier.horizontalSpacingPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func spacing(vertical value: CGFloat) -> Self {
        modifier.verticalSpacingPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        modifier.spacingPointer.value = FlexValue(value)
        return self
    }
}
