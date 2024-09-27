//
//  FlexZStackViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class FlexZStackViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexZStack"
        FlexRoot(flexView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexScrollStack()
                .layoutDirection(.vertical)
                .alwaysBounces(true)
                .showsScrollIndicator(true)
                .contentStack { stack in
                    stack.padding(10)
                        .spacing(vertical: 20)
                        .content {
                            // FlexZStack
                            FlexItem(createLabel(text: "FlexZStack", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexHStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                            }.padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple)
                            FlexVStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                            }.alignSelf(.center).padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple)
                            FlexItem(createLabel(text: "FlexZStack-RTL", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexHStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple).layoutDirection(.rtl)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple).layoutDirection(.rtl)
                            }.padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple).layoutDirection(.rtl)
                            FlexVStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple).layoutDirection(.rtl)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple).layoutDirection(.rtl)
                            }.alignSelf(.center).padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple).layoutDirection(.rtl)
                            FlexItem(createLabel(text: "Bottom"))
                        }
                }
        }.commit()
    }
}
