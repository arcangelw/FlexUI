//
//  BasicViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

extension UIColor {
    static var darkRandomColor: UIColor {
        UIColor(red: .random(in: 0.0 ... 0.5), green: .random(in: 0.0 ... 0.5), blue: .random(in: 0.0 ... 0.5), alpha: 1)
    }

    static var lightRandomColor: UIColor {
        UIColor(red: .random(in: 0.5 ... 1.0), green: .random(in: 0.5 ... 1.0), blue: .random(in: 0.5 ... 1.0), alpha: 1)
    }
}

extension UIImage {
    static func image(color: UIColor, size: CGSize = .init(width: 1.0, height: 1.0), cornerRadius: CGFloat = 0.0) -> Self? {
        let cgColor = color.cgColor
        let opaque = cornerRadius.isZero && cgColor.alpha.isEqual(to: 1.0)
        let rect = CGRect(origin: .zero, size: size)
        return image(size: size, opaque: opaque, scale: UIScreen.main.scale) { context in
            context.setFillColor(cgColor)
            if cornerRadius.isZero {
                context.fill(rect)
            } else {
                let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
                path.addClip()
                path.fill()
            }
        }
    }

    static func image(size: CGSize, opaque: Bool = false, scale: CGFloat = 0, actions: (CGContext) -> Void) -> Self? {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = opaque
        format.scale = max(0.0, scale)
        let imageRenderer = UIGraphicsImageRenderer(size: size, format: format)
        let image = imageRenderer.image { rendererContext in
            actions(rendererContext.cgContext)
        }
        guard let cgImage = image.cgImage else { return nil }
        return Self(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
    }
}

class BasicViewController: FlexViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyRelayoutOnSafeAreaChanges = false
        view.backgroundColor = .systemBackground
    }

    func createLabels(maxCount: Int, title: String) -> [UILabel] {
        let titles = (1 ... maxCount).map { "\(title) \($0)" }
        var labels: [UILabel] = []
        for title in titles {
            labels.append(createLabel(text: title))
        }
        return labels
    }

    func createLabel(
        text: String,
        font: UIFont = UIFont.systemFont(ofSize: 16),
        textColor: UIColor = .white,
        backgroundColor: UIColor = .darkRandomColor
    ) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        return label
    }

    func createButton(
        text: String,
        font: UIFont = UIFont.systemFont(ofSize: 20),
        textColor: UIColor = .label,
        backgroundColor: UIColor = .lightRandomColor
    ) -> FlexHStack<UIControl> {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        return FlexHStack<UIControl>(UIControl(), justifyContent: .start, alignItems: .center) {
            FlexItem(label).margin(5)
        }.backgroundColor(backgroundColor)
    }
}
