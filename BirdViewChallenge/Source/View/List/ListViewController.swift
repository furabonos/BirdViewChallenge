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
    let listHeader = "ListHeader"
    let listCell = "ListCell"
    
    var listType = ListType.Basic
    
    lazy var searchBar: UISearchBar = {
        var s = UISearchBar()
        s.placeholder = "검색"
        s.sizeToFit()
        s.backgroundColor = .black
        s.barTintColor = .white
        s.layer.cornerRadius = 14
        s.clipsToBounds = true
        s.delegate = self
        return s
    }()
    
    lazy var headerView: UIView = {
        var v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let typeLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 13)
        l.textColor = .black
        l.text = "모든 피부 타입"
        return l
    }()
    
    let typeBtn: UIButton = {
        var b = UIButton()
        b.backgroundColor = .white
        b.setImage(UIImage(named: "arrowDown"), for: .normal)
        b.setTitleColor(.yellow, for: .normal)
        b.addTarget(self, action: #selector(typeBtnClick), for: .touchUpInside)
        return b
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = Metric.itemSpacing
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(ListCell.self, forCellWithReuseIdentifier: self.listCell)
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
        self.navigationController?.view.endEditing(true)
        self.collectionView.isHidden = false
    }
    
    override func setupUI() {
        [headerView, collectionView, listIndicator].forEach { view.addSubview($0) }
        [typeLabel, typeBtn].forEach { headerView.addSubview($0) }
        makeSearchBar()
    }
    
    override func setupConstraints() {

        collectionView.snp.remakeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
            $0.bottom.equalToSuperview()
        }

        listIndicator.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }

        headerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
        }

        typeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(20)
        }

        typeBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.typeLabel.snp.trailing)
            $0.width.equalTo(self.typeLabel.snp.height)
            $0.height.equalTo(self.typeLabel.snp.height)
        }
        
        searchBar.snp.makeConstraints {
            $0.width.equalTo(UI.searchBarWidth)
            $0.height.equalTo(30)
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
        self.navigationController?.view.endEditing(true)
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
    
    func makeSearchBar() {
        var naviButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = naviButton
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
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
        listType = ListType.Search
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.collectionView.isHidden = true
    }
}

extension ListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var contentY = scrollView.contentOffset.y
        print(contentY)
        if contentY > 70 {
            headerView.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(70 - contentY)
            }
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
        }else {
            headerView.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            }
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
