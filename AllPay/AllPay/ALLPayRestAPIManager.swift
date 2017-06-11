//
//  ALLPayRestAPIManager.swift
//  AllPay
//
//  Created by Angelos Constantinides on 11/06/2017.
//  Copyright © 2017 ANGELOS CONSTANTINIDES. All rights reserved.
//

import Foundation


class ALLPayRestAPIManager : NSObject
{
    
    static let APIBaseUrl : String = "http://codeduomobileapi.azurewebsites.net/api/"
    
    override init()
    {
        super.init()
    }
    
    public func AcceptPayment(merchantID : String, onCompletion: @escaping ( _  : Bool, _  : Bool)->Void)
    {
        var returnValue:Bool = false
        let urlString = "http://codeduomobileapi.azurewebsites.net/api/AcceptPayments/\(merchantID)"
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with:url!)
        { (data, response, error) in
            if error != nil
            {
                print(error!)
            }
            else
            {
                do
                {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                    returnValue = ("true" == parsedData["CanAccept"] as! String)
                    onCompletion(true,returnValue)
                }
                catch let error as NSError
                {
                    print(error)
                    onCompletion(false,false)
                }
            }}
        task.resume()
    }
    
    public func AcceptPayment(spenderID:Int, paymentRecord : PaymentRecord, onCompletion: @escaping ( _ : Bool, _ : Bool) -> Void)
    {
        var returnValue:Bool = false
        let urlString = "http://codeduomobileapi.azurewebsites.net/api/Transfers/\(spenderID)/\(paymentRecord.MerchantID)/\(paymentRecord.Amount)/\(paymentRecord.ReferenceID)/\(paymentRecord.CurrencyID)"
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with:url!)
        { (data, response, error) in
            if error != nil
            {
                print(error!)
            }
            else
            {
                do
                {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                    returnValue = (parsedData["status"] as! String) == "SUCCESS"
                    print(paymentRecord.PaymentStatus)
                    onCompletion(true,returnValue)
                }
                catch let error as NSError
                {
                    print(error)
                    onCompletion(false,false)
                }
            }
        }
        task.resume()
    }
}
