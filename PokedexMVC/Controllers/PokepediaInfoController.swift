//  PokepediaInfoController.swift
//  PokedexMVC
//
//  Created by Aleksej Shapran on 09.05.23

import UIKit

class PokepediaInfoController: UIViewController {
    
    var pokemon: Pokemon? {
        
        didSet {
            navigationItem.title = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
            infoLabel.text = pokemon?.description
            infoView.pokemon = pokemon
        }
    }
    
    let imageView: UIImageView = {
        let pokeImage = UIImageView()
        pokeImage.contentMode = .scaleAspectFit
        return pokeImage
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 8
        return label
    }()
    
    let infoView: InfoView = {
        let view = InfoView()
        view.configureViewForInfoController()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    func configureViewComponents() {
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 166, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 115, height: 115)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
        infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        view.addSubview(infoView)
        infoView.anchor(top: infoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
    }
    
}
