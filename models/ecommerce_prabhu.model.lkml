connection: "looker-dcl-data"

# include all the views
include: "/views/**/*.view"

datagroup: ecommerce_prabhu_default_datagroup {
  #sql_trigger: MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ecommerce_prabhu_default_datagroup

explore: users {}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: product_sheets {
  join: products {
    type: left_outer
    sql_on: ${product_sheets.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one

  }
}


explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: employee_master {}

explore: sql_derived_table {
  join: users {
    type: left_outer
    sql_on: ${users.city} = ${sql_derived_table.users_city};;
    relationship: many_to_one
  }
}

explore: native_derived_table {
  join: users {
    type: left_outer
    sql_on: ${users.city} = ${native_derived_table.city};;
    relationship: many_to_one
  }
}

explore: ndt {
  join: users {
    type: left_outer
    sql_on: ${users.city} = ${ndt.city};;
    relationship: many_to_one
  }
}


explore: products {
}

explore: inventory_items_vijaya {
  join: products {
    type: left_outer
    sql_on: ${inventory_items_vijaya.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}
