//  PokepediaContentViewController.swift
//  PokedexMVC
//
//  Created by Aleksej Shapran on 09.05.23
//  Modifyed by Aleksej Shapran on 12.05.23

import UIKit

private let reuseIdentifier = "PokepediaCell"

class PokepediaContentViewController: UICollectionViewController {
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchPokemon()
        configureViewComponents()
    }
    
    // MARK: - API
    
    func fetchPokemon() {
        Service.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc func refreshPokemonsAPIStatus () {
        Service.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.collectionView.reloadData()
                print("Failed to fetching API Status now.")
            }
        }
    }
    
    func configureViewComponents() {
        
        navigationItem.title = "Pokepedia"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(PokepediaCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: (UIImage(systemName: "arrow.clockwise"))?.withTintColor(UIColor.systemTeal, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(refreshPokemonsAPIStatus))
    }
}


// MARK: - UICollectionViewDataSource/Delegate

extension PokepediaContentViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? filteredPokemon.count : pokemon.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokepediaCell
        
        cell.pokemon = inSearchMode ? filteredPokemon[indexPath.row] : pokemon[indexPath.row]
        
        cell.delegate = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = PokepediaInfoController()
        controller.pokemon = inSearchMode ? filteredPokemon[indexPath.row] : pokemon[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PokepediaContentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 30) / 2
        return CGSize(width: width, height: width)
    }
}

extension PokepediaContentViewController: PokepediaCellDelegate {
    
    func presentInfoView(withPokemon pokemon: Pokemon) {
        // Coming soon
        
        // I wanted to make a long-tap preview, but I don't meet the deadline
        // I will do it in the next versions
    }
}


