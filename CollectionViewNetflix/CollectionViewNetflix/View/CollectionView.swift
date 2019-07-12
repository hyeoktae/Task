//
//  CollectionView.swift
//  CollectionViewNetflix
//
//  Created by hyeoktae kwon on 2019/07/09.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

class CollectionView: UIView {
  
  // Properties
  private var urls: [URL?]?
  private var title: String?

  private let layout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  // initialize
  init(frame: CGRect, url: [String], title: String) {
    super.init(frame: frame)
    self.urls = url.map { URL(string: $0) }
    self.title = title
  }
  
  // setupAutoLayout
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    [collectionView].forEach { addSubview($0) }
    
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    
    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    layout.minimumLineSpacing = 15
    layout.minimumInteritemSpacing = 15
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.height / 5)
    layout.headerReferenceSize = CGSize(width: 60, height: 60)
    layout.scrollDirection = .horizontal
    
    collectionView.register(
      ImageCell.self,
      forCellWithReuseIdentifier: ImageCell.identifier)
    
    collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
    
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension CollectionView: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return urls?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
    
    cell.configure(url: urls![indexPath.row]!)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard kind == UICollectionView.elementKindSectionHeader else { return HeaderView() }
    
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
    
    header.configure(title: self.title!)
    
    return header
  }
  
}
