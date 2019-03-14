//
//  MovieDetailViewController.swift
//  SearchMovie
//
//  Created by Xiaolu on 3/1/19.
//

import UIKit

internal let labelFontTitle : CGFloat = 20
internal let labelFontStandard : CGFloat = 15
internal let labelFontSmall : CGFloat = 13
private let layoutMargin : CGFloat = 20

class MovieDetailViewController: UIViewController {
    let movieImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image")
        image.widthAnchor.constraint(equalToConstant: 254).isActive = true
        image.heightAnchor.constraint(equalToConstant: 382).isActive = true
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
    let voteLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.boldSystemFont(ofSize: labelFontStandard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: labelFontStandard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let introLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: labelFontSmall)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.alwaysBounceVertical = true
        return view
    }()
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let movie : MovieViewModel
    let manager : DataManager
    
    init(_ movie: MovieViewModel, _ dataManger: DataManager) {
        self.movie = movie
        self.manager = dataManger
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //set up scroll view
        view.addSubview(scrollView)
        let safeArea = view.safeAreaLayoutGuide
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
        
        
        // set up text view and image
        let textStackView = UIStackView(arrangedSubviews: [movieImageView,titleLabel, voteLabel, dateLabel, introLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .center
        textStackView.distribution = .fill
        textStackView.spacing = 8
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textStackView)
        NSLayoutConstraint.activate([
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: layoutMargin),
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: layoutMargin),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -layoutMargin),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -layoutMargin),
            contentView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 1),
            ])
        setUpView()
    }
    
    private func setUpView(){
        titleLabel.text = movie.movieTitle
        introLabel.text = movie.introduction
        voteLabel.text = movie.voteMessage
        dateLabel.text = movie.releaseMessage
        if let imagepath = movie.imageURL{
            manager.getImage(imageURL: imagepath) { [weak self](result) in
                if case .success(let image) = result {
                    self?.movieImageView.image = image
                }
            }
        }
    }
}
