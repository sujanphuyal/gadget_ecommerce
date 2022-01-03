<html>
    <head>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
</html>


<?php

$con=mysqli_connect("localhost","root","","ecommerce");

include("recommend.php");

$products= mysqli_query($con,"select * from product_review");

$matrix=array();

while($product=mysqli_fetch_array($products))
{
    $users=mysqli_query($con,"select username from users where id=$product[user_id]");
    $username=mysqli_fetch_array($users);
    
    $matrix[$username['username']][$product['product_name']]=$product['product_rating'];

}

// echo "<pre>";
// print_r($matrix);
// echo "</pre>";

// getRecommendation($matrix,"user_name");

$users=mysqli_query($con,"select username from users where id=$_SESSION[USER_ID]");
    $username=mysqli_fetch_array($users);

?>

    <?php 
    $recommendation=array();
    $recommendation=getRecommendation($matrix,$username['username']);

    foreach($recommendation as $product=>$rating)
    {
    ?>

<!--------------------------- Recommendataion Starts Here ------------------------------------------>
<div class="row">
                <div class="product__wrap clearfix">
                    <!-- Start Single Category -->
                    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                        <div class="category">
                            <div class="ht__cat__thumb">
                                <a href="product-details.html">
                                    <img src="images/product/9.jpg" alt="product images">
                                </a>
                            </div>

                            <div class="fr__product__inner">
                                <h4><a href="product-details.html"><?php echo $product; ?></a></h4>
                                <span class="comment-rating"><?php echo $rating ?>/5<li class=" fa fa-star"></li></span>

                            </div>
                        </div>
                    </div>
                    <!-- End Single Category -->
                </div>
            </div>
<!--------------------------- Recommendation Ends Here------------------------------------------- -->

            <?php } ?>


