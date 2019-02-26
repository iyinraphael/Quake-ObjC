//
//  BookController.swift
//  ReadingList(Persistence)
//
//  Created by Iyin Raphael on 8/7/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class BookController {
    
    //Read-ArrayofBooks
    var books: [Book] = []
    
    //Create
    func create(title: String, reasonToRead: String){
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistence()
    }
    
    
    //Update
    func updateBookTitleandRead(book: Book, title: String, reasonToRead: String){
        guard let index = books.index(of: book) else {return}
        var scratch = book
        scratch.title = title
        scratch.reasonToRead = reasonToRead
        books.remove(at: index)
        books.insert(scratch, at:index)
        saveToPersistence()
    }
    
    func updateHasBeenRead(book: Book){
        guard let index = books.index(of: book) else {return}
        var scratch = book
        scratch.hasBeenRead = !book.hasBeenRead
        books.remove(at: index)
        books.insert(scratch, at:index)
        saveToPersistence()
    }
    
    //delete
    func delete(book: Book){
        guard let index = books.index(of: book) else {return}
        books.remove(at: index)
        saveToPersistence()
    }
    
   
    
    //readBooks
    var readBooks: [Book] {
        return books.filter({$0.hasBeenRead}) //$0 for hasBeenRead that is true
    }
    
    //UnreadBooks
    var unreadBooks: [Book]{
        return books.filter({$0.hasBeenRead == false})
        
    }
    
}
