//
//  AchievedFlowerPotViewController2.swift
//  LIBROG
//
//  Created by gomin on 2022/07/22.
//

import UIKit

class AchievedFlowerPotSearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var achievedTableView: UITableView!
    var dataArray: [AddFlowerpotData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.definesPresentationContext = true
        searchBar.delegate = self
        
        achievedTableView.delegate = self
        achievedTableView.dataSource = self

        let acheivedNib = UINib(nibName: "AcheivedFlowerPotTableViewCell", bundle: nil)
        achievedTableView.register(acheivedNib, forCellReuseIdentifier: "AcheivedFlowerPotTableViewCell")
        
        SwipeRecognizer().swipeRecognizer(self)
        searchBarCustom()
    }
}
// MARK: - Table view data source
extension AchievedFlowerPotSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = dataArray.count
        if count == 0 {return 1}
        else {return count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataArray.count == 0 {
            if searchBar.text == "" {
                let cell = UITableViewCell()
                cell.textLabel?.text = "검색창에 화분 이름을 입력해주세요"
                cell.textLabel?.textColor = UIColor.gray
                cell.textLabel?.textAlignment = .center
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = UITableViewCell()
                cell.textLabel?.text = "검색 결과가 없습니다."
                cell.textLabel?.textColor = UIColor.gray
                cell.textLabel?.textAlignment = .center
                cell.selectionStyle = .none
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AcheivedFlowerPotTableViewCell", for: indexPath) as? AcheivedFlowerPotTableViewCell else { return UITableViewCell() }
//            cell.flowerPotNameLabel.text = fileteredData[indexPath.row].flowerPotName
            return cell
        }
    }
    //셀 세로 길이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataArray.count == 0 {return achievedTableView.frame.height}
        else {return 91}
    }
}
// MARK: - SearchBarDelegate
extension AchievedFlowerPotSearchViewController: UISearchBarDelegate {
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    // MARK: searchBar Enter키 누를 때마다 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        print("--> 검색어: \(searchTerm)")
        achievedTableView.reloadData()
    }
    //MARK: searchBar custom
    func searchBarCustom() {
        let searchBarImage = UIImage()
        searchBar.backgroundImage = searchBarImage
        searchBar.setImage(UIImage(named: "search-green"), for: .search, state: .normal)

        //placeholder 커스텀
        let attributedString = NSMutableAttributedString(string: "화분 검색하기", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 15) as Any
            ])
        searchBar.searchTextField.attributedPlaceholder = attributedString
        
        //cancel button
        searchBar.showsCancelButton = false
    }
}