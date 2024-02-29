//
//  KeyboardViewController.swift
//  AtanuKeyboardExtension
//
//  Created by promact on 23/02/24.
//

import UIKit

enum LetterTags {
    
}

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
    
    // creating an array, associating a number, with the respective letter outlet
    var letterOutlets: [Int: UIButton?] = [:]
    
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
        
        
        
        // letter buttons in the keyboard
        
        // initializing the letterOutlets array
        letterOutlets = [
            1: self.a_letterOutlet,
            2: self.b_letterOutlet,
            3: self.c_letterOutlet,
            4: self.d_letterOutlet,
            5: self.e_letterOutlet,
            6: self.f_letterOutlet,
            7: self.g_letterOutlet,
            8: self.h_letterOutlet,
            9: self.i_letterOutlet,
            10: self.j_letterOutlet,
            11: self.k_letterOutlet,
            12: self.l_letterOutlet,
            13: self.m_letterOutlet,
            14: self.n_letterOutlet,
            15: self.o_letterOutlet,
            16: self.p_letterOutlet,
            17: self.q_letterOutlet,
            18: self.r_letterOutlet,
            19: self.s_letterOutlet,
            20: self.t_letterOutlet,
            21: self.u_letterOutlet,
            22: self.v_letterOutlet,
            23: self.w_letterOutlet,
            24: self.x_letterOutlet,
            25: self.y_letterOutlet,
            26: self.z_letterOutlet,
        ]
        
        // adding a index as the tag, and the inputTextIntoField method as selector for each outlet
        for (index, letterOutlet) in letterOutlets {
            print(index)
            letterOutlet?.tag = index;
            letterOutlet?.addTarget(self, action: #selector(inputTextIntoField), for: .touchUpInside)
        }
        
        
        self.capsOutlet.addTarget(self, action: #selector(shiftButtonHandler), for: .touchUpInside)
        
        self.deleteOutlet.addTarget(self, action: #selector(deletePrecedingCharacter), for: .touchUpInside)
        
    }
    
    // defined the functionality for delete button
    @objc func deletePrecedingCharacter() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        textDocumentProxy.deleteBackward()
    }
    
    // defined the functionality for text input
    @objc func inputTextIntoField(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        print(sender.tag)
        // converting the number ascii value into String
        if let text = UnicodeScalar(sender.tag + 96) {
            let stringText = String(text)
            print(stringText)
            proxy.insertText(stringText)
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
