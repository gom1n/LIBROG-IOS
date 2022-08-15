//
//  ModifyRecordViewController.swift
//  LIBROG
//
//  Created by gomin on 2022/07/26.
//

import UIKit

class ModifyRecordViewController: UIViewController {
    @IBOutlet weak var modifyRecordTableView: UITableView!
    
    var recordData: RecordDetailModel!
    var isCompleteButtonTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modifyRecordTableView.delegate = self
        modifyRecordTableView.dataSource = self
        
        modifyRecordTableView.separatorStyle = .none
        
        let modifylNib = UINib(nibName: "ModifyRecordTableViewCell", bundle: nil)
        modifyRecordTableView.register(modifylNib, forCellReuseIdentifier: "ModifyRecordTableViewCell")
    }
    @IBAction func goBackButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func modifyButtonDidTap(_ sender: UIButton) {
        isCompleteButtonTap = true
        modifyRecordTableView.reloadData()
    }
    //MARK: 화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension ModifyRecordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ModifyRecordTableViewCell", for: indexPath) as? ModifyRecordTableViewCell else {
            return UITableViewCell()
        }
        if isCompleteButtonTap == false {
            cell.setRecordData(self.recordData)
        }
        if isCompleteButtonTap == true {
            cell.postRecord(self.recordData)
            self.dismiss(animated: true, completion: nil)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 667
    }
}
