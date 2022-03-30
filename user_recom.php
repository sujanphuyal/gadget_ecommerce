<?php

$con = mysqli_connect("localhost", "root", "", "ecommerce");

include("recommend.php");

$products = mysqli_query($con, "select * from product_review");

$matrix = array();

while ($product = mysqli_fetch_array($products)) {
    $users = mysqli_query($con, "select username from users where id=$product[user_id]");
    $username = mysqli_fetch_array($users);

    $matrix[$username['username']][$product['product_name']] = $product['product_rating'];
}

// echo "<pre>";
// print_r($matrix);
// echo "</pre>"; 

$users = mysqli_query($con, "select username from users where id=$_SESSION[USER_ID]");
$username = mysqli_fetch_array($users);

?>

<?php
$recom = array();
$recom = gerecom($matrix, $username['username']);

$count=1;

//print_r($recom);

foreach ($recom as $product => $rating) {
    if($count>4){
        break;
    }
?>

    <!--------------------------- Recommendataion Starts Here ------------------------------------------>


    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
    <div class="category">
    
            <?php 
            
            $sim_dis = ($rating /5);

            $imagequery = mysqli_query($con, "select products.id,products.image from products,product_review where products.id=product_review.product_id and products.product_name='$product'");

            $list = mysqli_fetch_array($imagequery);

            // echo $sim_dis;

                ?>
                
                <div class="ht__cat__thumb">
                    <a href="product.php?id=<?php echo $list['id'] ?>">
                        <img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $list['image'] ?>" height="300" alt="product images">
                    </a>
                </div>


                <div class="fr__product__inner">

                    <h4><a href="product.php?id=<?php echo $list['id'] ?>"><?php echo $product; ?></a></h4><br>
                    <span class="comment-rating"><?php echo number_format((float)$rating, 2, '.', '') ?>/5<li class=" fa fa-star"></li></span>

                </div>
            

        </div>
    </div>

    <!--------------------------- recom Ends Here------------------------------------------- -->

<?php 
$count++;
 } ?>