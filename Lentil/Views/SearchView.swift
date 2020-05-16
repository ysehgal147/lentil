//
//  SearchView.swift
//  Lentil
//
//  Created by Yogesh Sehgal on 05/05/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    let lentilList: [LentilList] = [
        LentilList(name: "Arhar Dal",detail:"Pigeon Peas, Arhar, Toor"),
        LentilList(name: "Chana Dal",detail:"Chick Peas, Split Bengal Gram, Split Brown Chickpeas"),
        LentilList(name: "Kala Chana",detail:"Chick Peas, Bengal Gram"),
        LentilList(name: "Lobia Dal",detail:"Black Eyed Peas, Raungi, Chawli, Lobia"),
        LentilList(name: "Malka Masoor Dal",detail:"Split Brown Lentils"),
        LentilList(name: "Moong Chilka Dal",detail:"Split Green Gram with Skin"),
        LentilList(name: "Moong Dal",detail:"Split Mung Beans"),
        LentilList(name: "Moong Sabut Dal",detail:"Green Gram Whole"),
        LentilList(name: "Rajma Dal",detail:"Kidney Beans"),
        LentilList(name: "Sabut Urad Dal",detail:"Black Gram Whole,Black Gram Lentils"),
        LentilList(name: "Urad Chilka Dal",detail:"Black Gram Lentils"),
        LentilList(name: "White Chana Dal",detail:"Chick Peas, Garbanzo Beans, Kabuli Chana, Safed Chana,  Chole")
        ]
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.black // tableview background
        UITableViewCell.appearance().backgroundColor = UIColor.black // cell background
        //UITableViewCell.appearance().content = UIColor.white
        UINavigationBar.appearance().tintColor=UIColor.orange
        UINavigationBar.appearance().barTintColor=UIColor.clear
        UITableViewCell.appearance().tintColor=UIColor.black
        UITableView.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        }
    
    var body: some View{
        ZStack {
            Color.black
            .edgesIgnoringSafeArea(.all)
            VStack {
                List(lentilList, id: \.name) { dal in
                    VStack(alignment: .leading) {
                        Text(dal.name)
                            .font(.headline)
                            .foregroundColor(Color.orange)
                        Text(dal.detail)
                            .font(.caption)
                            .foregroundColor(Color.orange)
                    }
                }
            }.navigationBarTitle("Lentil",displayMode: .inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct LentilList: Identifiable {
  var id = UUID()
  var name: String
    var detail: String
}
