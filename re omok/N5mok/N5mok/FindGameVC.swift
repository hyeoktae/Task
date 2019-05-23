//
//  FindGameVC.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class FindGameVC: UIViewController {
    
    let popUpVC = PopUpVC()
    
    private var firstMenuContainer: [UIButton] = []
    
    var loginUsers = [User]()
    
    let refreshC = UIRefreshControl()
    
    var IDlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(25)
        label.text = "ID"
        label.textColor = .black
        return label
        }()
    
    let profileImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let IDTblView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        addSubViews()
        IDTblView.dataSource = self
        setupFirstMenu()
        loadProfile()
        downloadUsersInfo(){
            if $0{
                self.loginUsers = usersInfo.filter{$0.loginState == true}
                self.IDTblView.reloadData()
            }else{
                print("fail to down")
            }
        }
    }
    
    func addSubViews() {
        let views = [IDTblView, profileImg, IDlabel]
        views.forEach { view.addSubview($0) }
        IDTblView.refreshControl = refreshC
        refreshC.addTarget(self, action: #selector(reloadTblView(_:)), for: .valueChanged)
    }
    
    private func randomColorGenerator() -> UIColor {
        let red = CGFloat.random(in: 0...1.0)
        let green = CGFloat.random(in: 0...1.0)
        let blue = CGFloat.random(in: 0...1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func setupFirstMenu() {
        let menuTitle = ["more", "logout", "option"]
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(
                x: view.bounds.width - 80, y: view.bounds.height - view.bounds.height + 50,
                width: UI.menuSize, height: UI.menuSize
            )
            let button = makeMenuButton(with: menuFrame, title: menuTitle[i])
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
            } else if i == 1 {
                button.addTarget(self, action: #selector(didTapLogoutBtn(_:)), for: .touchUpInside)
            }
        }
        view.bringSubviewToFront(firstMenuContainer.first!)
    }
    
    @objc private func firstMenuDidTap(_ button: UIButton) {
        print("---------- [ usingSpringWithDamping ] ----------\n")
        button.isSelected.toggle()
        
        UIView.animate(
            withDuration: Time.short,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0,
            animations: {
                for (idx, menu) in self.firstMenuContainer.enumerated() {
                    guard idx != 0 else { continue }
                    if button.isSelected {
                        menu.transform = .identity
                        menu.center.y += UI.distance * CGFloat(idx)
                    } else {
                        menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                        menu.center.y -= UI.distance * CGFloat(idx)
                    }
                }
        })
    }
    
    @objc func didTapLogoutBtn(_ sender: UIButton) {
        toFalseLoginState(){
            self.loginUsers = usersInfo.filter{$0.loginState == true}
            self.IDTblView.reloadData()
        }
        KOSession.shared().logoutAndClose { (success, error) -> Void in
            if let error = error {
                return print(error.localizedDescription)
            }
            AppDelegate.instance.setupRootViewController()
        }
    }
    
    private func makeMenuButton(with frame: CGRect, title: String) -> UIButton {
        let btn = UIButton(frame: frame)
        btn.backgroundColor = randomColorGenerator()
        btn.layer.cornerRadius = btn.bounds.width / 2
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(10)
        btn.transform = btn.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(btn)
        return btn
    }
    
    func loadProfile() {
        KOSessionTask.userMeTask { [weak self] (error, userMe) in
            if let error = error {
                return print(error.localizedDescription)
            }
            guard let me = userMe,
                let nickName = me.nickname,
                let profileImageLink = me.profileImageURL,
                let thumbnailImageLink = me.thumbnailImageURL
                else { return }
            
            playerID = nickName
            self?.IDlabel.text = playerID
            
            let imageLinks = [thumbnailImageLink, profileImageLink]
            for url in imageLinks {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, res, error) in
                    if let error = error {
                        return print(error.localizedDescription)
                    }
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        if url == thumbnailImageLink {
                            playerProfileImg = image
                            self?.profileImg.image = playerProfileImg
                        }
                        self?.autoLayout()
                        uploadUserInfo(){
                            downloadUsersInfo(){
                                if $0{
                                    self?.loginUsers = usersInfo.filter{$0.loginState == true}
                                    self?.IDTblView.reloadData()
                                }else{
                                    print("fail to down")
                                }
                            }
                        }
                    }
                }).resume()
            }
        }
    }
    
    @objc func reloadTblView(_ sender: UIRefreshControl) {
        loginUsers = usersInfo.filter{$0.loginState == true}
            downloadUsersInfo(){
                if $0{
                    self.loginUsers = usersInfo.filter{$0.loginState == true}
                    self.IDTblView.reloadData()
                }else{
                    print("fail to down")
                }
            }
        IDTblView.reloadData()
        refreshC.endRefreshing()
    }
    
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        profileImg.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        profileImg.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        profileImg.trailingAnchor.constraint(equalTo: IDlabel.leadingAnchor, constant: -50).isActive = true
        profileImg.bottomAnchor.constraint(equalTo: IDlabel.bottomAnchor).isActive = true
        
        
        IDlabel.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 50).isActive = true
        IDlabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        IDlabel.bottomAnchor.constraint(equalTo: IDTblView.topAnchor, constant: -20).isActive = true
        
        IDTblView.topAnchor.constraint(equalTo: IDlabel.bottomAnchor, constant: 20).isActive = true
        IDTblView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        IDTblView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        IDTblView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        IDTblView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.75).isActive = true
        
    }
}

extension FindGameVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellBtn = UIButton(type: .custom)
        cellBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        cellBtn.setTitle("한판?", for: .normal)
        cellBtn.tag = indexPath.row
        cellBtn.addTarget(self, action: #selector(FindGameVC.didTapCellBtn(_:)), for: .touchUpInside)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = loginUsers[indexPath.row].name
        cell.imageView?.image = loginUsers[indexPath.row].playerImg
        cell.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
//        cell.layer.borderWidth = 1
        cell.accessoryView = cellBtn as UIView
        
        return cell
    }

    @objc func didTapCellBtn(_ sender: UIButton) {
        popUpVC.modalPresentationStyle = .overCurrentContext
        let vsName = loginUsers[sender.tag].name
        let myName = IDlabel.text
        popUpVC.vs = vsName
        if vsName != myName {
            popUpVC.titleLabel.text = "\(loginUsers[sender.tag].name)님과 한판 뜰래요?"
            popUpVC.yesBtn.isEnabled = true
        } else {
            popUpVC.titleLabel.text = "자기와 한판은 불가능!!"
            popUpVC.yesBtn.isEnabled = false
        }
        present(popUpVC, animated: true)
    }
}
