# frozen_string_literal: true

template = <<~ERB
  <% if can?(:update, Spree::Shipment) && can?(:update, @order) && @order.shipment_state != "shipped" %>
    <div id="add-line-item" class="js-shipment-add-variant" data-hook>
      <fieldset class="no-border-bottom">
        <legend align="center"><%= t('spree.add_product') %></legend>

         <div data-hook="add_product_name" class="field">
          <%= label_tag :add_variant_id, t('spree.name_or_sku') %>
          <%= text_field_tag :add_variant_id, "", class: "variant_autocomplete fullwidth" %>
        </div>
      </fieldset>

       <div id="stock_details"></div>
    </div>
  <% end %>
ERB

Deface::Override.new(
  virtual_path: "spree/admin/orders/edit",
  name: "add_product_button_to_admin_shipments_tab",
  insert_after: "[data-hook='admin_order_edit_sub_header']",
  text: template
)
