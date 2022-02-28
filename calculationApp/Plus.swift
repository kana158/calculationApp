import SwiftUI

struct Plus: View {
    @State var symbol:String = ""
    @State var result:String = ""
    @State var a:Int = ram()
    @State var b:Int = ram()
    @State var sum:Int = -999
    @State var count:Int = 0
    @State var isCorrect = false
    var body: some View {
        VStack{
            Text("正解数：\(count)")
                .font(.title)
            Spacer()
            HStack{
                Text(String(a))
                Text(symbol)
                Text(String(b))
                Text("=")
                TextField("答え",text: $result)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:100)
            }
            .font(.largeTitle)
            .frame(width:300)
            Button(action:{
                switch symbol{
                case "+":
                    sum = a + b
                case "-":
                    sum = abs(a - b)
                case "×":
                    sum = a * b
                case "÷":
                    sum = a / b
                default:
                    sum = 0
                }
                if sum == Int(result){
                    isCorrect = true
                    count += 1
                }else{
                    isCorrect = false
                }
                a = ram()
                b = ram()
                result = ""
            }){
                Text("回答")
                    .font(.body)
                    .frame(width:60,height:40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(15,antialiased: true)
            }
            if sum != -999{
                if isCorrect == true{
                    Text("正解")
                }else{
                    Text("不正解")
                }
            }
            Spacer()
        }
    }
}

func ram() -> Int{
    return Int.random(in: 1...100)
}

struct Plus_Previews: PreviewProvider {
    static var previews: some View {
        Plus()
    }
}
