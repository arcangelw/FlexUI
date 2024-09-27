//
//  TextureZStackViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import AsyncDisplayKit
import TextureSwiftSupport
import UIKit

final class TextureZStackViewController: DisplayNodeViewController {
    let scrollNode = ASScrollNode()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ZStackLayout"
        view.backgroundColor = .white
        scrollNode.scrollableDirections = .down
        scrollNode.automaticallyManagesSubnodes = true
        scrollNode.automaticallyManagesContentSize = true
        scrollNode.view.alwaysBounceVertical = true
        scrollNode.layoutSpecBlock = { [weak self] _, constrainedSize in
            guard let self = self else {
                return ASWrapperLayoutSpec(layoutElements: [])
            }
            return self.scrollLayoutSpecThatFits(constrainedSize)
        }
    }

    func scrollLayoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        LayoutSpec {
            VStackLayout {
                VStackLayout(spacing: 20) {
                    createTextNode(text: "ZStackLayout", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor)
                    HStackLayout(spacing: 20) {
                        ZStackLayout {
                            createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                            createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                            createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                            createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                        }
                        .background {
                            let node = ASDisplayNode()
                            node.backgroundColor = .white
                            node.borderColor = UIColor.purple.cgColor
                            node.borderWidth = 0.5
                            return node
                        }

                        ZStackLayout {
                            createImageNode().aspectRatio(0.5)
                            createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                            createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                            createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                            createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                        }
                        .background {
                            let node = ASDisplayNode()
                            node.backgroundColor = .white
                            node.borderColor = UIColor.purple.cgColor
                            node.borderWidth = 0.5
                            return node
                        }
                    }
                    .padding(10)
                    .background {
                        let node = ASDisplayNode()
                        node.backgroundColor = .lightRandomColor
                        node.borderColor = UIColor.darkRandomColor.cgColor
                        node.borderWidth = 0.5
                        return node
                    }
                    VStackLayout(spacing: 20) {
                        ZStackLayout {
                            createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                            createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                            createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                            createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                        }
                        .background {
                            let node = ASDisplayNode()
                            node.backgroundColor = .white
                            node.borderColor = UIColor.purple.cgColor
                            node.borderWidth = 0.5
                            return node
                        }

                        ZStackLayout {
                            createImageNode().aspectRatio(0.5)
                            createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                            createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                            createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                            createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                        }
                        .background {
                            let node = ASDisplayNode()
                            node.backgroundColor = .white
                            node.borderColor = UIColor.purple.cgColor
                            node.borderWidth = 0.5
                            return node
                        }
                    }
                    .padding(10)
                    .background {
                        let node = ASDisplayNode()
                        node.backgroundColor = .lightRandomColor
                        node.borderColor = UIColor.darkRandomColor.cgColor
                        node.borderWidth = 0.5
                        return node
                    }
                    createTextNode(text: "ZStackLayout-RTL", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor)
                    createRTLBackgroundNode(borderColor: .darkRandomColor, layoutSpecBlock: { _, _ in
                        LayoutSpec {
                            HStackLayout(spacing: 20) {
                                self.createRTLBackgroundNode(borderColor: .purple, layoutSpecBlock: { _, _ in
                                    LayoutSpec {
                                        ZStackLayout {
                                            self.createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                                            self.createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                                            self.createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                                            self.createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                                        }
                                    }
                                }).setBackgroundColor(.white)
                                self.createRTLBackgroundNode(borderColor: .purple, layoutSpecBlock: { _, _ in
                                    LayoutSpec {
                                        ZStackLayout {
                                            self.createImageNode().aspectRatio(0.5)
                                            self.createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                                            self.createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                                            self.createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                                            self.createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                                        }
                                    }
                                }).setBackgroundColor(.white)
                            }
                            .padding(10)
                        }
                    }).setBackgroundColor(.lightRandomColor)
                    createRTLBackgroundNode(borderColor: .darkRandomColor, layoutSpecBlock: { _, _ in
                        LayoutSpec {
                            VStackLayout(spacing: 20) {
                                self.createRTLBackgroundNode(borderColor: .purple, layoutSpecBlock: { _, _ in
                                    LayoutSpec {
                                        ZStackLayout {
                                            self.createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                                            self.createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                                            self.createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                                            self.createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                                        }
                                    }
                                }).setBackgroundColor(.white)
                                self.createRTLBackgroundNode(borderColor: .purple, layoutSpecBlock: { _, _ in
                                    LayoutSpec {
                                        ZStackLayout {
                                            self.createImageNode().aspectRatio(0.5)
                                            self.createTextNode(text: "Stack zIndex 1", textColor: .red, backgroundColor: .clear).minHeight(200)
                                            self.createTextNode(text: "Stack zIndex 2", textColor: .green, backgroundColor: .clear).minHeight(150)
                                            self.createTextNode(text: "Stack zIndex 3", textColor: .blue, backgroundColor: .clear).minHeight(100)
                                            self.createTextNode(text: "Stack zIndex 4 zIndex", textColor: .orange, backgroundColor: .clear).minHeight(50)
                                        }
                                    }
                                }).setBackgroundColor(.white)
                            }
                            .padding(10)
                        }
                    }).setBackgroundColor(.lightRandomColor)
                    createTextNode(text: "Bottom")
                }.padding(10)
            }
        }
    }

    override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        LayoutSpec {
            ZStackLayout {
                scrollNode
            }
            .padding(capturedSafeAreaInsets)
        }
    }

    func createTextNode(
        text: String,
        font: UIFont = UIFont.systemFont(ofSize: 16),
        textColor: UIColor = .white,
        backgroundColor: UIColor = .darkRandomColor
    ) -> AnyDisplayNode {
        let textNode = ASTextNode()
        textNode.maximumNumberOfLines = 0
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributedText.length))
        attributedText.addAttribute(.foregroundColor, value: textColor, range: NSRange(location: 0, length: attributedText.length))
        textNode.attributedText = attributedText
        let node = AnyDisplayNode.init { _, _ in
            LayoutSpec {
                VStackLayout(justifyContent: .center) {
                    textNode
                }
            }
        }
        node.backgroundColor = backgroundColor
        node.borderColor = textColor.cgColor
        node.borderWidth = 0.5
        return node
    }

    func createImageNode() -> ASImageNode {
        let node = ASImageNode()
        node.image = .image(color: .systemBlue, size: .init(width: 60, height: 100))
        return node
    }

    func createRTLBackgroundNode(borderColor: UIColor, layoutSpecBlock: @escaping (AnyDisplayNode, ASSizeRange) -> ASLayoutSpec) -> AnyDisplayNode {
        let node = AnyDisplayNode(layoutSpecBlock: layoutSpecBlock)
        node.semanticContentAttribute = .forceRightToLeft
        node.borderColor = borderColor.cgColor
        node.borderWidth = 0.5
        return node
    }
}
