//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by NERO on 5/25/24.
//

import UIKit

struct Shopping {
    var isCompleted: Bool
    let shoppingItem: String
    var isBookmarked: Bool
}

class ShoppingTableViewCell: UITableViewCell {
    @IBOutlet var shoppingListView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var shoppingItemLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
}

class ShoppingTableViewController: UITableViewController {
    @IBOutlet var addShoppingListView: UIView!
    @IBOutlet var addShoppingListTextField: UITextField!
    @IBOutlet var addShoppingListButton: UIButton!
    
    var shoppingList: [Shopping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "쇼핑"
        setAddView()
        addShoppingListButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }
}

// MARK: - Table view data source
extension ShoppingTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ShoppingTableViewCell
        
        setShoppingListView(cell: cell)
        
        cell.shoppingItemLabel?.text = shoppingList[indexPath.row].shoppingItem
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        let checkButtonImageName = shoppingList[indexPath.row].isCompleted ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkButtonImageName), for: .normal)
        
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonClicked), for: .touchUpInside)
        let bookmarkButtonImageName = shoppingList[indexPath.row].isBookmarked ? "star.fill" : "star"
        cell.bookmarkButton.setImage(UIImage(systemName: bookmarkButtonImageName), for: .normal)
        
        return cell
    }
    
    func addShoppingList() {
        guard let inputText = addShoppingListTextField.text, !inputText.isEmpty else {
            addShoppingListTextField.placeholder = " 😞 아이템이 입력되지 않았어요."
            return
        }
        
        shoppingList.append(Shopping(isCompleted: false, shoppingItem: inputText, isBookmarked: false))
        addShoppingListTextField.text = nil
        addShoppingListTextField.placeholder = " 🛒 쇼핑할 아이템을 추가해 보세요!"
    }
}

// MARK: - Touch Event
extension ShoppingTableViewController {
    @objc func addButtonClicked() {
        addShoppingList()
        tableView.reloadData()
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
        shoppingList[sender.tag].isCompleted.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func bookmarkButtonClicked(sender: UIButton) {
        shoppingList[sender.tag].isBookmarked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @IBAction func enterClicked(_ sender: UITextField) {
        addShoppingList()
        tableView.reloadData()
    }
}

// MARK: - UI Setting
extension ShoppingTableViewController {
    func setAddView() {
        addShoppingListView.backgroundColor = .shoppingListBackground
        addShoppingListView.layer.cornerRadius = 10
        
        addShoppingListTextField.backgroundColor = .clear
        addShoppingListTextField.borderStyle = .none
        addShoppingListTextField.placeholder = " 🛒 쇼핑할 아이템을 추가해 보세요!"
        addShoppingListTextField.tintColor = .black
        
        addShoppingListButton.backgroundColor = .addButton
        addShoppingListButton.layer.cornerRadius = 10
        addShoppingListButton.setTitle("추가", for: .normal)
        addShoppingListButton.setTitleColor(.black, for: .normal)
        addShoppingListButton.titleLabel?.font = .systemFont(ofSize: 15)
    }
    
    func setShoppingListView(cell: ShoppingTableViewCell) {
        tableView.separatorStyle = .none
        tableView.rowHeight = 55
        cell.selectionStyle = .none
        cell.shoppingListView.backgroundColor = .shoppingListBackground
        cell.shoppingListView.layer.cornerRadius = 10
        
        cell.shoppingItemLabel?.font = .systemFont(ofSize: 14)
        cell.shoppingItemLabel?.textColor = .black
        cell.shoppingItemLabel?.textAlignment = .left
        
        cell.checkButton.tintColor = .black
        cell.checkButton.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        cell.bookmarkButton.tintColor = .black
        cell.bookmarkButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
}
