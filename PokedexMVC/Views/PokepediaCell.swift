//  PokepediaCell.swift
//  PokedexMVC
//
//  Created by Aleksej Shapran on 09.05.23

import UIKit

protocol PokepediaCellDelegate { func presentInfoView(withPokemon pokemon: Pokemon) }

class PokepediaCell: UICollectionViewCell {
    
    var delegate: PokepediaCellDelegate?
    var pokemon: Pokemon? {
        
        didSet {
            
            nameLabel.text = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
        }
    }
    
    let imageView: UIImageView = {
        
        let backImage = UIImageView()
        backImage.backgroundColor = .systemCyan.withAlphaComponent(0.2)
        backImage.contentMode = .scaleAspectFit
        return backImage
    }()
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal.withAlphaComponent(0.7)
        
        view.addSubview(nameLabel)
        nameLabel.center(inView: view)
        
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.text = "Pika-Pika-Chuuuuuu"
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure View
    
    func configureViewComponents () {
        
        self.layer.cornerRadius = 18
        self.clipsToBounds = true
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 35)
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 35)
    }
    
}
