//
//  ContentView.swift
//  MyCalculator
//
//  Created by 김유미 on 2023/01/26.
//

import SwiftUI

enum ButtonType:String {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, zero
    case point, equal, plus, minus, multiply, divide
    case percent, opposite, clear
    
    var buttonDisplayName: String {
        switch self {
        case .zero:
            return "0"
        case .first:
            return "1"
        case .second:
            return "2"
        case .third:
            return "3"
        case .fourth:
            return "4"
        case .fifth:
            return "5"
        case .sixth:
            return "6"
        case .seventh:
            return "7"
        case .eighth:
            return "8"
        case .ninth:
            return "9"
        case .clear:
            return "C"
        case .opposite:
            return "+/-"
        case .percent:
            return "%"
        case .divide:
            return "÷"
        case .multiply:
            return "X"
        case .minus:
            return "-"
        case .plus:
            return "+"
        case .equal:
            return "="
        case .point:
            return "."

        }
    }
    
    var backgroundColor: Color{
        switch self{
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .ninth, .zero, .point:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiply, .divide:
            return Color.orange
        case .percent, .opposite, .clear:
            return Color.gray
        }
    }
    
    var foregroundColor: Color{
        switch self{
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .ninth, .zero, .point, .equal, .plus, .minus, .multiply, .divide:
            return Color.white
        case .percent, .opposite, .clear:
            return Color.black
        }
    }
}

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State var tempNumber: Int = 0
    @State var operatorType: ButtonType = .clear
    @State var isNotEditing: Bool = true

    private let buttonData: [[ButtonType]] = [
        [.clear,.opposite, .percent, .divide],
        [.seventh, .eighth, .ninth, .multiply],
        [.fourth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .point, .equal],
    ]
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }   // 결과창
                
                ForEach(buttonData, id: \.self){ line in
                    HStack{
                        ForEach(line, id:\.self){ item in
                            Button{
                                if isNotEditing { // 초기 상태
                                    
                                    if item == .clear {
                                        totalNumber = "0"
                                        isNotEditing = true
                                    } else if item == .plus ||
                                                item == .minus ||
                                                item == .multiply ||
                                                item == .divide {
                                        totalNumber = "Error"
                                    }
                                    else{
                                        totalNumber = item.buttonDisplayName
                                        isNotEditing = false
                                    }
                                }else{                 // 초기 상태 아님
                                    if item == .clear {
                                        totalNumber = "0"
                                        isNotEditing = true // 새로 입력받을 예정
                                    }else if item == .plus {
                                        tempNumber = Int(totalNumber) ?? 0      // 숫자를 저장. 숫자가 아니라면 0
                                        operatorType = .plus    // 더하기
                                        isNotEditing = true
                                    }else if item == .multiply {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .multiply
                                        isNotEditing = true
                                    }else if item == .minus {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .minus
                                        isNotEditing = true 
                                    }else if item == .equal {
                                        if operatorType == .plus {
                                            totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
                                        }else if operatorType == .multiply {
                                            totalNumber = String((Int(totalNumber) ?? 0) * tempNumber)
                                        }else if operatorType == .minus {
                                            totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
                                        }
                                    }else {
                                        totalNumber += item.buttonDisplayName
                                    }
                                }
                            } label: {
                                Text(item.buttonDisplayName)
                                    .bold()
                                    .frame(width: calculateButtonWidth(button: item),
                                           height: calculateButtonHeight(button: item ))
                                    .background(item.backgroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.foregroundColor)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
                
                
            }
        }
        
    }
    
    private func calculateButtonWidth(button buttonType: ButtonType) -> CGFloat {
        // (전체 너비 - 5 * 10) / 4
        switch buttonType{
        case .zero:
            return (UIScreen.main.bounds.width - 5*10) / 4 * 2
        default:
            return (UIScreen.main.bounds.width - 5*10) / 4
        }
    }
    
    private func calculateButtonHeight(button: ButtonType) -> CGFloat {
        return (UIScreen.main.bounds.width - 5*10) / 4
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
