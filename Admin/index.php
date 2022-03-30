<?php
require('top.inc.php');

$user_query=mysqli_query($con,"select COUNT(id) AS ucount from users");

$product_query=mysqli_query($con,"select COUNT(id) AS pcount from products");

$order_query=mysqli_query($con,"select COUNT(id) AS ocount from `order`");

$reveneu_query=mysqli_query($con,"select SUM(total_price) AS rsum from `order` where order_status=5");

$product_sold_query=mysqli_query($con,"select sum(order_detail.qty) AS pqty from order_detail,`order` where order_detail.order_id=`order`.id and `order`.order_status=5");

$pending_order_query=mysqli_query($con,"select count(id) AS pencount from `order` where order_status!=5");

$comment_query=mysqli_query($con,"select count(id) AS ccount from contact_us");

?>

<main class="py-md-3 px-md-4 sw-content" role="main">
    <h2>Dashboard</h2>
    <br>
    <div class="row">
    <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Total Reveneu</h3>
                    <?php while($row=mysqli_fetch_assoc($reveneu_query)){ ?>
                    <h1 class="card-text"><b>Rs. <?php echo $row['rsum'] ?></b></h1>
                    <?php } ?>
                    
                </div>
            </div>
        </div>
                    </div>
    <div class="row">
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Total Users</h3>
                    <?php while($row=mysqli_fetch_assoc($user_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['ucount'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <a href="users.php" class="btn btn-link">More info....</a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Total Products</h3>
                    <?php while($row=mysqli_fetch_assoc($product_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['pcount'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <a href="product.php" class="btn btn-link">More info....</a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Total Orders</h3>
                    <?php while($row=mysqli_fetch_assoc($order_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['ocount'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <a href="order_master.php" class="btn btn-link">More info....</a>
                </div>
            </div>
        </div>
        
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Products Sold</h3>
                    <?php while($row=mysqli_fetch_assoc($product_sold_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['pqty'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <br>
                    <!-- <a href="#" class="btn btn-link"></a> -->
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Pending Orders</h3>
                    <?php while($row=mysqli_fetch_assoc($pending_order_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['pencount'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <a href="order_master.php" class="btn btn-link">More info....</a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="cardd-body">
                    <h3 class="card-title">Total Comments</h3>
                    <?php while($row=mysqli_fetch_assoc($comment_query)){ ?>
                    <h1 class="card-text"><b><?php echo $row['ccount'] ?></b></h1>
                    <?php } ?>
                    <br>
                    <a href="contact_us.php" class="btn btn-link">More info....</a>
                </div>
            </div>
        </div>

    </div>
</main>

<?php 
require('footer.inc.php')
?>