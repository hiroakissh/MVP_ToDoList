//
//  testModel.swift
//  MVP_ToDoList
//
//  Created by HiroakiSaito on 2021/10/05.
//

import Foundation

protocol TestModelInput{
    func fetchItems() -> [String]
}

final class TestModel: TestModelInput{
    
    private let userDefaluts = UserDefaults.standard
    private let ITEM_KEY = "TodoItems"
    
    func fetchItems() -> [String] {
        
        let test = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        print(test)
        return test
    }
}
