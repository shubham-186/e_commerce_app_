 abstract class CartEvent{}
 class AddToCartEvent extends CartEvent{
    int pro_id;
    int qty;
    AddToCartEvent({required this.pro_id,required this.qty});
  }
 class ViewCartEvent extends CartEvent{}
 class CartDeleteEvent extends CartEvent{
    int cart_id;
    CartDeleteEvent({required this.cart_id});
  }
 class DecrementEvent extends CartEvent{
   int user_id;
  int pro_id;
  int qty;
  DecrementEvent({required this.user_id,required this.pro_id,required this.qty});
  }