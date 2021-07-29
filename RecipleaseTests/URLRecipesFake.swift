//
//  URLRecipesFake.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 29/07/2021.
//

import Foundation

class URLRecipesFake: URLSession {
    var data: Data?
    var response : URLResponse?
    var error: Error?
    
    init (data: Data?, response:URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLRecipesDataTaskFake()
        task.completionHandler = completionHandler
        task.data = data
        task.urlResponse = response
        task.responseError = error
        return task
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLRecipesDataTaskFake()
        task.completionHandler = completionHandler
        task.data = data
        task.urlResponse = response
        task.responseError = error
        return task
    }
}

class URLRecipesDataTaskFake: URLSessionDataTask {
    var completionHandler : ((Data?, URLResponse?, Error?) -> Void)?
    
    var data: Data?
    var urlResponse : URLResponse?
    var responseError: Error?
    
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    
    override func cancel() {}
}
