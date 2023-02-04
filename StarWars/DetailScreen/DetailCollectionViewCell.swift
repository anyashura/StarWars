//
//  DetailCollectionViewCell.swift
//  StarWars
//
//  Created by Anna Shuryaeva on 03.02.2023.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    // MARK: - Enum
    private enum Constants {
        static let fontName = "Arial-BoldItalicMT"
    }

    // MARK: - Properties
    private lazy var picture: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "")
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.darkGray.cgColor
        image.layer.borderWidth = 1
        image.layer.masksToBounds = true
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()

    private let infoTextView: UITextView = {
        let text = UITextView()
        text.textAlignment = .natural
        text.isEditable = false
        text.isSelectable = false
        text.font = UIFont(name: Constants.fontName, size: 18)
        text.showsVerticalScrollIndicator = false
        text.backgroundColor = .clear
        text.textColor = .white
        return text
    }()

    // MARK: - Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(picture)
        contentView.addSubview(infoTextView)
    }

    // MARK: - Required init

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        picture.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.left.right.equalTo(contentView).inset(10)
            $0.bottom.equalTo(contentView.snp.centerY)
        }
        infoTextView.snp.makeConstraints {
            $0.left.right.equalTo(contentView).inset(20)
            $0.top.equalTo(contentView.snp.centerY)
            $0.bottom.equalTo(contentView)
        }
    }

    // MARK: - Methods
    func configurePicture(image: UIImage) {
        picture.image = image
    }

    func addText(_ text: String) {
        infoTextView.text = text
    }
}
