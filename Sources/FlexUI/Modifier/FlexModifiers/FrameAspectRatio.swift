//
//  FrameAspectRatio.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public struct FlexAspectRatioModifier: _FlexModifierType {
    var valuePointer: FlexValuePointer

    init(_ value: CGFloat? = FlexValue.None) {
        valuePointer = FlexValuePointer(value)
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        if case let .point(value) = valuePointer.value {
            element.view.flex.aspectRatio(value)
        }
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> FlexModifiedContent<Self, FlexAspectRatioModifier> {
        modifier(FlexAspectRatioModifier(value))
    }

    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> FlexModifiedContent<Self, FlexAspectRatioModifier> {
        return aspectRatio(imageView.aspectRatio)
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> FlexModifiedContent<Content, FlexAspectRatioModifier> {
        modifier(FlexAspectRatioModifier(value))
    }

    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> FlexModifiedContent<Content, FlexAspectRatioModifier> {
        return aspectRatio(imageView.aspectRatio)
    }
}

public extension FlexModifiedContent where Modifier == FlexAspectRatioModifier {
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> Self {
        modifier.valuePointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> Self {
        return aspectRatio(imageView.aspectRatio)
    }
}

private extension UIImageView {
    var aspectRatio: CGFloat? {
        guard let imageSize = image?.size else { return nil }
        return imageSize.width / imageSize.height
    }
}
