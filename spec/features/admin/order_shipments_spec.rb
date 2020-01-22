# frozen_string_literal: true

require 'spec_helper'

describe 'Order shipments page', type: :feature do
  stub_authorization!

  let!(:order) { create :order_ready_to_ship }
  let!(:product) { create(:product) }

  before do
    product.master.stock_items << build(:stock_item, stock_location: Spree::StockLocation.last)
    visit spree.edit_admin_order_path(order)
  end

  it 'can add an item from the shipments order page', :js do
    within('table.shipment') do
      expect(page).not_to have_content product.name
    end

    find('.variant_autocomplete').click
    fill_in 's2id_autogen1_search', with: product.name
    find('.variant-autocomplete-item').click
    find('.add_variant').click

    within('table.shipment') do
      expect(page).to have_content product.name
    end
  end
end
