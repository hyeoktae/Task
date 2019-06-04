//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/***************************************************
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 ***************************************************/
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
  {
    "name": "Orange",
    "cost": 100,
    "description": "A juicy orange"
  },
  {
    "name": "Apple",
    "cost": 200,
  },
  {
    "name": "Watermelon",
    "cost": 300,
  }
]
""".data(using: .utf8)!


struct Fruit: Codable {
    let name: String
    let cost: Int
    let description: String?
}



/***************************************************
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 ***************************************************/
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Codable {
    let name, reportID, readCount, reportDate: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case reportID = "report_id"
        case readCount = "read_count"
        case reportDate = "report_date"
    }
}



/***************************************************
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 ***************************************************/
print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      {
        "title": "Big Fish",
        "release_year": 2003
      },
      {
        "title": "Gran Torino",
        "release_year": 2008
      },
      {
        "title": "3 Idiots",
        "release_year": 2009
      },
    ]
  }
]
""".data(using: .utf8)!

struct Person: Codable {
    let name: String
    let favoriteMovies: [Movie]
    
    struct Movie: Codable {
        let title: String
        let releaseYear: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case releaseYear = "release_year"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case favoriteMovies = "favorite_movies"
    }
}

let decoded = try? JSONDecoder().decode([Person].self, from: jsonMovie)

//print(decoded)


/***************************************************
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - full_name, description, stargazers_count, forks_count, html_url
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 ***************************************************/

struct Repositories: Codable {
    let items: [Item]
}

struct Item: Codable {
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let forksCount: Int
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case htmlUrl = "html_url"
    }
}

func fetchGitHubRepositories() {
    let urlString = "https://api.github.com/search/repositories?q=user:hyeoktae"
    let url = URL(string: urlString)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
//        guard let data = data else { return }
        let response = res as? HTTPURLResponse
//        print(response)
        let resultData = try? JSONDecoder().decode(Repositories.self, from: data!)
        resultData?.items.forEach { print($0) }
    }.resume()
}

fetchGitHubRepositories()





//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
