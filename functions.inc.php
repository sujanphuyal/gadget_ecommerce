<?php
function pr($arr){
	echo '<pre>';
	print_r($arr);
}

function prx($arr){
	echo '<pre>';
	print_r($arr);
	die();
}

function get_safe_value($con,$str){
	if($str!=''){
		$str=trim($str);
		return mysqli_real_escape_string($con,$str);
	}
}

function get_product($con,$limit='',$cat_id='',$product_id='',$search_str='',$sort_order='',$is_best_seller=''){
	$sql="select products.*,categories.categories from products,categories where products.status=1 ";
	if($cat_id!=''){
		$sql.=" and products.categories_id=$cat_id ";
	}
	if($product_id!=''){
		$sql.=" and products.id=$product_id ";
	}
	if($is_best_seller!=''){
		$sql.=" and products.best_seller=1 ";
	}
	$sql.=" and products.categories_id=categories.id ";
	if($search_str!=''){
		$sql.=" and (products.product_name like '%$search_str%' or products.description like '%$search_str%') ";
	}
	if($sort_order!=''){
		$sql.=$sort_order;
	}else{
		$sql.=" order by products.id desc ";
	}
	if($limit!=''){
		$sql.=" limit $limit";
	}
	//echo $sql;
	$res=mysqli_query($con,$sql);
	$data=array();
	while($row=mysqli_fetch_assoc($res)){
		$data[]=$row;
	}
	return $data;
}


function wishlist_add($con,$uid,$pid){
	$added_on=date('Y-m-d h:i:s');
	mysqli_query($con,"insert into wishlist(user_id,product_id,added_on) values('$uid','$pid','$added_on')");
}

function productSoldQtyByProductId($con,$pid){
	$sql="select sum(order_detail.qty) as pqty from order_detail,`order` where `order`.id=order_detail.order_id and order_detail.product_id=$pid and `order`.order_status!=4 and ((`order`.payment_type='payu' and `order`.payment_status='Success') or (`order`.payment_type='COD' and `order`.payment_status!=''))";
	$res=mysqli_query($con,$sql);
	$row=mysqli_fetch_assoc($res);
	return $row['pqty'];
}

function productQty($con,$pid){
	$sql="select qty from products where id='$pid'";
	$res=mysqli_query($con,$sql);
	$row=mysqli_fetch_assoc($res);
	return $row['qty'];
}
?>