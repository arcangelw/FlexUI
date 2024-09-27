//
//  FlexValue.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

public enum FlexValue {
    public static let None: CGFloat = .infinity
    case none
    case point(_ value: CGFloat?)
    case percent(_ percent: FPercent)

    public init(_ value: CGFloat?) {
        if value == Self.None {
            self = .none
        } else {
            self = .point(value)
        }
    }

    public init(_ percent: FPercent?) {
        if let percent {
            self = .percent(percent)
        } else {
            self = .none
        }
    }
}

typealias FlexValuePointer = UnsafeMutablePointer<FlexValue>

extension UnsafeMutablePointer {
    var value: Pointee {
        get {
            return pointee
        }
        nonmutating set {
            pointee = newValue
        }
    }

    init(value: Pointee) {
        self = .allocate(capacity: 1)
        initialize(to: value)
    }
}

extension UnsafeMutablePointer where Pointee == FlexValue {
    init(_ floatValue: CGFloat?) {
        self.init(value: FlexValue(floatValue))
    }

    init(_ percentValue: FPercent?) {
        self.init(value: FlexValue(percentValue))
    }
}
