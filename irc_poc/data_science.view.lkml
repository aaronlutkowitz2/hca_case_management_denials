#### Data Science corresponds to the data science dashboards


view: count_total {
  derived_table: {
    explore_source: irc_poc {
      column: count { field: combined_predictions.count_fk }
    }
  }
  dimension: count {
    primary_key: yes
    type: number
  }
  measure: avg_count {
    type: average
    sql: ${count};;
  }
}

view: combined_predictions {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_bqml_build_model_combined_predictions`
    ;;

  dimension: pk {
    primary_key: yes
    group_label: "ID"
    type: string
    sql: ${encounter_id_txt} || '|' || ${coid} || '|' || ${model_goal} || '|' || ${model_type} ;;
  }

  dimension: fk {
    primary_key: yes
    group_label: "ID"
    type: string
    sql: ${encounter_id_txt} || '|' || ${coid} ;;
  }

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
  }

  dimension: coid {
    type: number
    value_format_name: id
    sql: ${TABLE}.coid ;;
  }

  dimension: encounter_id_txt {
    type: string
    sql: ${TABLE}.encounter_id_txt ;;
  }

  dimension: model_goal {
    type: string
    sql: ${TABLE}.model_goal ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}.model_type ;;
  }

  dimension: predicted {
    type: number
    sql: ${TABLE}.predicted ;;
  }

  dimension: predicted_10 {
    type: number
    sql: round(${predicted},1) ;;
    value_format_name: percent_1
  }

  parameter: threshold {
    type: number
    default_value: "0.3"
  }

  dimension: is_actual {
    type: yesno
    sql: ${actual} = 1 ;;
  }

  dimension: is_predicted {
    type: yesno
    sql: ${predicted} > {% parameter threshold %} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
    drill_fields: []
  }

  measure: count_fk {
    type: count_distinct
    sql: ${fk} ;;
    drill_fields: []
  }

  measure: percent_total {
    type: number
    sql: ${count} / ${count_total.avg_count} ;;
    value_format_name: percent_0
  }

  measure: average_actual {
    type: average
    sql: ${actual} ;;
    value_format_name: percent_1
  }

  measure: average_predicted {
    type: average
    sql: ${predicted} ;;
    value_format_name: percent_1
  }
}

view: combined_predictions_wide {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_bqml_build_model_combined_predictions_wide`
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    group_label: "ID"
    type: string
    sql: ${encounter_id_txt} || '|' || ${coid} ;;
  }

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

  dimension: status_happy_path_actual {
    type: string
    sql:
      case
        when ${is_paid_in_full_actual} = 1 and ${is_timely_actual} = 1 and ${is_denied_actual} = 0 then '8 Happy Path'
        when ${is_paid_in_full_actual} = 1 and ${is_timely_actual} = 0 and ${is_denied_actual} = 0 then '7 Not Timely'
        when ${is_paid_in_full_actual} = 0 and ${is_timely_actual} = 1 and ${is_denied_actual} = 0 then '6 Not Paid in Full'
        when ${is_paid_in_full_actual} = 0 and ${is_timely_actual} = 0 and ${is_denied_actual} = 0 then '5 Not Paid in Full, Not Timely'
        when ${is_paid_in_full_actual} = 1 and ${is_timely_actual} = 1 and ${is_denied_actual} = 1 then '4 Denied'
        when ${is_paid_in_full_actual} = 1 and ${is_timely_actual} = 0 and ${is_denied_actual} = 1 then '3 Denied, Not Timely'
        when ${is_paid_in_full_actual} = 0 and ${is_timely_actual} = 1 and ${is_denied_actual} = 1 then '2 Denied, Not Paid in Full'
        when ${is_paid_in_full_actual} = 0 and ${is_timely_actual} = 0 and ${is_denied_actual} = 1 then '1 Denied, Not Paid in Full, Not Timely'
        else '0 Unknown'
      end
    ;;
  }

  dimension: status_happy_path_predicted {
    type: string
    sql:
      case
        when ${is_paid_in_full_predict} > {% parameter combined_predictions.threshold %} and ${is_timely_predict} > {% parameter combined_predictions.threshold %} and ${is_denied_predict} > {% parameter combined_predictions.threshold %} then '8 Happy Path'
        when ${is_paid_in_full_predict} > {% parameter combined_predictions.threshold %} and ${is_timely_predict} < {% parameter combined_predictions.threshold %} and ${is_denied_predict} > {% parameter combined_predictions.threshold %} then '7 Not Timely'
        when ${is_paid_in_full_predict} < {% parameter combined_predictions.threshold %} and ${is_timely_predict} > {% parameter combined_predictions.threshold %} and ${is_denied_predict} > {% parameter combined_predictions.threshold %} then '6 Not Paid in Full'
        when ${is_paid_in_full_predict} < {% parameter combined_predictions.threshold %} and ${is_timely_predict} < {% parameter combined_predictions.threshold %} and ${is_denied_predict} > {% parameter combined_predictions.threshold %} then '5 Not Paid in Full, Not Timely'
        when ${is_paid_in_full_predict} > {% parameter combined_predictions.threshold %} and ${is_timely_predict} > {% parameter combined_predictions.threshold %} and ${is_denied_predict} < {% parameter combined_predictions.threshold %} then '4 Denied'
        when ${is_paid_in_full_predict} > {% parameter combined_predictions.threshold %} and ${is_timely_predict} < {% parameter combined_predictions.threshold %} and ${is_denied_predict} < {% parameter combined_predictions.threshold %} then '3 Denied, Not Timely'
        when ${is_paid_in_full_predict} < {% parameter combined_predictions.threshold %} and ${is_timely_predict} > {% parameter combined_predictions.threshold %} and ${is_denied_predict} < {% parameter combined_predictions.threshold %} then '2 Denied, Not Paid in Full'
        when ${is_paid_in_full_predict} < {% parameter combined_predictions.threshold %} and ${is_timely_predict} < {% parameter combined_predictions.threshold %} and ${is_denied_predict} < {% parameter combined_predictions.threshold %} then '1 Denied, Not Paid in Full, Not Timely'
        else '0 Unknown'
      end
    ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
