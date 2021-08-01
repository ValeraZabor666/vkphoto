//
//  CollectionView.swift
//  MobileUp
//
//  Created by Captain Kidd on 27.07.2021.
//

import Foundation
import UIKit

protocol CollectionViewControllerProtocol {
    var presenter: CollectionPresenterProtocol? { get set }
    
    func updateCollection(collection: Response)
}

class CollectionViewController: UIViewController, CollectionViewControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var presenter: CollectionPresenterProtocol?
    private var collectionView: UICollectionView?
    var photos: Response?
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        presenter?.getPhotos()
        setCollectionView()
        setNavigationParams()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame  = view.bounds
    }
    
    func updateCollection(collection: Response) {
        photos = collection
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        layout.itemSize = CGSize(width: view.frame.size.width / 2 - 8,
                                 height: view.frame.size.height / 3)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.id)
        collectionView.backgroundColor = .darkGray
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos?.response.count != nil {
            return (photos?.response.count)!
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id,
                                                      for: indexPath) as! CollectionViewCell
        let last = photos?.response.items[indexPath.row].sizes
        cell.set(data: (photos?.response.items[indexPath.row].sizes[last!.count - 1])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        AllData.sharedData.date = photos?.response.items[indexPath.row].date
        currentCell.setImage()
        presenter?.openPhoto()
    }
    
    private func setNavigationParams() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        authService.logOut()
    }
}
