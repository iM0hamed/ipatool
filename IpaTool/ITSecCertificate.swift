//
//  ITSecCertificate.swift
//  ipatool
//
//  Created by Stefan on 21/11/14.
//  Copyright (c) 2014 Stefan van den Oord. All rights reserved.
//

import Foundation

class ITSecCertificate
{
    var _secCertificate:SecCertificate
    
    init(_ secCertificate:SecCertificate) {
        _secCertificate = secCertificate
    }
    
    init(_ data:Data) {
        _secCertificate = SecCertificateCreateWithData(nil, data as CFData)!
    }
    
    var commonName : String? {
        get {
            var cn:CFString? = nil
            SecCertificateCopyCommonName(_secCertificate, &cn)
            return cn as String?
        }
    }
    
    var subject : String? {
        get {
            return SecCertificateCopySubjectSummary(_secCertificate) as String?
        }
    }
    
    var values : NSDictionary? {
        get {
            return SecCertificateCopyValues(_secCertificate, nil, nil)
        }
    }
}
