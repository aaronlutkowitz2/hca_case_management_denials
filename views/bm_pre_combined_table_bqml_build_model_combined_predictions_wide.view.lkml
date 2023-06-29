view: bm_pre_combined_table_bqml_build_model_combined_predictions_wide {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_bqml_build_model_combined_predictions_wide`
    ;;

  dimension: coid {
    type: number
    value_format_name: id
    sql: ${TABLE}.coid ;;
  }

  dimension: encounter_id_txt {
    type: string
    sql: ${TABLE}.encounter_id_txt ;;
  }

  dimension: is_denied_actual {
    type: number
    sql: ${TABLE}.is_denied_actual ;;
  }

  dimension: is_denied_predict {
    type: number
    sql: ${TABLE}.is_denied_predict ;;
  }

  dimension: is_happy_path_actual {
    type: number
    sql: ${TABLE}.is_happy_path_actual ;;
  }

  dimension: is_happy_path_predict {
    type: number
    sql: ${TABLE}.is_happy_path_predict ;;
  }

  dimension: is_paid_in_full_actual {
    type: number
    sql: ${TABLE}.is_paid_in_full_actual ;;
  }

  dimension: is_paid_in_full_predict {
    type: number
    sql: ${TABLE}.is_paid_in_full_predict ;;
  }

  dimension: is_timely_actual {
    type: number
    sql: ${TABLE}.is_timely_actual ;;
  }

  dimension: is_timely_predict {
    type: number
    sql: ${TABLE}.is_timely_predict ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}.model_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
