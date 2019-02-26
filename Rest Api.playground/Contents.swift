//What we need:
//Pokemon name
//Pokemon Weight
//Type name
//abilityName

/*
struct Pokemon: Equatable, Codable {
    let name: String
    let weight: Int
    let abilities: [Ability]
    
    
    struct Ability : Equatable, Codable {
        
        let ability : SubAbility
        struct SubAbility : Equatable, Codable {
            let name : String
        }
        
    }
    
    let types: [PokemonType]
    
    struct PokemonType: Equatable, Codable  {
        
        let type : SubPokemonType
        
        struct SubPokemonType : Equatable, Codable {
            let name : String
        }
    }
}

*/

//CLOSURE



//"before: \(a) and \(b)"
//exchange(lhs: &a, rhs: &b) note the inout notation

//What we need:
//Pokemon name
//Pokemon Weight
//Type name
//abilityName

struct PokeMon: Codable {
    
    var name: String
    var Weight: Int
    var abilities: [Abilities]
    
    struct Abilities : Codable {
        let ability: [Ability]
        
        struct Ability: Codable {
            let name: String
        }
    }
    
    var types: [Types]
    
    struct Types: Codable {
        let type: [SubType]
        
        struct SubType: Codable {
            let name: String
        }
    }
    
    
}



























