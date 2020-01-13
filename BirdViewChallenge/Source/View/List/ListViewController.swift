//
//  ListViewController.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController {
    
    let viewModel = ListViewModel()
    
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let listHeader = "ListHeader"
    let listCell = "ListCell"
    
    var listType = ListType.Basic
    
    lazy var searchBar: UISearchBar = {
        var s = UISearchBar()
        s.placeholder = "검색"
        s.sizeToFit()
        s.barTintColor = .black
        s.layer.cornerRadius = 14
        s.clipsToBounds = true
        s.delegate = self
        return s
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumInteritemSpacing = Metric.itemSpacing
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(ListCell.self, forCellWithReuseIdentifier: self.listCell)
        collection.register(ListHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.listHeader)
         return collection
    }()
    
    lazy var listIndicator: UIActivityIndicatorView = {
        var id = UIActivityIndicatorView()
        id.style = .large
        id.color = .red
        id.backgroundColor = .clear
        id.startAnimating()
        return id
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
        self.collectionView.isHidden = false
    }
    
    override func setupUI() {
        [navBar, searchBar, collectionView, listIndicator].forEach { view.addSubview($0) }
        navBar.barTintColor = #colorLiteral(red: 0.5641141534, green: 0.07266253978, blue: 0.995624125, alpha: 1)
    }
    
    override func setupConstraints() {
        
        navBar.snp.makeConstraints {
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(92)
            $0.top.equalToSuperview()
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.height.equalTo(36)
            $0.leading.equalTo(self.view.snp.leading).offset(12)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-12)
        }

        collectionView.snp.remakeConstraints { (m) in
            m.width.equalToSuperview()
            m.height.equalToSuperview()
            m.top.equalTo(navBar.snp.bottom)
        }
        
        listIndicator.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }

    }
    
    override func bind() {
        fetchProductList()
    }
    
    func fetchProductList() {
        viewModel.getProductList(skin: viewModel.skinType, pages: viewModel.pageNum) { (result) in
            switch result {
            case true:
                self.reloadCollectionView()
            case false:
                print("error")
            }
        }
    }
    
    func fetchMoreProductList() {
        switch listType {
        case .Basic:
            viewModel.pageNum += 1
            listIndicator.startAnimating()
            viewModel.getMoreProductList(skin: viewModel.skinType, pages: viewModel.pageNum) { (result) in
                switch result {
                case true:
                    self.reloadCollectionView()
                case false:
                    print("error~")
                }
            }
        case .Search:
            print("seaaaaaaaarch")
        default:
            break
        }
        
    }
    
    func fetchSearchProductList(searchText: String) {
        listIndicator.startAnimating()
        viewModel.getSearchProductList(search: searchText) { (result) in
            switch result {
            case true:
                self.reloadCollectionView()
            case false:
                print("error~")
            }
        }
        self.collectionView.isHidden = false
        self.view.endEditing(true)
    }
    
    func selectSkinTypeProductList(skinType: String) {
        self.listIndicator.startAnimating()
        switch skinType {
        case "oily":
            viewModel.skinType = skinType
            viewModel.getProductList(skin: viewModel.skinType, pages: viewModel.pageNum) { (result) in
                switch result {
                case true:
                    self.reloadCollectionView()
                case false:
                    print("error")
                }
            }
        case "dry":
            viewModel.skinType = skinType
            viewModel.getProductList(skin: viewModel.skinType, pages: viewModel.pageNum) { (result) in
                switch result {
                case true:
                    self.reloadCollectionView()
                case false:
                    print("error")
                }
            }
        case "sensitive":
            viewModel.skinType = skinType
            viewModel.getProductList(skin: viewModel.skinType, pages: viewModel.pageNum) { (result) in
                switch result {
                case true:
                    self.reloadCollectionView()
                case false:
                    print("error")
                }
            }
        default:
            break
        }
        viewModel.pageNum = 1
        listType = .Basic
        searchBar.text = nil
        self.collectionView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.collectionView.reloadData()
            self?.listIndicator.stopAnimating()
        }
    }
    
    @objc func typeBtnClick() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let oilyAction = UIAlertAction(title: "Oily", style: .default) { (handler) in
            self.selectSkinTypeProductList(skinType: "oily")
        }
        let dryAction = UIAlertAction(title: "Dry", style: .default) { (handler) in
            self.selectSkinTypeProductList(skinType: "dry")
        }
        let sensitiveAction = UIAlertAction(title: "Sensitive", style: .default) { (handler) in
            self.selectSkinTypeProductList(skinType: "sensitive")
        }
        optionMenu.addAction(oilyAction)
        optionMenu.addAction(dryAction)
        optionMenu.addAction(sensitiveAction)
        self.present(optionMenu, animated: true, completion: nil)
    }

}

extension ListViewController: UICollectionViewDelegate {}
extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.listHeader, for: indexPath) as! ListHeaderCell
            headerView.typeBtn.addTarget(self, action: #selector(typeBtnClick), for: .touchUpInside)
            return headerView
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.listCell, for: indexPath) as! ListCell
        cell.viewModel = ListCellViewModel(content: viewModel.listData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.listData.count - 4 {
            fetchMoreProductList()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.listData[indexPath.row].id)
        let navigator = Navigator()
        self.present(navigator.navigate(at: .detail(id: viewModel.listData[indexPath.row].id)), animated: true)
    }
    
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width - Metric.leftPadding - Metric.rightPadding - Metric.itemSpacing)/2
        return CGSize(width: cellWidth, height: 236)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Metric.topPadding, left: Metric.leftPadding, bottom: Metric.bottomPadding, right: Metric.rightPadding)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        self.fetchSearchProductList(searchText: searchText)
//        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 30.0, initialSpringVelocity: 30.0, options: UIView.AnimationOptions.curveEaseOut, animations: ({
//            self.collectionView.isHidden = false
//            self.collectionView.frame = CGRect(x: 0, y: self.navBar.bounds.maxY, width: self.view.frame.width, height: self.view.frame.height)
//        }), completion: nil)
//        self.collectionView.isHidden = false
        listType = ListType.Search
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.collectionView.isHidden = true
//        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 30.0, initialSpringVelocity: 30.0, options: UIView.AnimationOptions.curveEaseOut, animations: ({
//            self.collectionView.frame = CGRect(x: 0, y: self.navBar.bounds.maxY - 50, width: self.view.frame.width, height: self.view.frame.height)
//
//        }), completion: { (result) in
//            self.collectionView.isHidden = true
//        })
    }
}
