//
//  CategoryCollectionViewCell.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 31.01.2023.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "species")
        imageView.contentMode = .center
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Species"
        label.font = UIFont(name: "Arial-BoldItalicMT", size: 22)
        label.numberOfLines = 2
        label.backgroundColor = .clear
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1965"
        label.font = UIFont(name: "Arial-BoldItalicMT", size: 22)
        label.numberOfLines = 2
        label.backgroundColor = .clear
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .white
        return label
    }()
    

    // MARK: - Override init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 30.0
        self.contentView.layer.masksToBounds = true
        contentView.addSubview(categoryImageView)
        categoryImageView.addSubview(nameLabel)
        categoryImageView.addSubview(titleLabel)
    }

    // MARK: - Required init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        categoryImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height - 10)
        nameLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 10)
        titleLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 10)

    }

    // MARK: - Methods

    func configure(name: String?, title: String?, image: UIImage) {
        categoryImageView.image = image
        nameLabel.text = name
        titleLabel.text = title
    }
}
