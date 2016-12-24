/* global $, Stripe */
// Document ready
$(document).on('turbolinks:load', function(){
  // Get pro account membership form
  var proForm = $('#pro_form');
  
  // Get submit button
  var submitBtn = $('#form-signup-btn');
  
  // Set Stripe public key
  Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
  
  // When user clicks form submit btn
  submitBtn.click(function(event) {
    // Prevent default submission behavior
    event.preventDefault();
    
    // Disable submit button and inform user of work being done
    submitBtn.val("Processing").prop('disabled', true);
    
    // Collect credit card fields
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
    
    // Use Stripe JS library to check for card errors
    var error = false;
    
    // Validate card number
    if(!Stripe.card.validateCardNumber(ccNum)) {
      error = true;
      alert('The credit card number apears to be invalid');
    }
    
    // Validate cvc number
    if(!Stripe.card.validateCVC(cvcNum)) {
      error = true;
      alert('The CVC number apears to be invalid');
    }
    
    // Validate expiration
    if(!Stripe.card.validateExpiry(expMonth, expYear)) {
      error = true;
      alert('The expiration apears to be invalid');
    }
    
    if (error) {
      // Reenable the Sign Up button
      submitBtn.prop('disabled', false).val("Sign Up");
    } else {
      // Send the card info to Stripe
      Stripe.createToken(
        {
          number: ccNum,
          cvc: cvcNum,
          exp_month: expMonth,
          exp_year: expYear
        },
        stripeResponseHandler
      );
    }
    
    return false;
  });
  
  // Stripe will return card token
  function stripeResponseHandler(status, response) {
    // Get token from response
    var token = response.id;
    
    // Inject card token as hidden field into form
    proForm.append( $('<input type="hidden" name="user[stripe_card_token]" />').val(token) )
    
    // Submit form to Rails
    proForm.get(0).submit();
  }
})