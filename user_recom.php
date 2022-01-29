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

// getRecommendation($matrix,"user_name");

$users = mysqli_query($con, "select username from users where id=$_SESSION[USER_ID]");
$username = mysqli_fetch_array($users);

?>

<?php
$recommendation = array();
$recommendation = getRecommendation($matrix, $username['username']);

$count=1;

foreach ($recommendation as $product => $rating) {
    if($count>4){
        break;
    }
?>

    <!--------------------------- Recommendataion Starts Here ------------------------------------------>


    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
    <div class="category">
    
            <?php 
            
            $imagequery = mysqli_query($con, "select products.id,products.image from products,product_review where products.id=product_review.product_id and products.product_name='$product'");

            $list = mysqli_fetch_array($imagequery);
            
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

    <!--------------------------- Recommendation Ends Here------------------------------------------- -->



<?php 
$count++;
 } ?>