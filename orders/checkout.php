<div class="content py-3">
    <div class="card card-outline card-primary shadow rounded-0">
        <div class="card-header">
            <div class="h5 card-title">Checkout</div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <form action="" id="checkout-form">
                        <div class="form-group">
                            <label for="delivery_address" class="control-label">Delivery Address</label>
                            <textarea name="delivery_address" id="delivery_address" rows="4" class="form-control rounded-0" required><?= $_settings->userdata('address') ?></textarea>
                        </div>
                        <div class="form-group text-right">
                            <button class="btn btn-flat btn-default btn-sm bg-navy">Place Order</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <div class="row" id="summary">
                    <div class="col-12 border">
                        <h2 class="text-center"><b>Summary</b></h2>
                    </div>
                    <?php 
                    $gtotal = 0;
                    $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                    while($vrow=$vendors->fetch_assoc()):    
                        $vtotal = $conn->query("SELECT sum(c.quantity * p.price) FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}'")->fetch_array()[0];
                        $vtotal = $vtotal > 0 ? $vtotal : 0;
                        $gtotal += $vtotal;
                    ?>
                    <div class="col-12 border item">
                        <b class="text-muted"><small><?= $vrow['code']." - ".$vrow['shop_name'] ?></small></b> <br>
                        <b class="text-muted">Grand Total: </b>
                        <div class="text-right h4"><b><?= format_num($vtotal) ?></b></div>
                    </div>
                    <?php endwhile; ?>
                    <div class="col-12 border">
                        <b class="text-muted">Grand Total After Discount:</b>
                        <div class="text-right h4" id="total"><b><?= isset($_SESSION['price_after_voucher']) ? format_num($_SESSION['price_after_voucher']) : format_num($gtotal) ?></b></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    // Handle form submission
    $('#checkout-form').submit(function(e) {
        e.preventDefault();
        var form = $(this);

        // Check if the form is valid
        if (!form[0].checkValidity()) {
            form[0].reportValidity();
            return false;
        }

        // Check if there are items in the cart
        if ($('#summary .item').length <= 0) {
            alert_toast("There are no items in the cart yet.", 'error');
            return false;
        }

        // Remove any existing error messages
        $('.pop_msg').remove();

        // Create an error message element
        var errorElement = $('<div>').addClass("alert alert-danger pop_msg").hide();

        // Start loading indicator
        start_loader();

        // Send an AJAX request to place the order
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=place_order',
            method: 'POST',
            data: form.serialize(),
            dataType: 'json',
            error: function(err) {
                console.error(err);
                alert_toast("An error occurred.", 'error');
                end_loader();
            },
            success: function(resp) {
                console.log('Response:', resp);

                if (resp.status === 'success') {
                    // Redirect to the products page after successful order placement
                    location.replace('./?page=products');
                } else if (!!resp.msg) {
                    // Show an error message if provided in the response
                    errorElement.text(resp.msg);
                    form.prepend(errorElement);
                    errorElement.show('slow');
                    $('html,body').scrollTop(0);
                } else {
                    // Show a generic error message if no specific message is provided
                    errorElement.text("An error occurred.");
                    form.prepend(errorElement);
                    errorElement.show('slow');
                    $('html,body').scrollTop(0);
                }

                // End loading indicator
                end_loader();
            }
        });
    });
</script>
