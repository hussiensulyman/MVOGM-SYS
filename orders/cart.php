<style>
    .prod-img{
        width:calc(100%);
        height:auto;
        max-height: 10em;
        object-fit:scale-down;
        object-position:center center
    }
</style>
<div class="content py-3">
    <div class="card card-outline card-primary rounded-0 shadow-0">
        <div class="card-header">
            <h5 class="card-title">Cart List</h5>
        </div>
        <div class="card-body">
            <div id="cart-list">
                <div class="row">
                <?php 
                $gtotal = 0;
                $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                while($vrow=$vendors->fetch_assoc()):                
                ?>
                    <div class="col-12 border">
                        <span>Vendor: <b><?= $vrow['code']. " - " . $vrow['shop_name'] ?></b></span>
                    </div>
                    <div class="col-12 border p-0">
                        <?php 
                        $vtotal = 0;
                        $products = $conn->query("SELECT c.*, p.name as `name`, p.price,p.image_path FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}' order by p.name asc");
                        while($prow = $products->fetch_assoc()):
                            $total = $prow['price'] * $prow['quantity'];
                            $gtotal += $total;
                            $vtotal += $total;
                        ?>
                        <div class="d-flex align-items-center border p-2">
                            <div class="col-2 text-center">
                                <a href="./?page=products/view_product&id=<?= $prow['product_id'] ?>"><img src="<?= validate_image($prow['image_path']) ?>" alt="" class="img-center prod-img border bg-gradient-gray"></a>
                            </div>
                            <div class="col-auto flex-shrink-1 flex-grow-1">
                                <h4><b><?= $prow['name'] ?></b></h4>
                                <div class="d-flex">
                                    <div class="col-auto px-0"><small class="text-muted">Price: </small></div>
                                    <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-primary"><?= format_num($prow['price']) ?></small></p></div>
                                </div>
                                <div class="d-flex">
                                    <div class="col-auto px-0"><small class="text-muted">Qty: </small></div>
                                    <div class="col-auto">
                                        <div class="" style="width:10em">
                                            <div class="input-group input-group-sm">
                                                <div class="input-group-prepend"><button class="btn btn-primary min-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-minus"></i></button></div>
                                                <input type="text" value="<?= $prow['quantity'] ?>" class="form-control text-center" readonly="readonly">
                                                <div class="input-group-append"><button class="btn btn-primary plus-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-plus"></i></button></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto flex-shrink-1 flex-grow-1">
                                        <button class="btn btn-flat btn-outline-danger btn-sm rem_item"  data-id="<?= $prow['id'] ?>"><i class="fa fa-times"></i> Remove</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 text-right"><?= format_num($total) ?></div>
                        </div>
                        <?php endwhile; ?>
                    </div>
                    <div class="col-12 border">
                        <div class="d-flex">
                            <div class="col-9 text-right font-weight-bold text-muted">Total</div>
                            <div class="col-3 text-right font-weight-bold"><?= format_num($vtotal) ?></div>
                        </div>
                    </div>
                <?php endwhile; ?>
                    <div class="col-12 border">
                        <div class="d-flex">
                            <div class="col-9 h4 font-weight-bold text-right text-muted">Grand Total</div>
                            <div class="col-3 h4 font-weight-bold text-right"><?= format_num($gtotal) ?></div>
                        </div>
                    </div>
                    <!-- Display Voucher Code Input Field -->
                    <div class="col-12 border p-2">
                        <input type="text" id="voucher_code" placeholder="Enter Voucher Code">
                        <button id="apply_voucher_btn" class="btn btn-primary btn-sm">Apply Voucher</button>
                    </div>
                    <!-- Display Total after Voucher Discount -->
                    <div class="col-12 border">
                        <div class="d-flex">
                            <div class="col-9 text-right font-weight-bold text-muted">Grand Total after Voucher</div>
                            <div class="col-3 text-right font-weight-bold" id="grand_total">Updated Grand Total</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear-fix mb-2"></div>
    <input type="hidden" id="discounted_total" name="discounted_total" value="">
    <div class="text-right">
        <a href="./?page=orders/checkout" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-money-bill-wave"></i> Checkout</a>
    </div>
