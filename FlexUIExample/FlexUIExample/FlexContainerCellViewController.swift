//
//  FlexContainerCellViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class Cell: FlexContainerCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byCharWrapping
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private let mediaLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byCharWrapping
        return label
    }()

    override func setUpFlex() {
        flexibleMode = .flexibleHeight
        FlexRoot(flexContentView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexHStack(spacing: 10, justifyContent: .start, alignItems: .end) {
                FlexItem(UIImageView()).size(24).backgroundColor(.lightRandomColor).cornerRadius(12)
                FlexItem(nameLabel).backgroundColor(.quaternaryLabel)
            }.alignSelf(.start)
            FlexSpacer(minLength: 10)
            FlexItem(titleLabel)
            FlexSpacer(minLength: 10)
            FlexHStack(spacing: 10, justifyContent: .start, alignItems: .center) {
                FlexItem(UIImageView()).size(20).backgroundColor(.darkRandomColor).cornerRadius(4)
                FlexItem(mediaLabel).backgroundColor(.tertiaryLabel)
            }.alignSelf(.end)
        }.padding(10).backgroundColor(.lightRandomColor).commit()
    }

    func setIndexPath(_ indexPath: IndexPath) {
        flexContentView.backgroundColor = .lightRandomColor
        nameLabel.text = indexPath.description
        nameLabel.flex.markDirty()
        titleLabel.text = (0 ... (indexPath.item + 1)).map { "\($0)" }.joined(separator: ",")
        titleLabel.flex.markDirty()
        mediaLabel.text = indexPath.description
        mediaLabel.flex.markDirty()
    }
}

final class FlexContainerCellViewController: BasicViewController, UICollectionViewDataSource {
    private let collectionView: UICollectionView = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let listLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
        return collectionView
    }()

    override func setUpFlex() {
        title = "FlexContainerCell"
        FlexRoot(flexView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexItem(collectionView).grow(1).shrink(1)
        }.commit()
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.setIndexPath(indexPath)
        return cell
    }
}
