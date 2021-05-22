//
//  DatePickerViewController.swift
//  Dday
//
//  Created by 유준용 on 2021/05/16.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var userDay : String = ""
//    var userDate : Date = Date()
    var userDate : String = ""
    var userTitle : String = ""
    
    @IBOutlet weak var pickerTime: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBAction func pickComplete(_ sender: Any) {
        
        if textField.text!.count > 0 {
            userTitle = textField.text!
        } else{
            userTitle = "타이틀 입력 없음"
        }
//        let newDay = Day(userDate: userDate, title : userTitle)
        
        UserDefaults.standard.set(userDate, forKey: "userDate")
        UserDefaults.standard.set(userTitle, forKey: "userTitle")
        
//        Day.dayList.append(newDay)
            dismiss(animated: true)
        
    }
    
    
    @IBAction func getDate(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        userDay = formatter.string(from : datePickerView.date)
        
        dateLabel.text = "선택 날짜 : " + userDay
        
//        userDate = datePickerView.date
        userDate = userDay
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        print("##########")
        super.viewDidLoad()
        print("@@@@@@@@@@")
        print(#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
        
        textField.resignFirstResponder()
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
