# frozen_string_literal: true

require 'spec_helper'

describe 'Order shipments page', type: :feature do
  stub_authorization!

  let!(:order) { create :order_ready_to_ship }
  let!(:product) { create(:product_in_stock) }

  before do
    visit spree.edit_admin_order_path(order)
  end

  it 'has no items prior to addition of items', :js do
    within('table.shipment') do
      expect(page).not_to have_content product.name
    end
  end

  it 'can add an item from the shipments order page', :js do
    find('.variant_autocomplete').click
    fill_in 's2id_autogen1_search', with: product.name
    find('.variant-autocomplete-item').click
    find('.add_variant').click

    within('table.shipment') do
      expect(page).to have_content product.name
    end
  end
end
