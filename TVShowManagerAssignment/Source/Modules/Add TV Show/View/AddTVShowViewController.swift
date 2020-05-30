//
//  AddTVShowViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class AddTVShowViewController: UIViewController, StoryboardBased {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var releaseYearTextField: UITextField!
    @IBOutlet private weak var numberOfSeasonsTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!

    @IBOutlet private weak var yearPicker: UIPickerView!
    @IBOutlet private weak var seasonCountPicker: UIPickerView!
    @IBOutlet private weak var inputAccessoryToolbar: UIToolbar?

    private let years: [Int] = {
        let components = Calendar.current.dateComponents([.year], from: Date())
        return Array(1900...components.year!).reversed()
    }()
    private let seasonNumbers = Array(1...100)

    var router: Router?
    var output: AddTVShowViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupYearPicker()
        setupSeasonCountPicker()
        setupInputAccessory()

        output.onViewReady()
    }
}

private extension AddTVShowViewController {

    func setupInputAccessory() {
        releaseYearTextField.inputAccessoryView = inputAccessoryToolbar
        numberOfSeasonsTextField.inputAccessoryView = inputAccessoryToolbar
        titleTextField.inputAccessoryView = inputAccessoryToolbar
    }

    func setupYearPicker() {
        releaseYearTextField.inputView = yearPicker
    }

    func setupSeasonCountPicker() {
        numberOfSeasonsTextField.inputView = seasonCountPicker
    }

    func saveTVShowInput() {
        let tvShowModel = TVShowViewModel(title: titleTextField.text, yearOfRelease: releaseYearTextField.text, numberOfSeasons: numberOfSeasonsTextField.text)
        output.onTVShowSave(tvShowModel: tvShowModel)
    }
}

private extension AddTVShowViewController {

    @IBAction func onSave() {
        saveTVShowInput()
    }

    @IBAction func onEndEditing() {
        self.view.endEditing(true)
    }
}

extension AddTVShowViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case yearPicker:
            return years.count
        case seasonCountPicker:
            return seasonNumbers.count
        default:
            return 0
        }
    }
}

extension AddTVShowViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case yearPicker:
            return String(years[row])
        case seasonCountPicker:
            return String(seasonNumbers[row])
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case yearPicker:
            releaseYearTextField.text = String(years[row])
        case seasonCountPicker:
            numberOfSeasonsTextField.text = String(seasonNumbers[row])
        default:
            return
        }
    }
}

extension AddTVShowViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField == titleTextField else { return true }
        releaseYearTextField.becomeFirstResponder()
        return false
    }
}
