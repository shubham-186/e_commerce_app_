/*
class MyException implements Exception{

  String title;
  String message;
  MyException({required this.title,required this.message});
  @override
  String toString() {
    return "Exception: $title, message: $message";
  }
}
class NetworkException extends MyException{
  NetworkException({required String errorMsg}) :
        super(title: "No Internet",message:errorMsg );
}
class ServerException extends MyException{
  ServerException({required String errorMsg}): super (title: "Server problem",message: errorMsg);
}
class InvalidRequestException extends MyException{
  InvalidRequestException({required String errorMsg}):super(title: "Invalid Request",message: errorMsg);
}
class UnAuthorizedException extends MyException{
UnAuthorizedException({required String errorMsg}):super(title:"",message: errorMsg);
}*/

class MyException implements Exception{
  String title;
  String message;

  MyException({required this.title, required this.message});

  @override
  String toString() {
    return "Exception: $title, Message: $message";
  }

}

class NetworkException extends MyException {
  NetworkException({required String message}) : super(title: "No Internet", message: message);
}

class ServerException extends MyException {
  ServerException({required super.message})
      : super(title: "Server Error");
}

class InvalidInputException extends MyException {
  InvalidInputException({required String message})
      : super(title: "Invalid Input", message: message);
}

class UnauthorizedException extends MyException {
  UnauthorizedException({required String message})
      : super(title: "Unauthorized", message: message);
}
