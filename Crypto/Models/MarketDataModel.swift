//
//  MarketDataModel.swift
//  Crypto
//
//  Created by Maxim Granchenko on 06.07.2021.
//

import Foundation

//Response API
/*
url https://api.coingecko.com/api/v3/global

{
  "data": {
    "active_cryptocurrencies": 8370,
    "upcoming_icos": 0,
    "ongoing_icos": 50,
    "ended_icos": 3375,
    "markets": 625,
    "total_market_cap": {
      "btc": 43748048.8648324,
      "eth": 643495826.7438262,
      "ltc": 10780753907.164297,
      "bch": 2915876692.0437446,
      "bnb": 4751338952.501374,
      "eos": 384333344127.8168,
      "xrp": 2242498485847.5293,
      "xlm": 5701088495808.999,
      "link": 76171358531.04207,
      "dot": 95983473879.13362,
      "yfi": 42780194.78314596,
      "usd": 1496045797808.6035,
      "aed": 5495275424510.575,
      "ars": 143344974558249.3,
      "aud": 1974307702635.2517,
      "bdt": 126882353451087.69,
      "bhd": 563546987622.321,
      "bmd": 1496045797808.6035,
      "brl": 7637912216132.03,
      "cad": 1849003394748.1936,
      "chf": 1380577991042.1387,
      "clp": 1101269232682871,
      "cny": 9673132919470.86,
      "czk": 32350693305904.38,
      "dkk": 9394980604513.309,
      "eur": 1263425636707.3447,
      "gbp": 1078770199929.6279,
      "hkd": 11619204253718.283,
      "huf": 446138460877429.8,
      "idr": 21671872894425444,
      "ils": 4882303571866.027,
      "inr": 111449800268953.55,
      "jpy": 165491389316949.53,
      "krw": 1695930828211341,
      "kwd": 450372619063.8959,
      "lkr": 298082107475758.5,
      "mmk": 2462405885671664.5,
      "mxn": 29626583905911.207,
      "myr": 6216818312793.654,
      "ngn": 615607885340263,
      "nok": 12901346919401.998,
      "nzd": 2110138188755.6855,
      "php": 74192651227823.31,
      "pkr": 238011790472898.12,
      "pln": 5677269395813.966,
      "rub": 109790462568359.97,
      "sar": 5610677405261.91,
      "sek": 12814414690182.938,
      "sgd": 2011164286910.064,
      "thb": 48171178643639.23,
      "try": 12953123568418.355,
      "twd": 41824205842482.016,
      "uah": 40800204383164.39,
      "vef": 149799065734.57565,
      "vnd": 34418977098613380,
      "zar": 21261802878455.883,
      "xdr": 1050512886900.615,
      "xag": 55998116246.32418,
      "xau": 824889731.9957087,
      "bits": 43748048864832.4,
      "sats": 4374804886483240
    },
    "total_volume": {
      "btc": 2839071.55050102,
      "eth": 41760278.27479042,
      "ltc": 699627354.9330125,
      "bch": 189228611.92571115,
      "bnb": 308342694.059612,
      "eos": 24941680635.712692,
      "xrp": 145529088003.03647,
      "xlm": 369977600723.3823,
      "link": 4943213299.332663,
      "dot": 6228939508.832882,
      "yfi": 2776261.732471372,
      "usd": 97087325561.1483,
      "aed": 356621164251.21075,
      "ars": 9302509477234.426,
      "aud": 128124590145.83861,
      "bdt": 8234151905987.591,
      "bhd": 36571921752.95454,
      "bmd": 97087325561.1483,
      "brl": 495669631919.8856,
      "cad": 119992847018.81332,
      "chf": 89593931599.68768,
      "clp": 71467922092072.61,
      "cny": 627747229613.2721,
      "czk": 2099429240548.5723,
      "dkk": 609696268608.3165,
      "eur": 81991217309.64542,
      "gbp": 70007825802.95853,
      "hkd": 754039393576.4703,
      "huf": 28952582908894.395,
      "idr": 1406416957490824,
      "ils": 316841768523.691,
      "inr": 7232641579747.379,
      "jpy": 10739722283713.78,
      "krw": 110059056139140.5,
      "kwd": 29227362661.579094,
      "lkr": 19344323987168.87,
      "mmk": 159800189430081.75,
      "mxn": 1922645550792.0657,
      "myr": 403446381369.3519,
      "ngn": 39950463595156.96,
      "nok": 837245270416.2104,
      "nzd": 136939439695.51176,
      "php": 4814803192891.256,
      "pkr": 15446003205839.283,
      "pln": 368431837405.7228,
      "rub": 7124957269688.56,
      "sar": 364110286370.345,
      "sek": 831603720102.5033,
      "sgd": 130516433498.363,
      "thb": 3126114795743.414,
      "try": 840605365666.5562,
      "twd": 2714221914137.568,
      "uah": 2647768358236.079,
      "vef": 9721353908.43779,
      "vnd": 2233652499107716.5,
      "zar": 1379805070875.0403,
      "xdr": 68174040397.7593,
      "xag": 3634051411.2479386,
      "xau": 53532009.56790601,
      "bits": 2839071550501.02,
      "sats": 283907155050102
    },
    "market_cap_percentage": {
      "btc": 42.85742447149895,
      "eth": 18.14747425025607,
      "usdt": 4.211209617235269,
      "bnb": 3.2525372950978113,
      "ada": 3.0759458618779907,
      "xrp": 2.0587144235607138,
      "doge": 2.0405602821768443,
      "usdc": 1.7136046102827314,
      "dot": 1.0497100676284365,
      "uni": 0.7801088590180315
    },
    "market_cap_change_percentage_24h_usd": 3.195258205126618,
    "updated_at": 1625575323
  }
}
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}

 
