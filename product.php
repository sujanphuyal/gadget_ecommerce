<?php
require('top.php');
if (isset($_GET['id'])) {
    $product_id = mysqli_real_escape_string($con, $_GET['id']);
    if ($product_id > 0) {
        $get_product = get_product($con, '', '', $product_id);
    } else {
?>
        <script>
            window.location.href = 'index.php';
        </script>
    <?php
    }
} else {
    ?>
    <script>
        window.location.href = 'index.php';
    </script>
<?php
}



if (isset($_POST['review_submit'])) {
    $rating = get_safe_value($con, $_POST['product_rating']);
    $review = get_safe_value($con, $_POST['review']);

    $added_on = date('Y-m-d h:i:s');

    $pname = mysqli_query($con, "select product_name from products where id='$product_id'");

    $updatereview = mysqli_query($con, "select * from product_review where user_id=$_SESSION[USER_ID] and product_id='$product_id'");

    while ($prow = mysqli_fetch_assoc($pname)) {
        if (mysqli_num_rows($updatereview) > 0) {
            mysqli_query($con, "update product_review set product_rating='$rating',review='$review',added_on='$added_on' where user_id=$_SESSION[USER_ID] and product_id='$product_id'");
        } else {
            mysqli_query($con, "insert into product_review(product_id,user_id,product_name,product_rating,review,status,added_on) values ('$product_id','" . $_SESSION['USER_ID'] . "','$prow[product_name]','$rating','$review','1','$added_on')");
        }
    }
?>
    <script>
        window.location.href = '<?php echo "product.php?id=$product_id" ?>';
    </script>
<?php
}


$product_review_res = mysqli_query($con, "select users.username,product_review.id,product_review.product_rating,product_review.review,product_review.added_on from users,product_review where product_review.status=1 and product_review.user_id=users.id and product_review.product_id='$product_id' order by product_review.added_on desc");

//average rating
$avg_rating_sql = "SELECT AVG(product_rating) As avg FROM product_review WHERE status=1 and product_id=$product_id";
$avg_rating_query = mysqli_query($con, $avg_rating_sql);


while ($row = mysqli_fetch_assoc($avg_rating_query)) {

    $avg_rating = $row['avg'];
}


if ($avg_rating == '') {
    $avg_rating = 0;
}


?>


<!-- Start Bradcaump area -->
<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center / cover ;">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                            <a class="breadcrumb-item" href="index.php">Home</a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <a class="breadcrumb-item" href="categories.php?id=<?php echo $get_product['0']['categories_id'] ?>"><?php echo $get_product['0']['categories'] ?></a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <span class="breadcrumb-item active"><?php echo $get_product['0']['product_name'] ?></span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- Start Product Details Area -->
<section class="htc__product__details bg__white ptb--100">
    <!-- Start Product Details Top -->
    <div class="htc__product__details__top">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                    <div class="htc__product__details__tab__content">
                        <!-- Start Product Big Images -->
                        <div class="product__big__images">
                            <div class="portfolio-full-image tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                    <img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $get_product['0']['image'] ?>" height="300" alt="full-image">
                                </div>
                            </div>
                        </div>
                        <!-- End Product Big Images -->

                    </div>
                </div>
                <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                    <div class="ht__product__dtl">
                        <h2><?php echo $get_product['0']['product_name'] ?><a href="javascript:void(0)" onclick="wishlist_manage('<?php echo $get_product['0']['id'] ?>','add')"><i class="icon-heart wishlist_icon"></i></a></h2>
                        <br />
                        <div>

                            <span class="comment-rating "><?php echo number_format((float)$avg_rating, 2, '.', ''); ?>/5<li class=" fa fa-star"></li></span>


                        </div>

                        <ul class="pro__prize">
                            <li class="old__prize"><strike>Rs&nbsp;<?php echo $get_product['0']['mrp'] ?></strike></li>
                            &nbsp;&nbsp;&nbsp;
                            <li>Rs&nbsp;<?php echo $get_product['0']['price'] ?></li>
                        </ul>
                        <p class="pro__info"><?php echo $get_product['0']['short_desc'] ?></p>
                        <div class="ht__pro__desc">
                            <div class="sin__desc">

                                <?php
                                $productSoldQtyByProductId = productSoldQtyByProductId($con, $get_product['0']['id']);

                                $pending_qty = $get_product['0']['qty'] - $productSoldQtyByProductId;

                                $cart_show = 'yes';
                                if ($get_product['0']['qty'] > $productSoldQtyByProductId) {
                                    $stock = 'In Stock';
                                } else {
                                    $stock = 'Out of Stock';
                                    $cart_show = '';
                                }
                                ?>

                                <p><span>Availability:&nbsp;</span><?php echo $stock ?></p>
                            </div>
                            <div class="sin__desc">
                                <?php
                                if ($cart_show != '') {
                                ?>
                                    <p><span>Qty:</span>
                                        <select id="qty">
                                            <?php
                                            for ($i = 1; $i <= $pending_qty; $i++) {
                                                echo "<option>$i</option>";
                                            }
                                            ?>
                                        </select>
                                    </p>
                                <?php } ?>
                            </div>
                            <div class="sin__desc align--left">
                                <p><span>Categories:</span></p>
                                <ul class="pro__cat__list">
                                    <li><a href="#"><?php echo $get_product['0']['categories'] ?></a></li>
                                </ul>
                            </div>

                        </div>

                    </div>
                    <?php
                    if ($cart_show != '') {
                    ?>
                        <a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id'] ?>','add')">Add to cart</a>

                        <a class="fr__btn_buy" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id'] ?>','add','yes')">Buy Now</a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- End Product Details Top -->
