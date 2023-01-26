view: order_items {
  sql_table_name: `orders.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
    #hidden: yes
  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price};;
    html: {% if value>1000 %}
    {% endif %};;
    #value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
