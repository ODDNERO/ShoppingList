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
        
        return cell
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