</section>
<!-- End Product Details Area 
		<!-- Start Product Description -->

<section class="htc__product__details bg__white ptb--100">

    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                <ul class="product__deatils__tab mb--60" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#description" role="tab" data-toggle="tab">Description</a>
                    </li>

                    <li role="presentation">
                        <a href="#reviews" role="tab" data-toggle="tab">Reviews</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product__details__tab__content">
                    <!-- Start Single Content -->
                    <div role="tabpanel" id="description" class="product__tab__content fade in active">
                        <div class="product__description__wrap">
                            <div class="product__desc">
                                <h2 class="title__6">Details</h2>
                                <?php echo $get_product['0']['description'] ?>
                            </div>

                        </div>
                    </div>
                    <!-- End Single Content -->

                    <!-- Start Single Content -->
                    <div role="tabpanel" id="reviews" class="product__tab__content fade">
                        <div class="pro__tab__content__inner">



                            <?php
                            if (isset($_SESSION['USER_LOGIN'])) {
                            ?>


                                <div class="row" id="post-review-box ">
                                    <div class="col-md-12">
                                        <form method="post">

                                            <!-- Star Rating Starts -->
                                            <div class="rating-wrap">
                                                <h3 class="review heading submit_review_hint">Enter your review</h3><br />
                                                <div class="stars">
                                                    <input class="star star-5" id="star-5" type="radio" name="product_rating" value="5" required />
                                                    <label class="star star-5" for="star-5"></label>
                                                    <input class="star star-4" id="star-4" type="radio" name="product_rating" value="4" />
                                                    <label class="star star-4" for="star-4"></label>
                                                    <input class="star star-3" id="star-3" type="radio" name="product_rating" value="3" />
                                                    <label class="star star-3" for="star-3"></label>
                                                    <input class="star star-2" id="star-2" type="radio" name="product_rating" value="2" />
                                                    <label class="star star-2" for="star-2"></label>
                                                    <input class="star star-1" id="star-1" type="radio" name="product_rating" value="1" />
                                                    <label class="star star-1" for="star-1"></label>
                                                    <br />
                                                    <h3 id="rating-value"></h3>
                                                    <br />
                                                    <script src="js/star-ratings.js"></script>
                                                    <br />
                                                    <textarea class="form-control" cols="50" id="new-review" name="review" placeholder="Enter your review here....." rows="5"></textarea>
                                                    <div class="text-center mt12">
                                                        <button class="btn btn-success btn-lg" type="submit" name="review_submit">Submit</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Star Rating Ends -->
                                        </form>

                                    </div>
                                </div>

                            <?php } else {
                                echo "<span class='submit_review_hint'>Please <a href='login.php'><b>login</b></a> to submit your review</span>";
                            }

                            ?>

                            <br>
                            <?php
                            if (mysqli_num_rows($product_review_res) > 0) {
                                while ($product_review_row = mysqli_fetch_assoc($product_review_res)) {

                            ?>
                                    <article class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body">

                                                    <header class="text-left">
                                                        <div>
                                                            <span class="comment-rating"><?php echo $product_review_row['product_rating']; ?>/5<li class=" fa fa-star"></li></span>
                                                            <span class="comment-name"><?php echo "( " . $product_review_row['username'] . " )"; ?></span>
                                                        </div>
                                                        <time class="comment-date">
                                                            <?php
                                                            $added_on = strtotime($product_review_row['added_on']);
                                                            echo date('d M, Y', $added_on);
                                                            ?>
                                                        </time>
                                                    </header>
                                                    <div class="comment-post">
                                                        <p>
                                                            <?php echo $product_review_row['review']; ?>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                            <?php }
                            } else {
                                echo "<h3 class='review heading submit_review_hint'>Users have not given any review to this product.</h3><br />";
                            } ?>

                        </div>


                    </div>
                </div>
                <!-- End Single Content -->
            </div>
        </div>
    </div>
    </div>


    <!-- End Product Details Top -->
</section>

<!-- Start Recommended Product Area -->
<section class="ftr__product__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line">Recommended for you</h2>
                </div>
            </div>
        </div>
        <div class="htc__product__container">
            <div class="row">
                <div class="product__list clearfix mt--30">
                    <?php
                    if (isset($_SESSION['USER_LOGIN'])) {

                        $reviewquery = mysqli_query($con, "select product_rating from product_review where user_id=$_SESSION[USER_ID]");
                        if (mysqli_num_rows($reviewquery) == 0) {
                            echo "<span class='row submit_review_hint'>You haven't reviewed any product to recommend any products.</span>";
                        } else {


                            include("user_recom.php");
                        }
                    } else {
                        echo "<span class='row submit_review_hint'>Please <a href='login.php'><b>login</b></a> to view recommended products</span>";
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Recommended Product Area -->

<?php require('footer.php') ?>