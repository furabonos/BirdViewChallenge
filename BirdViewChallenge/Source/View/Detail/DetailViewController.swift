//
//  DetailsViewController.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var ids: Int
    let viewModel = DetailViewModel()
    
    var infoThumbnailCell = "InfoThumbnailCell"
    var infoCell = "InfoCell"
    var descriptionCell = "DescriptionCell"
    var graphCell = "GraphCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InfoThumbnailCell.self,
                           forCellReuseIdentifier: self.infoThumbnailCell)
        tableView.register(InfoCell.self,
                           forCellReuseIdentifier: self.infoCell)
        tableView.register(DescriptionCell.self,
                           forCellReuseIdentifier: self.descriptionCell)
      return tableView
    }()
    
    lazy var detailIndicator: UIActivityIndicatorView = {
        var id = UIActivityIndicatorView()
        id.style = .large
        id.color = .red
        id.backgroundColor = .clear
        id.startAnimating()
        return id
    }()
    
    lazy var closeBtn: UIButton = {
        var b = UIButton()
        b.setImage(UIImage(named: "whiteClose"), for: .normal)
        b.backgroundColor = .black
        b.layer.cornerRadius = 20
        b.addTarget(self, action: #selector(close), for: .touchUpInside)
        return b
    }()
    
    lazy var buyBtn: UIButton = {
        var b = UIButton()
        b.backgroundColor = #colorLiteral(red: 0.5641141534, green: 0.07266253978, blue: 0.995624125, alpha: 1)
        b.setTitle("구매하기", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 10
        return b
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
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        viewAnimation()
//    }
    
    override func setupUI() {
        [tableView, detailIndicator, closeBtn, buyBtn].forEach { view.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        detailIndicator.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints {
            $0.top.equalTo(self.tableView.snp.top).offset(16)
            $0.trailing.equalTo(self.tableView.snp.trailing).offset(-16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        buyBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(52)
        }
        
    }
    
    override func bind() {
        fetchDetailInfo()
    }
    
    func fetchDetailInfo() {
        viewModel.getDetailInfo(ids: self.ids) { (result) in
            switch result {
            case true:
                self.reloadTableView()
            case false:
                print("error")
            }
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.tableView.reloadData()
            self?.viewAnimation()
            self?.detailIndicator.stopAnimating()
        }
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewAnimation() {
        self.view.layoutIfNeeded()
        self.buyBtn.snp.updateConstraints {
            $0.bottom.equalToSuperview().offset(-40)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return self.view.frame.width
        case 1:
            return UITableView.automaticDimension
        case 2:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let detailDatas = viewModel.detailData.first else { return 0 }
        return viewModel.numberOfItemsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailDatas = viewModel.detailData.first else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: self.infoThumbnailCell, for: indexPath as IndexPath) as! InfoThumbnailCell
            cell.viewModel = InfoThumbnailViewModel(content: detailDatas)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: self.infoCell, for: indexPath as IndexPath) as! InfoCell
            cell.viewModel = InfoCellViewModel(content: detailDatas)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: self.descriptionCell, for: indexPath as IndexPath) as! DescriptionCell
            cell.viewModel = DescriptionCellViewModel(content: detailDatas)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
