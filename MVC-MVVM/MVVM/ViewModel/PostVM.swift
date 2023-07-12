//
//  PostVM.swift
//  MVC-MVVM
//
//  Created by Sachin Mittal on 12/07/23.
//

import Foundation

protocol PostVMProtocol : AnyObject {
    func didGetError(error:String)
    func didGetPost()
}

final class PostVM{
    
    var postArr = [Posts]()
    weak var delegate : PostVMProtocol!
    
    func fetchPosts(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let request = URLRequest(url: url)
        
        URLSession.shared.perform(request, decode: [Posts].self) { [self] (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                delegate.didGetError(error: error.localizedDescription)
            case .success(let object):
                print(object)
                postArr = object
                DispatchQueue.main.async { [self] in
                    delegate.didGetPost()
                }
                
            }
        }
    }
    
}
