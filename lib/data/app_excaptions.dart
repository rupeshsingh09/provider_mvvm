class AppException implements Exception {

  final _message ;
  final _prefix ;
  AppException([this._message, this._prefix]);


  String toString(){
    return '$_prefix$_message' ;
  }
}
 // data fetch krte time koi error aaya to
class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message, 'Error during Communication');
}

 // request time pe error aaya to
class BadRequestException extends AppException{

  BadRequestException([String? message]) : super(message, 'Invalid request');
}

//  data unauthorised rhega to ye exception call hoga ur ye msg show hoga
class UnauthorisedException extends AppException{

  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}

// invalid  rhega tb ye msg show krega
class InvalidInputException extends AppException{

  InvalidInputException([String? message]) : super(message, 'Invalid request');
}

