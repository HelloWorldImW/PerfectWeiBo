//
//  ContentView.swift
//  PerfectWeiBo
//
//  Created by Joe on 2020/9/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView {
                LazyVStack {
                }.navigationBarTitle("首页", displayMode: .inline)
            }.tabItem {
                Image(systemName: "house")
                Text("首页")
            }
            NavigationView {
                Text("").navigationBarTitle("添加", displayMode: .inline)
            }.tabItem {
                Image(systemName: "plus.circle.fill")
                Text("添加")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
