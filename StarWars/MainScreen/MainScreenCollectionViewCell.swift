//
//  MainScreenCollectionViewCell.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 29.01.2023.
//

import UIKit

final class MainScreenCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "films")
        imageView.contentMode = .center
        return imageView
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Films"
        label.font = UIFont(name: "Arial-BoldItalicMT", size: 17)
        label.textColor = .white
        label.backgroundColor = .lightGray
        return label
    }()

    // MARK: - Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 50.0
        self.contentView.layer.masksToBounds = true
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
    }

    // MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        categoryImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height
        )

        categoryLabel.frame = CGRect(
            x: 0,
            y: (categoryImageView.bounds.height / 1.18),
            width: categoryImageView.bounds.width,
            height: 22
        )
    }

    // MARK: - Methods

    func configure(label: String, image: UIImage) {
        categoryLabel.text = label
        categoryImageView.image = image
    }
}
