//
//  DetailViewController.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 08/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var ids: Int
    let viewModel = DetailViewModel()
    
    var infoCell = "InfoCell"
    var descriptionCell = "DescriptionCell"
    var graphCell = "GraphCell"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(InfoCell.self, forCellWithReuseIdentifier: self.infoCell)
        collection.register(DescriptionCell.self, forCellWithReuseIdentifier: self.descriptionCell)
        return collection
    }()
    
    lazy var detailIndicator: UIActivityIndicatorView = {
        var id = UIActivityIndicatorView()
        id.style = .large
        id.color = .red
        id.backgroundColor = .clear
        id.startAnimating()
        return id
    }()
    
    init(ids: Int) {
        self.ids = ids
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        [collectionView, detailIndicator].forEach { view.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        detailIndicator.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }
        
    }
    
    override func bind() {
        viewModel.getDetailInfo(ids: self.ids) { (result) in
            switch result {
            case true:
                self.reloadCollectionView()
            case false:
                print("error")
            }
        }
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.collectionView.reloadData()
            self?.detailIndicator.stopAnimating()
        }
    }

}

extension DetailViewController: UICollectionViewDelegate { }
extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let detailDatas = viewModel.detailData.first else { return 0 }
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let detailDatas = viewModel.detailData.first else { return UICollectionViewCell() }
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.infoCell, for: indexPath) as! InfoCell
            cell.viewModel = InfoCellViewModel(content: detailDatas)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.descriptionCell, for: indexPath) as! DescriptionCell
            cell.viewModel = DescriptionCellViewModel(content: detailDatas)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: self.view.frame.width, height: 650)
        case 1:
            return CGSize(width: self.view.frame.width, height: 500)
        default:
            return CGSize(width: self.view.frame.width, height: 500)
        }
        
    }
}


