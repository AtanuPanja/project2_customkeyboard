//
//  KeyboardViewController.swift
//  AtanuKeyboardExtension
//
//  Created by promact on 23/02/24.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    // outlets for accessing the first and second keyboard stack views
    @IBOutlet weak var FirstKeyboard: UIStackView!
    @IBOutlet weak var SecondKeyboard: UIStackView!
    
    
    // first keyboard buttons
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
    @IBOutlet weak var numbersOutlet: UIButton!
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
    
    
    // second keyboard buttons
    @IBOutlet weak var lettersOutlet: UIButton!
    @IBOutlet weak var one_digitOutlet: UIButton!
    @IBOutlet weak var two_digitOutlet: UIButton!
    @IBOutlet weak var three_digitOutlet: UIButton!
    @IBOutlet weak var four_digitOutlet: UIButton!
    @IBOutlet weak var five_digitOutlet: UIButton!
    @IBOutlet weak var six_digitOutlet: UIButton!
    @IBOutlet weak var seven_digitOutlet: UIButton!
    @IBOutlet weak var eight_digitOutlet: UIButton!
    @IBOutlet weak var nine_digitOutlet: UIButton!
    @IBOutlet weak var zero_digitOutlet: UIButton!
    
    @IBOutlet weak var tilde_charOutlet: UIButton!
    @IBOutlet weak var exclamation_charOutlet: UIButton!
    @IBOutlet weak var pound_charOutlet: UIButton!
    @IBOutlet weak var hash_charOutlet: UIButton!
    @IBOutlet weak var dollar_charOutlet: UIButton!
    @IBOutlet weak var percent_charOutlet: UIButton!
    @IBOutlet weak var cap_charOutlet: UIButton!
    @IBOutlet weak var ampersand_charOutlet: UIButton!
    @IBOutlet weak var asterisk_charOutlet: UIButton!
    @IBOutlet weak var equals_charOutlet: UIButton!
    
    @IBOutlet weak var backtick_charOutlet: UIButton!
    @IBOutlet weak var euro_charOutlet: UIButton!
    @IBOutlet weak var yen_charOutlet: UIButton!
    @IBOutlet weak var openParan_charOutlet: UIButton!
    @IBOutlet weak var closeParan_charOutlet: UIButton!
    @IBOutlet weak var moveLeftOutlet: UIButton!
    @IBOutlet weak var singleQuote_charOutlet: UIButton!
    @IBOutlet weak var doubleQuote_charOutlet: UIButton!
    @IBOutlet weak var minus_charOutlet: UIButton!
    @IBOutlet weak var plus_charOutlet: UIButton!
    @IBOutlet weak var delete2Outlet: UIButton!
    
    @IBOutlet weak var keyboardDismiss2Outlet: UIButton!
    @IBOutlet weak var specialChars2Outlet: UIButton!
    @IBOutlet weak var settings2Outlet: UIButton!
    @IBOutlet weak var space2_charOutlet: UIButton!
    @IBOutlet weak var comma_charOutlet: UIButton!
    @IBOutlet weak var period_charOutlet: UIButton!
    @IBOutlet weak var slash2_charOutlet: UIButton!
    @IBOutlet weak var return2_Outlet: UIButton!
    
    
    // next keyboard button
    @IBOutlet var nextKeyboardButton: UIButton!
    
    
    // creating an array, associating a number, with the respective letter outlet in first keyboard
    var letterOutlets: [Int: UIButton?] = [:]
    
    // defining variable for handling shift button pressed
    // the initial values of the keys will be uppercase
    // then, on pressing the shift key, this variable will be toggled, and all the letters' cases are toggled
    // also the view is changed
    var shiftButtonPressed: Bool = true
    // added a new bool variable to check if shift button has been pressed twice
    var shiftButtonDoublePressed: Bool = false
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        // removed the title for the Next Keyboard Button
        self.nextKeyboardButton.setTitle(NSLocalizedString("", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // first keyboard functionality
        
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
        
        // handling single click of shift button
        self.capsOutlet.addTarget(self, action: #selector(shiftButtonSingleClickHandler), for: .touchUpInside)
        // added one more action for handling double click event on shift button
        self.capsOutlet.addTarget(self, action: #selector(shiftButtonDoubleClickHandler), for: .touchDownRepeat)
        
        self.deleteOutlet.addTarget(self, action: #selector(deletePrecedingCharacter), for: .touchUpInside)
        
        self.at_charOutlet.addTarget(self, action: #selector(atButtonPressed), for: .touchUpInside)
        
        self.space_charOutlet.addTarget(self, action: #selector(spaceButtonPressed), for: .touchUpInside)
        
        self.minusUnderscore_charOutlet.addTarget(self, action: #selector(minusUnderscoreButtonPressed), for: .touchUpInside)
        
        self.commaLesser_charOutlet.addTarget(self, action: #selector(commaLesserButtonPressed), for: .touchUpInside)
        
        self.periodGreater_charOutlet.addTarget(self, action: #selector(periodGreaterButtonPressed), for: .touchUpInside)
        
        self.slash_charOutlet.addTarget(self, action: #selector(slashQuestionMarkButtonPressed), for: .touchUpInside)
        
        self.semicolonOutlet.addTarget(self, action: #selector(colonSemiColonButtonPressed), for: .touchUpInside)
        
        
        self.specialCharsOutlet.setTitle(String(unicodeScalarLiteral: "\u{00F1}") + "{" + String(unicodeScalarLiteral: "\u{00AE}"), for: .normal)
        
        self.numbersOutlet.addTarget(self, action:  #selector(showSecondKeyboard), for: .touchUpInside)
        
        self.keyboardDismissChangeOutlet.addTarget(self, action: #selector(closeKeyboard), for: .touchUpInside)
        
        // second keyboard functionality
        self.specialChars2Outlet.setTitle(String(unicodeScalarLiteral: "\u{00F1}") + "{" + String(unicodeScalarLiteral: "\u{00AE}"), for: .normal)
        
        
        self.lettersOutlet.addTarget(self, action: #selector(showFirstKeyboard), for: .touchUpInside)
        
        var secondKeyboardTextOutlets = [
            self.one_digitOutlet,
            self.two_digitOutlet,
            self.three_digitOutlet,
            self.four_digitOutlet,
            self.five_digitOutlet,
            self.six_digitOutlet,
            self.seven_digitOutlet,
            self.eight_digitOutlet,
            self.nine_digitOutlet,
            self.zero_digitOutlet,
            self.tilde_charOutlet,
            self.exclamation_charOutlet,
            self.pound_charOutlet,
            self.hash_charOutlet,
            self.dollar_charOutlet,
            self.percent_charOutlet,
            self.cap_charOutlet,
            self.ampersand_charOutlet,
            self.asterisk_charOutlet,
            self.equals_charOutlet,
            self.backtick_charOutlet,
            self.euro_charOutlet,
            self.yen_charOutlet,
            self.openParan_charOutlet,
            self.closeParan_charOutlet,
            self.singleQuote_charOutlet,
            self.doubleQuote_charOutlet,
            self.minus_charOutlet,
            self.plus_charOutlet,
            self.slash2_charOutlet,
        ]
        // adding the input functionality to all the input keys
        for secondKeyboardTextOutlet in secondKeyboardTextOutlets {
            secondKeyboardTextOutlet?.addTarget(self, action: #selector(inputTextSecondKeyboard), for: .touchUpInside)
        }
        
        self.delete2Outlet.addTarget(self, action: #selector(deletePrecedingCharacter), for: .touchUpInside)
        
        self.space2_charOutlet.addTarget(self, action: #selector(spaceButtonPressed), for: .touchUpInside)
        
        self.keyboardDismiss2Outlet.addTarget(self, action: #selector(closeKeyboard), for: .touchUpInside)
        
        self.moveLeftOutlet.addTarget(self, action: #selector(moveCursorLeft), for: .touchUpInside)
        
        self.comma_charOutlet.addTarget(self, action: #selector(commaButtonPressed), for: .touchUpInside)
        
        self.period_charOutlet.addTarget(self, action: #selector(periodButtonPressed), for: .touchUpInside)
        
    }
    
    
    
    // functions for second keyboard buttons
    
    // insert period to the text field
    @objc func periodButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(".")
    }
    
    // insert comma to the text field
    @objc func commaButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(",")
    }
    
    // moves the cursor to the previous character
    @objc func moveCursorLeft() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.adjustTextPosition(byCharacterOffset: -1)
    }
    
    // input the text on the key as is
    @objc func inputTextSecondKeyboard(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if let titleLabel = sender.titleLabel {
            if let text = titleLabel.text {
                proxy.insertText(text)
            }
        }
        
    }
    
    
    // functions for first keyboard buttons
    // learned about alpha values and used it to hide/show the keyboards
    @objc func showSecondKeyboard() {
        self.FirstKeyboard.alpha = 0
        self.SecondKeyboard.alpha = 1
    }
    
    @objc func showFirstKeyboard() {
        self.FirstKeyboard.alpha = 1
        self.SecondKeyboard.alpha = 0
    }
    
    // method to close the keyboard
    @objc func closeKeyboard() {
        self.dismissKeyboard()
    }
    
    // added the functionality of double clicking the shift button, to keep the letters uppercased, and the characters such as <, >, ? ... active. Again on double press of the shift button, this behaviour is toggled
    // separately handling the double press event for each of the action methods below
    
    
    // added this functionality:
    // when the less than, greater than, ?, underscore, : are active,
    // pressing the button, would print to the screen the respective character, and then toggle the shift pressed button
    // i.e., now the buttons would act as comma, period, /, hyphen and ;
    // also alongwith them, the letters are also toggled
    
    // defined the functionality for colon and semi colon button
    @objc func colonSemiColonButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if shiftButtonDoublePressed {
            proxy.insertText(":")
        } else if shiftButtonPressed {
            proxy.insertText(":")
            shiftButtonPressed = !shiftButtonPressed
            setLetterButtonsCase()
        } else {
            proxy.insertText(";")
        }
    }
    
    // defined the functionality for slash and question mark button
    @objc func slashQuestionMarkButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if shiftButtonDoublePressed {
            proxy.insertText("?")
        } else if shiftButtonPressed {
            proxy.insertText("?")
            shiftButtonPressed = !shiftButtonPressed
            setLetterButtonsCase()
        } else {
            proxy.insertText("/")
        }
    }
    
    // defined the functionality for period and greater than
    @objc func periodGreaterButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if shiftButtonDoublePressed {
            proxy.insertText(">")
        } else if shiftButtonPressed {
            proxy.insertText(">")
            shiftButtonPressed = !shiftButtonPressed
            setLetterButtonsCase()
        } else {
            proxy.insertText(".")
        }
    }
    
    // defined the functionality for comma and lesser than
    @objc func commaLesserButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if shiftButtonDoublePressed {
            proxy.insertText("<")
        } else if shiftButtonPressed {
            proxy.insertText("<")
            shiftButtonPressed = !shiftButtonPressed
            setLetterButtonsCase()
        } else {
            proxy.insertText(",")
        }
    }
    
    // defined the functionality for underscore and hyphen
    @objc func minusUnderscoreButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if shiftButtonDoublePressed {
            proxy.insertText("_")
        } else if shiftButtonPressed {
            proxy.insertText("_")
            shiftButtonPressed = !shiftButtonPressed
            setLetterButtonsCase()
        } else {
            proxy.insertText("-")
        }
    }
    
    // defined the functionality for space button
    @objc func spaceButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(" ")
    }
    
    // defined the functionality for at button
    @objc func atButtonPressed() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("@")
    }
    
    // updated the functionality for delete button
    // when the whole text is deleted, the shift button press is set to true
    // letters are uppercase, and underscore, question mark, colon, <, > are active
    // again when these buttons are clicked, the shift button press is toggled as defined above
    
    // defined the functionality for delete button
    @objc func deletePrecedingCharacter() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
        
        if !proxy.hasText {
            shiftButtonPressed = true
            setLetterButtonsCase()
        }
    }
    
    // updated the functionality
    // when the uppercase letter is pressed, it prints the uppercase letter to the input, and then again all the letters are lowercase
    // defined the functionality for text input
    @objc func inputTextIntoField(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        print(sender.tag)
        // converting the number ascii value into String
        var asciiNumber = sender.tag
        if shiftButtonDoublePressed {
            asciiNumber = asciiNumber + 64
        } else if shiftButtonPressed {
            asciiNumber = asciiNumber + 64
            shiftButtonPressed = !shiftButtonPressed
            // update the letters display, and also, update the other letters input
            setLetterButtonsCase()
        } else {
            asciiNumber = asciiNumber + 96
        }
        
        if let text = UnicodeScalar(asciiNumber) {
            let stringText = String(text)
            print(stringText)
            proxy.insertText(stringText)
        }
        
    }
    
    // handler for shift button pressed one time
    @objc func shiftButtonSingleClickHandler() {
        
        shiftButtonPressed = !shiftButtonPressed
        setLetterButtonsCase()
    }
    
    // handler for shift button pressed two times
    @objc func shiftButtonDoubleClickHandler() {
        shiftButtonDoublePressed = !shiftButtonDoublePressed
        setLetterButtonsCase()
    }
    
    // extracted the functionality for changing the display on the letter buttons
    // into a new function
    func setLetterButtonsCase() {
        for (_, letterOutlet) in letterOutlets {
            if let letterOutlet = letterOutlet {
                var asciiNumber = letterOutlet.tag
                if shiftButtonDoublePressed || shiftButtonPressed {
                    asciiNumber += 64
                } else {
                    asciiNumber += 96
                }
                
                if let text = UnicodeScalar(asciiNumber) {
                    let stringText = String(text)
                    letterOutlet.setTitle(stringText, for: .normal)
                }
            }
            
        }
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
