//
//  ContentView.swift
//  AcatAPI
//
//  Created by Remachann . on 10/11/1444 AH.
//
import SwiftUI

let CatLink = "https://api.thecatapi.com/v1/images/search?limit=10"
struct SomeCat: View {
    @State var FavCat = [Cat]()
    
    
    var body: some View {
        
        List (FavCat) { One in
            VStack(alignment:.leading){
                AsyncImage(url: URL(string:One.url))
                    .font(.headline)
                Text(One.id)
            }
            .task {
                await loadData()
            }
            
        }
        
    }
    //
    func loadData() async{
    guard let url = URL(string: CatLink) else {
        return
    }
    do{
        let (data,_) = try await URLSession.shared.data(from: url)
        let decodeCat = try JSONDecoder().decode(Responsee.self, from: data)
        FavCat = decodeCat.result
    }
    catch{
        print(error)
    }
}
}

struct AllCats_Previews: PreviewProvider {
    static var previews: some View {
        SomeCat()
    }
}
