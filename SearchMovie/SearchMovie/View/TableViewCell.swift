//
//  TableViewCell.swift
//  SearchMovie
//
//  Created by Xiaolu on 3/1/19.
//
import UIKit

private let layoutMargin : CGFloat = 8

class TableViewCell: UITableViewCell {
    let movieImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image")
        image.widthAnchor.constraint(equalToConstant: 127).isActive = true
        image.heightAnchor.constraint(equalToConstant: 191).isActive = true
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: labelFontTitle)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: labelFontSmall)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static func cellIdentifier() -> String {
        return "\(TableViewCell.self)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)        
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, detailLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .fill
        textStackView.distribution = .fillEqually
        textStackView.spacing = 5
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(textStackView)
        self.contentView.addSubview(movieImageView)
        
        NSLayoutConstraint.activate([
            movieImageView.trailingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: -layoutMargin),
            movieImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: layoutMargin),
            movieImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: layoutMargin),
            textStackView.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor),
            textStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -layoutMargin),
            ])
        
        let constraint = movieImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -layoutMargin)
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = UIImage(named: "Image")
        titleLabel.text = nil
        detailLabel.text = nil
    }
    
}
