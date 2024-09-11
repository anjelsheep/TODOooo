//
//  ViewController.swift
//  TODOooo
//
//  Created by 志賀翔太 on 2024/09/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todoTextField: UITextField!
    
    var todoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaultsから保存されたTodoリストを読み込む
        if let savedTodos = UserDefaults.standard.array(forKey: "todoList") as? [String] {
            todoList = savedTodos
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // UITableViewのデータソースメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    // Todoを追加する
    @IBAction func addTodoTapped(_ sender: UIButton) {
        if let todoText = todoTextField.text, !todoText.isEmpty {
            todoList.append(todoText)
            
            // UserDefaultsにTodoリストを保存する
            UserDefaults.standard.set(todoList, forKey: "todoList")
            
            tableView.reloadData()
            todoTextField.text = "" // テキストフィールドをクリア
        }
    }
}


