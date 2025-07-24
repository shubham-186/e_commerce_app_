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
  NetworkException({required String errorMsg}) : super(title: "Network error",message:errorMsg );
}
class ServerException extends MyException{
  ServerException({required String errorMsg}): super (title: "Server problem",message: errorMsg);
}
class InvalidRequestException extends MyException{
  InvalidRequestException({required String errorMsg}):super(title: "Invalid Request",message: errorMsg);
}
class UnAuthorizedException extends MyException{
UnAuthorizedException({required String errorMsg}):super(title:"",message: errorMsg);
}