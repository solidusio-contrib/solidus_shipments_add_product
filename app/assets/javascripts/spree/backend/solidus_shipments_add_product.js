// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'


//= require spree/backend/shipments
//= require spree/backend/templates/variants/autocomplete_stock

var ShipmentAddVariantView = Backbone.View.extend({
  events: {
    "change #add_variant_id": "onSelect",
    "click .add_variant": "onAdd",
    "submit form": "onAdd"
  },
  onSelect: function(e) {
    var variant_id = this.$("#add_variant_id").val();
    var template = HandlebarsTemplates["variants/autocomplete_stock"];
    var $stock_details = this.$('#stock_details');
    Spree.ajax({
      url: Spree.routes.variants_api + "/" + variant_id,
      success: function(variant){
        $stock_details.html(template({variant: variant})).show()
      }
    });
  },
  onAdd: function(e){
    e.preventDefault();

     this.$('#stock_details').hide();

     var variant_id = this.$('input.variant_autocomplete').val();
    var stock_location_id = $(e.target).data('stock-location-id');
    var quantity = this.$("input.quantity[data-stock-location-id='" + stock_location_id + "']").val();

     addVariantFromStockLocation(stock_location_id, variant_id, quantity)
  }
});

 Spree.ready(function(){
  $(".js-shipment-add-variant").each(function(){
    new ShipmentAddVariantView({el: this});
  });
});


addVariantFromStockLocation = function(stock_location_id, variant_id, quantity) {
  var shipment = _.find(shipments, function(shipment){
    return shipment.stock_location_id == stock_location_id && (shipment.state == 'ready' || shipment.state == 'pending');
  });

   if(shipment==undefined){
    Spree.ajax({
      type: "POST",
      url: Spree.routes.shipments_api,
      data: {
        shipment: {
          order_id: window.order_number
        },
        variant_id: variant_id,
        quantity: quantity,
        stock_location_id: stock_location_id,
      }
    }).done(function(){
      window.location.reload();
    });
  }else{
    //add to existing shipment
    adjustShipmentItems(shipment.number, variant_id, quantity);
  }
};