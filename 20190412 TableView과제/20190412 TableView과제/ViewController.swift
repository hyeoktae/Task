
/***************************************************
 [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
 
 1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
 2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
 랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
 (여기까지 TableViewRefresh 실습 내용과 동일)
 3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
 (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
 e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
 4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
 
 < 힌트 >
 키워드 - willSelectRow, selectedRow - 현재 선택된 인덱스 값 가져올수 있음, multipleSelection
 ***************************************************/

import UIKit

class ViewController: UIViewController {
    
    var count = 20
    var numbers: [Int] = []
    var selecteds: [IndexPath] = []
    var seledcedArray: [Int] = []
    var seledtedNumArray: [Int] = []
    
    var tableView = UITableView()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSelectNum()
        setupTableView()
        setButton()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        tableView.refreshControl = refreshControl
    }
    
    func setButton() {
        button.setTitle("Reload", for: .normal)
        button.frame = CGRect(x: view.frame.width/2 - 40, y: 50, width: 80, height: 30)
        button.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        button.backgroundColor = .lightGray
        view.addSubview(button)
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        selected()
        numbers = []
        addSelectNum()
        seledcedArray = []
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.allowsMultipleSelection = true
        tableView.isMultipleTouchEnabled = true
        tableView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100)
        view.addSubview(tableView)
        tableView.dataSource = self
                tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
    
    func addSelectNum(){
        guard seledcedArray != [] else {
            makeRand()
            return
        }
        for i in seledcedArray {
            numbers.append(i)
        }
        makeRand()
    }
    
    func makeRand() {
        if numbers.count < count {
            #if swift(>=4.2)
            let num = (1...count).randomElement()!
            #else
            let num = Int(arc4random_uniform(UInt32(count+50))) // swift 4.2ver 아래는 이렇게 랜덤값 호출
            #endif
            if !numbers.contains(num) {
                numbers.append(num)
            }
            return makeRand()
        }
    }
    
    func selected() {
        guard let index = tableView.indexPathsForSelectedRows else {
            return
        }
        self.selecteds = index
        for i in selecteds {
            seledcedArray.append(numbers[i.row])
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (numbers[indexPath.row] < 7) {
           return nil
        }
        return indexPath
    }
}
