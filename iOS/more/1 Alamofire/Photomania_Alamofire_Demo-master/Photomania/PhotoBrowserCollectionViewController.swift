//
//  PhotoBrowserCollectionViewController.swift
//  Photomania
//
//  Created by Essan Parto on 2014-08-20.
//  Copyright (c) 2014 Essan Parto. All rights reserved.
//

import UIKit
import Alamofire

class PhotoBrowserCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var photos = Set<PhotoInfo>()
    
    private let refreshControl = UIRefreshControl()
    // 来记录当前是否在更新照片，以及当前我们正在浏览的是哪一个照片页面
    private var populatingPhotos = false
    private var currentPage = 1
    
    private let PhotoBrowserCellIdentifier = "PhotoBrowserCell"
    private let PhotoBrowserFooterViewIdentifier = "PhotoBrowserFooterView"
    
    // MARK: Life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        //    Alamofire.request("https://api.500px.com/v1/photos", method: .get, parameters: ["consumer_key": ""]).responseJSON{
        //        response in
        //        guard let JSON = response.result.value else { return }
        ////        print("JSON: \(JSON)")
        //        guard let photoJsons = (JSON as AnyObject).value(forKey: "photos") as? [[String: Any]] else { return }
        //
        //        photoJsons.forEach {
        //            guard let nsfw = $0["nsfw"] as? Bool,
        //            let id = $0["id"] as? Int,
        //            let url = $0["image_url"] as? String,
        //                nsfw == false else { return }
        //            self.photos.insert(PhotoInfo(id: id, url: url))
        //
        //        }
        //        self.collectionView?.reloadData()
        //
        //    }
        populatePhotos()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoBrowserCellIdentifier, for: indexPath) as? PhotoBrowserCollectionViewCell else { return UICollectionViewCell() }
//        
//        let photoInfo = photos[photos.index(photos.startIndex, offsetBy: indexPath.item)]
//        Alamofire.request(photoInfo.url, method: .get).response {
//            dataResponse in
//            guard let data = dataResponse.data else { return }
//            let image = UIImage(data: data)
//            cell.imageView.image = image
//        }
//        
//        return cell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoBrowserCellIdentifier, for: indexPath) as? PhotoBrowserCollectionViewCell else { return UICollectionViewCell() }
        
        let imageURL = photos[photos.index(photos.startIndex, offsetBy: indexPath.item)].url
        cell.imageView.image = nil
        cell.request?.cancel()
        
        cell.request = Alamofire.request(imageURL, method: .get).responseImage {
            response in
            guard let image = response.result.value, response.result.error == nil else { return }
            cell.imageView.image = image
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotoBrowserFooterViewIdentifier, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowPhoto", sender: photos[photos.index(photos.startIndex, offsetBy: indexPath.item)].id)
    }
    
    // MARK: Helper
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        guard let collectionView = collectionView else { return }
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (view.bounds.width - 2) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.footerReferenceSize = CGSize(width: collectionView.bounds.width, height: 100)
        
        collectionView.collectionViewLayout = layout
        
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 30.0))
        titleLabel.text = "Photomania"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        navigationItem.titleView = titleLabel
        
        collectionView.register(PhotoBrowserCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: PhotoBrowserCellIdentifier)
        collectionView.register(PhotoBrowserCollectionViewLoadingCell.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: PhotoBrowserFooterViewIdentifier)
        
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotoViewerViewController, let id = sender as? Int, segue.identifier == "ShowPhoto" {
            destination.photoID = id
            destination.hidesBottomBarWhenPushed = true
        }
    }
    // 1
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + view.frame.height > scrollView.contentSize.height * 0.8 {
            populatePhotos()
        }
    }
    // 获取热门照片列表 分页
    private func populatePhotos() {
        // 2
        if populatingPhotos { return }
        
        populatingPhotos = true
        // 3
        Alamofire.request(Five100px.Router.popularPhotos(currentPage)).responseJSON {
            response in
            guard let JSON = response.result.value, response.result.error == nil else {
                self.populatingPhotos = false
                return
            }
            // 4
            DispatchQueue.global(qos: .userInitiated).async {
                // 5
                guard let photoJsons = (JSON as AnyObject).value(forKey: "photos") as? [[String: Any]] else { return }
                // 6
                let lastItemCount = self.photos.count
                // 7
                photoJsons.forEach {
                    guard let nsfw = $0["nsfw"] as? Bool,
                        let id = $0["id"] as? Int,
                        let url = $0["image_url"] as? String,
                        nsfw == false else { return }
                    // 8
                    self.photos.insert(PhotoInfo(id: id, url: url))
                }
                // 9
                let indexPaths = (lastItemCount..<self.photos.count).map { IndexPath(item: $0, section: 0) }
                // 10
                DispatchQueue.main.async {
                    self.collectionView?.insertItems(at: indexPaths)
                }
                self.currentPage += 1
            }
            self.populatingPhotos = false
        }
        
    }
    
    private dynamic func handleRefresh() {
        
    }
}

class PhotoBrowserCollectionViewCell: UICollectionViewCell {
    fileprivate let imageView = UIImageView()
    fileprivate var request: Request?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        imageView.frame = bounds
        addSubview(imageView)
    }
}

class PhotoBrowserCollectionViewLoadingCell: UICollectionReusableView {
    fileprivate let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spinner.startAnimating()
        spinner.center = center
        addSubview(spinner)
    }
}
