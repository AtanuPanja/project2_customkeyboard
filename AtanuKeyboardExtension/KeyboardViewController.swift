//
//  KeyboardViewController.swift
//  AtanuKeyboardExtension
//
//  Created by promact on 23/02/24.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    
    @IBOutlet weak var f_letterOutlet: UIButton!
    @IBOutlet weak var g_letterOutlet: UIButton!
    @IBOutlet weak var h_letterOutlet: UIButton!
    @IBOutlet weak var Tr_outlet: UIButton!
    @IBOutlet weak var j_letterOutlet: UIButton!
    @IBOutlet weak var k_letterOutlet: UIButton!
    @IBOutlet weak var l_letterOutlet: UIButton!
    @IBOutlet weak var m_letterOutlet: UIButton!
    @IBOutlet weak var n_letterOutlet: UIButton!
    @IBOutlet weak var deleteOutlet: UIButton!
    @IBOutlet weak var capsOutlet: UIButton!
    @IBOutlet weak var e_letterOutlet: UIButton!
    @IBOutlet weak var i_letterOutlet: UIButton!
    @IBOutlet weak var o_letterOutlet: UIButton!
    @IBOutlet weak var Tplus_outlet: UIButton!
    @IBOutlet weak var p_letterOutlet: UIButton!
    @IBOutlet weak var q_letterOutlet: UIButton!
    @IBOutlet weak var r_letterOutlet: UIButton!
    @IBOutlet weak var s_letterOutlet: UIButton!
    @IBOutlet weak var t_letterOutlet: UIButton!
    @IBOutlet weak var semicolonOutlet: UIButton!
    @IBOutlet weak var a_letterOutlet: UIButton!
    @IBOutlet weak var b_letterOutlet: UIButton!
    @IBOutlet weak var c_letterOutlet: UIButton!
    @IBOutlet weak var d_letterOutlet: UIButton!
    @IBOutlet weak var u_letterOutlet: UIButton!
    @IBOutlet weak var v_letterOutlet: UIButton!
    @IBOutlet weak var w_letterOutlet: UIButton!
    @IBOutlet weak var x_letterOutlet: UIButton!
    @IBOutlet weak var y_letterOutlet: UIButton!
    @IBOutlet weak var z_letterOutlet: UIButton!
    @IBOutlet weak var specialCharsOutlet: UIButton!
    @IBOutlet weak var keyboardDismissChangeOutlet: UIButton!
    @IBOutlet weak var at_charOutlet: UIButton!
    @IBOutlet weak var minusUnderscore_charOutlet: UIButton!
    @IBOutlet weak var settingsOutlet: UIButton!
    @IBOutlet weak var space_charOutlet: UIButton!
    @IBOutlet weak var commaLesser_charOutlet: UIButton!
    @IBOutlet weak var periodGreater_charOutlet: UIButton!
    @IBOutlet weak var slash_charOutlet: UIButton!
    @IBOutlet weak var returnOutlet: UIButton!
    
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        
        // buttons in the keyboard
        self.f_letterOutlet.tag = 6
        self.f_letterOutlet.addTarget(self, action: #selector(inputTextIntoField), for: .touchUpInside)
        
        
        
        
        
        self.capsOutlet.addTarget(self, action: #selector(shiftButtonHandler), for: .touchUpInside)
        
    }
    
    
    
    @objc func inputTextIntoField(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        switch(sender.tag) {
        case 6:
            proxy.insertText("f")
            break
        default:
            break
        }
        
    }
    
    @objc func shiftButtonHandler() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("caps lock")
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
