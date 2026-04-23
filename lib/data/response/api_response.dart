import 'package:provider_mvvm/data/response/status.dart';

class ApiResponse<T> {

// status provide kr diye
   Status? status ;
   // dynamic fun. bna diye jo ki data lega
   T? data ;
   // mesage pass krenge string form m
   String? message ;

   ApiResponse(this.status, this.data, this.message);


   // status load krva rhe h
   ApiResponse.loading() : status = Status.LOADING ;

   // status complete krne k liye
   ApiResponse.completed() : status = Status.COMPLETED ;

   // status error show krne k liye
   ApiResponse.error() : status = Status.ERROR ;

   String toString(){
     return "Status : $status \n Message : $message \n Data: $data: $data" ;
   }
}