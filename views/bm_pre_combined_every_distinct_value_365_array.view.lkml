view: bm_pre_combined_every_distinct_value_365_array {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_every_distinct_value_365_array`
    ;;

  dimension: coid {
    type: number
    value_format_name: id
    sql: ${TABLE}.coid ;;
  }

  dimension: days_since_arrival {
    type: number
    sql: ${TABLE}.days_since_arrival ;;
  }

  dimension: encounter_id_txt {
    type: string
    sql: ${TABLE}.encounter_id_txt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
