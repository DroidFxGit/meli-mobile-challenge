//
//  DetailCollectionViewCell.swift
//  MercadoLibre
//
//  Created by Carlos Vazquez on 23/01/22.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(image: UIImage) {
        imageView.image = image
    }
}

private extension DetailCollectionViewCell {
    func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
        configureConstraints()
    }
    
    func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
