$(document).ready(function(){
    
    $("#addtocart").on('click', function(e) {

		var prod_id = $("#p_id").val();
		var quantity = $("#p_qty :selected").text();
        var size = 	$("#p_size :selected").text();
        
        console.log("id " + prod_id);
        console.log("qty: " + quantity);
        console.log("size " + size);

		//document.getElementById("cart-notif-text").innerHTML = name + ' has been added to your cart.';
		//$('.addedtocart').trigger('click');

		$.ajax({
            url: '/carts',
            type: "POST",  
            data: JSON.stringify({product: prod_id, quantity: quantity, size: size}),
            dataType: "json",     
            contentType: 'application/json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            error: function(result) {
                location = "/signin"
            },
            success: function(result) {
                location = "/carts"
            }
		});
	
    });

    $('.ctitems .crthdr .clsbtn').on('click', function(e){
        
        var dataSrc = $(e.currentTarget);
        var cartIndex = dataSrc.data('index');

		$.ajax({
            url: '/carts/' + cartIndex,
            type: "DELETE",  
            //data: JSON.stringify({product: prod_id, quantity: quantity, size: size}),
            dataType: "json",     
            contentType: 'application/json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            error: function(result) {
            },
            success: function(result) {
                location.reload();
            }
        });
        





    });









});