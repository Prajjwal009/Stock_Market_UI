//
//  ContentView.swift
//  SM_UI
//
//  Created by Prajjwal on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        prac2()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct prac2: View {
    @State var nColor = LinearGradient(gradient: Gradient(colors: [Color.black, Color("nnColor")]), startPoint: .leading, endPoint: .trailing)
    var body: some View {
        ZStack{
            nColor.ignoresSafeArea(.all)
            VStack {
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    HStack {
                        Text("Marketwatch").foregroundColor(.white).font(.system(size: 32)).fontWeight(.light)
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "line.horizontal.3").foregroundColor(.white).font(.system(size: 28)).padding(.trailing)
                    }.padding(.vertical).padding(.bottom,8)
                    
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                niftyView(indexName: "Dow Jones", indexValue: 35324, pPercent: 1.03)
                                niftyView(indexName: "Nifty 50", indexValue: 18003, pPercent: 5.03)
                                niftyView(indexName: "Nasdaq", indexValue: 14897, pPercent: 0.50)
                                niftyView(indexName: "Banknifty", indexValue: 39340, pPercent: 1.83)
                        }
                        }
                    
                    
                    HStack {
                        Text("Your Watchlist").foregroundColor(.white).fontWeight(.semibold).padding(.vertical).padding(.leading)
                        
                        Spacer()
                        Text("See All").fontWeight(.light).foregroundColor(.white).font(.caption2).padding(.trailing)
                    }
                    VStack{
                        instView(companyName: "GOLDBEES", exchangeName: "NSE", compValue: 123.45, change: 2.04, changeColor: .green)
                        instView(companyName: "RITES", exchangeName: "NSE", compValue: 284.10, change: 0.97, changeColor: .red)
                        
                        instView(companyName: "JUBLFOOD", exchangeName: "BSE", compValue: 4090.20, change: 4.09, changeColor: .green)
                        instView(companyName: "APOLLOHOSP", exchangeName: "NSE", compValue: 4328.21, change: 1.09, changeColor: .green)
                        instView(companyName: "INDUSINDBK", exchangeName: "NSE", compValue: 1100, change: 0.56, changeColor: .green)
                        instView(companyName: "LT", exchangeName: "NSE", compValue: 1789.22, change: 3.45, changeColor: .red)
                        instView(companyName: "TCS", exchangeName: "BSE", compValue: 1123.67, change: 3.45, changeColor: .red)
                    }
                    
                })
                TabViewBot()
               
            
            
            
        }
        
           
    }
    
}



struct niftyView : View {
    
    @State var indexName : String
    @State var indexValue : Int
    @State var pPercent: Double
    
    @State var nColor = LinearGradient(gradient: Gradient(colors: [Color("niftyColor"),Color.black]), startPoint: .topLeading, endPoint: .trailing)
    
    @State var nColor2 = LinearGradient(gradient: Gradient(colors: [Color.black,Color("niftyColor"),]), startPoint: .topLeading, endPoint: .trailing)
    var body: some View{
        
       
                ZStack {
                    nColor.frame(width : 150,height : 150).cornerRadius(20)
                    
                    
                    VStack {
                        Text(indexName).fontWeight(.bold)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Text("\(indexValue)")
                            .foregroundColor(.green).fontWeight(.semibold).font(.callout)
                            .padding(.top,10)
                        
                        Text("\(pPercent,specifier: "%.2f") %").foregroundColor(.green).fontWeight(.light).font(.callout)
                            
                            
                    }
                    .frame(width : 150,height : 150)
                    
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    
                    
                }
                .padding(.horizontal,10)
    }
                
               
            }
            

}

struct instView : View{
    @State var companyName : String
    @State var exchangeName : String
    @State var compValue : Double
    @State var change : Double
    @State var changeColor : Color
    var body: some View{
        VStack {
            Rectangle().frame(width : UIScreen.main.bounds.width-20,height: 1).foregroundColor(.gray.opacity(0.4)).padding(.vertical,8)
            HStack{
                VStack(alignment : .leading){
                    Text(companyName).foregroundColor(.white).fontWeight(.light)
                    
                    Text(exchangeName).foregroundColor(.white).font(.caption2)
                }.padding(.leading)
                
                Spacer()
                
                VStack(alignment : .trailing){
                    Text("\(compValue,specifier: "%.2f")").foregroundColor(changeColor)
                    Text("\(change,specifier: "%.2f") %").foregroundColor(changeColor).font(.system(size: 14))
                }.padding(.trailing)
                
                
            }
        }
    }
}
struct TabViewBot : View{
    var body: some View{
        HStack(spacing : 50){
            VStack {
                Image(systemName: "bookmark").foregroundColor(.white).padding(.bottom,1).font(.system(size: 20))
                Text("Watchlist").foregroundColor(.white).font(.system(size: 13))
            }.padding(.top,11)
            VStack {
                Image(systemName: "book").foregroundColor(.white).padding(.bottom,1).font(.system(size: 20))
                Text("Orders").foregroundColor(.white).font(.system(size: 13))
            }.padding(.top,11)
            VStack {
                Image(systemName: "bag").foregroundColor(.white).padding(.bottom,1).font(.system(size: 20))
                Text("Portfolio").foregroundColor(.white).font(.system(size: 13))
            }.padding(.top,11)
            VStack {
                Image(systemName: "person").foregroundColor(.white).padding(.bottom,1).font(.system(size: 20))
                Text("Profile").foregroundColor(.white).font(.system(size: 13))
            }.padding(.top,11)
        }.frame(maxWidth : .infinity).background(Color.gray.opacity(0.25).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    
    }
}
