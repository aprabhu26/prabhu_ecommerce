view: inventory_items {
  sql_table_name: `orders.inventory_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: sold_at {
    type: string
    sql: ${TABLE}.sold_at ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: avg_cost {
    type: average
    sql: ${cost} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }

  }

  measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "usd"

  }
}
