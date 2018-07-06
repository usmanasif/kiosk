bind_scoops_on_product_select = ->
  $('body').on 'change', '.product-select', ->
    parent_container = $(this).parents('.order-item-fields')
    radio_button = parent_container.find('.scoop-radio:radio[value=3]')
    checkboxes_list = parent_container.find('.topping-checkbox')
    checkboxes_list.prop('checked', false).prop('disabled', false)
    checkboxes_list.prop('disabled', false)

    if $('option:selected', this).html() == 'Cone'
      radio_button.prop('disabled', true)
    else
      radio_button.prop('disabled', false)

bind_toppings = ->
  $('body').on 'change', '.topping-checkbox', ->
    parent_container = $(this).parents('.checkboxes-container')
    product_value = $(this).parents('.order-item-fields').find('.product-select').val()

    if product_value == 'Cone'
      if parent_container.find('.topping-checkbox:checked').length == 1
        parent_container.find('.topping-checkbox:not(checked)').prop('disabled', true)
      else
        parent_container.find('.topping-checkbox:not(checked)').prop('disabled', false)
    else
      if parent_container.find('.topping-checkbox:checked').length == 2
        parent_container.find('.topping-checkbox:not(checked)').prop('disabled', true)
      else
        parent_container.find('.topping-checkbox:not(checked)').prop('disabled', false)

    parent_container.find('.topping-checkbox:checked').prop('disabled', false)

$ ->
  bind_scoops_on_product_select()
  bind_toppings()
