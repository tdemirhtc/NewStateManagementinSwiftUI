//
//  ContentView.swift
//  NewStateManagement
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import SwiftUI
import SwiftData
@Observable
class DarkTheme {
    var isEnabled : Bool = false
}

//childview
struct DarkChoiceView : View {
    //bindable yapıp darktheme DarkTheme classtan observable olduğu için referans verebilirim.
    @Bindable var darkTheme : DarkTheme
    var body: some View {
        
        Toggle(isOn: $darkTheme.isEnabled) {
            EmptyView()
        }.fixedSize()
    }
}

struct ToggleView : View {
  
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        
        DarkChoiceView(darkTheme: darkTheme)
    }
}


struct informationText : View {
    
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        Text(darkTheme.isEnabled ? "Dark theme is enabled" : "dark theme not eneabled")
            .font(.title)
        //metnin rengi
            .foregroundStyle(darkTheme.isEnabled ? .white : .black)
    }
}


struct ContentView: View{
    
 
   // @State private var darkTheme = DarkTheme()
    //Darkthemeden yeni bir isntasnce olulşturmak yerine env veririz. bir değişken istemez.
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        VStack{
            
                ToggleView()
            informationText()
        }
        .frame(minWidth: .infinity,maxHeight: .infinity)
        //if cond tek satırdaki hali:
            .background(darkTheme.isEnabled ? .black : .white)
    }
}

/* struct ContentView: View {
   
    @State var counter = 0
    var body: some View {
        VStack{
            AddButtonView(counter: $counter)
            Text(String(counter))

        }
    }
    
}
struct AddButtonView : View {
   
    @Binding var counter : Int
    var body: some View {
       
        Button {
            self.counter += 1
        } label: {
            Text("Add")
        }

    }
}*/

#Preview {
    ContentView()
        .environment(DarkTheme())
    
}

