<?php 
require('top.php');					
?>
<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">Contact Us</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Contact Area -->
        <section class="htc__contact__area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12">
                        <div>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15079.709903906896!2d85.3311212054087!3d27.694492845383607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2snp!4v1643197334937!5m2!1sen!2snp" width="600" height="500" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                           
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
                        <h2 class="title__line--6">CONTACT US</h2>
                        <div class="address">
                            <div class="address__icon">
                                <i class="icon-location-pin icons"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">our address</h2>
                                <p>New Baneshwor, Kathmandu, Nepal </p>
                            </div>
                        </div>
                        <div class="address">
                            <div class="address__icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">opening hour</h2>
                                <p>07:00 - 19:00 NPT</p>
                            </div>
                        </div>

                        <div class="address">
                            <div class="address__icon">
                                <i class="icon-phone icons"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">Phone Number</h2>
                                <p>+977-9876543210</p>
                            </div>
                        </div>
                    </div>      
                </div>
                <div class="row">
                    <div class="contact-form-wrap mt--60">
                        <div class="col-xs-12">
                            <div class="contact-title">
                                <h2 class="title__line--6">Send  A Message</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <form id="contact-form" action="#" method="post">
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                        <input type="text" id="name" name="name" placeholder="Your Name*">
                                        <input type="email" id="email" name="email" placeholder="Email*">
										<input type="text" id="mobile" name="mobile" placeholder="Mobile*">
                                    </div>
                                </div>
                                
                                <div class="single-contact-form">
                                    <div class="contact-box message">
                                        <textarea name="message" id="message" placeholder="Your Message"></textarea>
                                    </div>
                                </div>
                                <div class="contact-btn">
                                    <button type="button" onclick="send_message()" class="fv-btn">Send MESSAGE</button>
                                </div>
                            </form>
                            <div class="form-output">
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </section>
        <!-- End Contact Area -->
		<!-- Google Map js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBmGmeot5jcjdaJTvfCmQPfzeoG_pABeWo "></script>
    <script src="js/contact-map.js"></script>
    <script>
        // When the window has finished loading create our google map below
        // google.maps.event.addDomListener(window, 'load', init);

        // function init() {
        //     // Basic options for a simple Google Map
        //     // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        //     var mapOptions = {
        //         // How zoomed in you want the map to start at (always required)
        //         zoom: 12,

        //         scrollwheel: false,

        //         // The latitude and longitude to center the map (always required)
        //         center: new google.maps.LatLng(23.7286, 90.3854), // New York

        //         // How you would like to style the map. 
        //         // This is where you would paste any style found on Snazzy Maps.
        //          styles: 
        // [ {
        //         "featureType": "all",
        //         "elementType": "labels.text.fill",
        //         "stylers": [
        //             {
        //                 "saturation": 36
        //             },
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 40
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "all",
        //         "elementType": "labels.text.stroke",
        //         "stylers": [
        //             {
        //                 "visibility": "on"
        //             },
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 16
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "all",
        //         "elementType": "labels.icon",
        //         "stylers": [
        //             {
        //                 "visibility": "off"
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "administrative",
        //         "elementType": "geometry.fill",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 20
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "administrative",
        //         "elementType": "geometry.stroke",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 17
        //             },
        //             {
        //                 "weight": 1.2
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "landscape",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 20
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "poi",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 21
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "road.highway",
        //         "elementType": "geometry.fill",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 17
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "road.highway",
        //         "elementType": "geometry.stroke",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 29
        //             },
        //             {
        //                 "weight": 0.2
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "road.arterial",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 18
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "road.local",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 16
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "transit",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#000000"
        //             },
        //             {
        //                 "lightness": 19
        //             }
        //         ]
        //     },
        //     {
        //         "featureType": "water",
        //         "elementType": "geometry",
        //         "stylers": [
        //             {
        //                 "color": "#141516"
        //             },
        //             {
        //                 "lightness": 17
        //             }
        //         ]
        //     }
        // ]
        //     };

        //     // Get the HTML DOM element that will contain your map 
        //     // We are using a div with id="map" seen below in the <body>
        //     var mapElement = document.getElementById('googleMap');

        //     // Create the Google Map using our element and options defined above
        //     var map = new google.maps.Map(mapElement, mapOptions);

        //     // Let's also add a marker while we're at it
        //     var marker = new google.maps.Marker({
        //         position: new google.maps.LatLng(23.7286, 90.3854),
        //         map: map,
        //         title: 'Ramble!',
        //         icon: 'images/icons/map-2.png',
        //         animation:google.maps.Animation.BOUNCE

        //     });
        // }
    </script>
<?php require('footer.php')?>        