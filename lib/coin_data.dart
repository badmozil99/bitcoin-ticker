import 'package:http/http.dart' as http;
import 'dart:convert';


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '44E6A25E-717D-4571-80FC-F47F6D716E40';
const url = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData (String selectedCurrency)async{
    String requestURL = '$url/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse( requestURL));
    if(response.statusCode == 200){
      String data = response.body;
       double lastPrice = jsonDecode(data)['rate'];
      return lastPrice;
    }else {
      print(response.statusCode);
    }
  }

  Future getCoinDataETH (String selectedCurrency)async {
    String requestURL = '$url/ETH/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if(response.statusCode == 200){
      String dataETH = response.body;
      double lastPriceETH = jsonDecode(dataETH)['rate'];
      return lastPriceETH;
    }else {
      print(response.statusCode);
    }
  }

  Future getCoinDataLTC (selectedCurrency)async{
    String requestURL = '$url/LTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if(response.statusCode == 200){
      String dataLTC = response.body;
      double lastPriceLTC = jsonDecode(dataLTC)['rate'];
      return lastPriceLTC;
    }else{ print(response.statusCode);}
  }
}

// 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=';