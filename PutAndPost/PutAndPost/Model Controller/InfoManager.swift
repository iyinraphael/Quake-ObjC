//
//  InfoManager.swift
//  PutAndPost
//
//  Created by Iyin Raphael on 8/15/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

private let serviceEndpoint = "https://put-and-post.firebaseio.com/"
private let serviceEndpointURL: URL! = URL(string: serviceEndpoint)

class InfoManager {
    
    static let shared = InfoManager()
    
    //rather than typing all these in completion
    typealias RequestCompletion = (_ success: Bool) -> Void
    
    private init() {}
    
    private(set) var deviceDictionary: [String: Device] = [:]
    
    var devices: [Device] {
        return Array(deviceDictionary.values)
    }
    
    var keys: [String]{
        return Array(deviceDictionary.keys)
    }
    
    func createRequest(method: String, device: Device? = nil, record: String? = nil) -> URLRequest {
        var targetURL = serviceEndpointURL.appendingPathComponent("devices")
        
        if let record = record {
            targetURL = targetURL.appendingPathComponent(record)
        }
        
        targetURL = targetURL.appendingPathComponent("json")
        
        var request = URLRequest(url: targetURL)
        request.httpMethod = method
        
        guard let device = device else {return request}
        do {
            request.httpBody = try JSONEncoder().encode(device)
        }catch {
            fatalError("Error encoding device \(device) \(error)")
        }
        return request
    }
    
    func postDevice(device: Device, completion: @escaping RequestCompletion){
        let request = createRequest(method: "POSt", device: device)
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error posting new device: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                NSLog("Data was not received")
                completion(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let postReply = try jsonDecoder.decode([String:String].self, from: data)
                
                let keys = Array(postReply.keys)
                
                guard keys.count == 1, keys[0] == "name" else {
                    NSLog("Post Not Successful")
                    completion(false)
                    return
                }
                self.deviceDictionary[postReply["name"]!] = device
                NSLog("Post Succesful")
                completion(true)
            }catch{
                NSLog("Error decode in data: \(error)")
                completion(false)
                return
            }
        }
        task.resume()
    }
    
    func createNewDEvice(completion: @escaping RequestCompletion) {
        let newDevice = Device.generateDevice()
        postDevice(device: newDevice ) { success in completion(success)}
    }
    
}
