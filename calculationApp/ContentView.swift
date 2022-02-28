import SwiftUI

struct ContentView: View {
    let arr = ["足し算","引き算\n(絶対値を答えてください)","掛け算","割り算"]
    let symbols = ["+","-","×","÷"]
    var body: some View{
        NavigationView{
            List{
                ForEach(0...3,id:\.self){item in
                    NavigationLink(destination: Plus(symbol:symbols[item])){
                        Text(arr[item])
                    }
                }
            }.navigationTitle("計算")
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
