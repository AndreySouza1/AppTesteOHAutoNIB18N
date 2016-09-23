//
//  ViewController.swift
//  TesteOHAutoNIBi18n
//
//  Created by Leonir Alves on 9/2/16.
//  Copyright © 2016 Qranio.com. All rights reserved.
//

import UIKit
import OHAutoNIBi18n

class ViewController: UIViewController {
    
    var bundle: NSBundle! = nil
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.text = "TEXTO_LABEL_PROGRAMATICO"
    }

    @IBAction func actionPT(sender: AnyObject) {
        loadUpdateLanguage("pt-BR")
    }

    @IBAction func actionUS(sender: AnyObject) {
        loadUpdateLanguage("en")
    }
    
    func loadUpdateLanguage(locale: String) {
        
        let locale = locale;
        
//        let countryCode = (locale as NSString).substringToIndex(2)
//        NSString *path = NSBundle.mainBundle().pathForResource:pathForLocale(locale) ofType:@"lproj" ];
        let path = NSBundle.mainBundle().pathForResource(locale, ofType: "lproj")
        // Se ja estou usando o bundle correto para o idioma atual, retorno sem fazer nada.
        if (bundle != nil && bundle.resourcePath == path) {
            NSLog("setLocale No-Op");
            return;
        }
        bundle = NSBundle(path: path!)
        print("path = \(path), resPath = \(bundle.resourcePath)")
        
        if (bundle == nil) {
            bundle = NSBundle.mainBundle()
        }
        
        OHAutoNIBi18nSetCustomBundle(bundle);
        
        NSNotificationCenter.defaultCenter().postNotificationName(NSCurrentLocaleDidChangeNotification, object: self, userInfo: nil)
    }
}