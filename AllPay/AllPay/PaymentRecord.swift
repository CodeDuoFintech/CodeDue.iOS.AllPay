//
//  PaymentRecord.swift
//  AllPay
//
//  Created by ANGELOS CONSTANTINIDES on 10/06/2017.
//  Copyright © 2017 ANGELOS CONSTANTINIDES. All rights reserved.
//

import Foundation


class PaymentRecord
{
    private var m_MerchantID : String?
    private var m_Amount : Double?
    private var m_ReferenceID : String?
    private var m_PaymentStatus : Bool?
    private var m_CurrencyID : String?
    
    
    
    init( merchantId: String, amount:Double, referencedID: String, currencyID : String )
    {
        self.m_MerchantID = merchantId
        self.m_Amount = amount
        self.m_ReferenceID = referencedID
        self.m_PaymentStatus = false
        self.m_CurrencyID = currencyID
    }
    
    public var Amount : String { get { return "\(self.m_Amount!)" } }
    public var MerchantID : String { get { return self.m_MerchantID! } }
    public var ReferenceID : String { get { return self.m_ReferenceID! } }
    public var CurrencyID : String { get { return self.m_CurrencyID! } }

    public var PaymentStatus : Bool { set { self.m_PaymentStatus = newValue } get { return self.m_PaymentStatus! } }


    
    
}