</div>
<script>
    function format_num(number) {
        // Assuming you want to round the number to two decimal places and add commas
        return number.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    }

    $(document).ready(function(){
        $('.plus-qty').click(function(){
            var group = $(this).closest('.input-group')
            var qty = parseFloat(group.find('input').val()) + 1;
            group.find('input').val(qty)
            var cart_id = $(this).attr('data-id')
            var el = $('<div>')
            el.addClass('alert alert-danger')
            el.hide()
            start_loader()
            $.ajax({
                url:_base_url_+'classes/Master.php?f=update_cart_qty',
                method:'POST',
                data:{cart_id:cart_id,quantity:qty},
                dataType:'json',
                error:err=>{
                    console.error(err)
                    alert_toast('An error occurred.','error')
                    end_loader()
                },
                success:function(resp){
                    if(resp.status =='success'){
                        location.reload()
                    }else if(!!resp.msg){
                        el.text(resp.msg)
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }else{
                        el.text("An error occurred. Please try to refresh this page.")
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }
                    end_loader()
                }
            })
            
        })
        $('.min-qty').click(function(){
            var group = $(this).closest('.input-group')
            if(parseFloat(group.find('input').val()) == 1){
                return false;
            }
            var qty = parseFloat(group.find('input').val()) - 1;
            group.find('input').val(qty)
            var cart_id = $(this).attr('data-id')
            var el = $('<div>')
            el.addClass('alert alert-danger')
            el.hide()
            start_loader()
            $.ajax({
                url:_base_url_+'classes/Master.php?f=update_cart_qty',
                method:'POST',
                data:{cart_id:cart_id,quantity:qty},
                dataType:'json',
                error:err=>{
                    console.error(err)
                    alert_toast('An error occurred.','error')
                    end_loader()
                },
                success:function(resp){
                    if(resp.status =='success'){
                        location.reload()
                    }else if(!!resp.msg){
                        el.text(resp.msg)
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }else{
                        el.text("An error occurred. Please try to refresh this page.")
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }
                    end_loader()
                }
            })
            
        })
        $('.rem_item').click(function(){
        _conf("Are you sure delete this item from cart list?",'delete_cart',[$(this).attr('data-id')])
        })
        $('#checkoutBtn').click(function(){
            if ($('#cart-list .d-flex').length <= 0) {
                alert("There are no items in the cart yet. Please add items to proceed to checkout.");
                return;
            }
            if (!isUserAuthenticated()) {
                alert("You need to log in to proceed to checkout.");
                return;
            }
            if (!isValidShippingAddress()) {
                alert("Please provide a valid shipping address before proceeding to checkout.");
                return;
            }

            start_loader();
                $.ajax({
                    url: _base_url_ + 'classes/Master.php?f=create_order',
                    method: 'POST',
                    data: {
                        discounted_total: $('#discounted_total').val() // Send additional data as needed
                    },
                    dataType: 'json',
                    success: function(resp) {
                        if(resp.status == 'success'){
                            // Redirect to success page or order details page
                            location.href = './?page=checkout_success';
                        } else {
                            alert(resp.msg); // Show error message
                        }
                        end_loader();
                    },
                    error: function(){
                        alert("An error occurred during the checkout. Please try again.");
                        end_loader();
                    }
                });
            });
    })
    $('#apply_voucher_btn').click(function(){
    applyVoucher();
    });

    function applyVoucher() {
    var voucherCode = $('#voucher_code').val().trim();

    if (voucherCode === '') {
        alert('Please enter a voucher code.');
        return false;
    }

    console.log('Sending AJAX request to apply voucher.');

    $.ajax({
        url: _base_url_ + 'classes/Master.php?f=apply_voucher',
        method: 'POST',
        data: { voucher_code: voucherCode },
        dataType: 'json',
        success: function (response) {
            console.log('Response:', response);
            if (response.status === 'success') {
                // Update the text of the grand total element and value of the hidden input
                var formattedTotal = format_num(response.updated_total);
                $('#grand_total').text(formattedTotal);
                $('#discounted_total').val(response.updated_total);

                // Assign the value to priceBeforeVoucher here
                var priceBeforeVoucher = response.price_before_voucher;

                // Update the HTML element that displays it
                $('#price_before_voucher').text(priceBeforeVoucher);

                $('#voucher_code').val('');
                alert('Voucher applied successfully!');
            } else {
                alert(response.msg);
            }
        },
        error: function (xhr) {
            console.error('AJAX Error:', xhr);
            alert('An error occurred during the voucher application. Please try again.');
        }
    });
}

    
    function delete_cart($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_cart",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
    function isUserAuthenticated() {
        return true; 
    }

    function isValidShippingAddress() {
        return true;
    }
</script>