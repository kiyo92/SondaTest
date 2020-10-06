//
//  FeedViewController.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

protocol FeedView: BaseView {
    
    func feedAPIResponse(photos: [Photo])
}
class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var photos : [Photo]?
    private let presenter: FeedPresenter = FeedPresenter()
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter.getPhotos()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.attach(view: self)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.detach()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.photos?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo_cell", for: indexPath) as?  PhotoCollectionViewCell{
            DispatchQueue.main.async {
                cell.setCellData(photo: self.photos![indexPath.item])
                
            }
            return cell
        }
        else{
            return UICollectionViewCell()
        }
        
    }
}
extension FeedViewController: FeedView{
    func feedAPIResponse(photos: [Photo]) {
        self.photos = photos
        collectionView.reloadData()
    }
    
    
    /*
    func loading(show: Bool) {
        if (show) {
            loadingView.startAnimating()
            collectionView.isHidden = true
        } else {
            loadingView.stopAnimating()
            collectionView.isHidden = false
        }
    }
     */
}
