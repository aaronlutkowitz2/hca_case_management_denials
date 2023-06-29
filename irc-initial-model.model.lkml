connection: "hca-ati-irc-dev-conn"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/irc_poc/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
include: "*.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: irc_poc_data_group {
  max_cache_age: "24 hours"
}

named_value_format: custom_named_value_format {
  value_format: "[>=1000000]0.00,,\" M\";[>=1000]0.00,\" K\";0"
}
explore: bm_pre_write_offs {
  label: "Write Off Data"
}
# explore: iplanderivedtable {}
#explore: happy_path_status_helper {}
explore: irc_poc {
  persist_with: irc_poc_data_group
  view_label: "IRC POC"

  join: happy_path_status_helper {
    sql_on: ${irc_poc.pk} = ${happy_path_status_helper.pk} ;;
    relationship: one_to_one
  }
  join: iplanderivedtable {
    sql_on: ${irc_poc.coid} = ${iplanderivedtable.coid} and ${irc_poc.encounter_id_txt}=${iplanderivedtable.encounter_id_txt};;
    relationship: one_to_one
  }

  # join: irc_poc__npi {
  #   view_label: "IRC POC"
  #   sql: LEFT JOIN UNNEST(${irc_poc.npi}) as irc_poc__npi ;;
  #   relationship: one_to_many
  # }

  join: irc_poc__proc_code {
    view_label: "IRC POC"
    sql: LEFT JOIN UNNEST(${irc_poc.proc_code}) as irc_poc__proc_code ;;
    relationship: one_to_many
  }

  join: irc_poc__diag_code {
    view_label: "IRC POC"
    sql: LEFT JOIN UNNEST(${irc_poc.diag_code}) as irc_poc__diag_code ;;
    relationship: one_to_many
  }

  join: irc_poc__status_by_day {
    view_label: "IRC POC"
    sql: LEFT JOIN UNNEST(${irc_poc.status_by_day}) as irc_poc__status_by_day ;;
    relationship: one_to_many
    # sql_on:
    #       ${irc_poc.coid} = ${irc_poc__status_by_day.coid}
    #   AND ${irc_poc.encounter_id_txt} = ${irc_poc__status_by_day.encounter_id_txt}
    # ;;
  }

  join: irc_poc__appeal_detail {
    view_label: "IRC POC"
    sql: LEFT JOIN UNNEST(${irc_poc.appeal_detail}) as irc_poc__appeal_detail ;;
    relationship: one_to_many
  }

  join: benchmark_table_irc {
    relationship: many_to_one
    sql_on: ${irc_poc.bm_combined} = ${benchmark_table_irc.bm_combined} ;;
  }

  join: benchmark_table_irc_over_under {
    relationship: many_to_one
    sql_on: ${irc_poc.dim_dynamic} = ${benchmark_table_irc_over_under.dim_dynamic} ;;
  }

  join: combined_predictions {
    view_label: "Z-Data Science (Long)"
    relationship: one_to_many
    sql_on:
          ${irc_poc.coid} = ${combined_predictions.coid}
      AND ${irc_poc.encounter_id_txt} = ${combined_predictions.encounter_id_txt}
    ;;
  }

  join: combined_predictions_wide {
    view_label: "Z-Data Science (Wide)"
    relationship: one_to_one
    sql_on:
          ${irc_poc.coid} = ${combined_predictions_wide.coid}
      AND ${irc_poc.encounter_id_txt} = ${combined_predictions_wide.encounter_id_txt}
    ;;
  }

  join: count_total {
    view_label: "Z-Data Science (Total)"
    relationship: one_to_one
    sql_on: 1 = 1  ;;
  }

  # join: status_by_day_happy_path {
  #   view_label: "IRC POC"
  #   relationship: one_to_many
  #   sql_on:
  #         ${irc_poc.coid} = ${status_by_day_happy_path.coid}
  #     AND ${irc_poc.encounter_id_txt} = ${status_by_day_happy_path.encounter_id_txt}
  #   ;;
  # }
}














explore: analytics_view {
  label: "Case Management Denials"
  view_label: "Fact Table"

  join: benchmark_table {
    relationship: many_to_one
    sql_on: ${analytics_view.bm_combined} = ${benchmark_table.bm_combined} ;;
  }

  # join: test_x_list {
  #   relationship: one_to_one
  #   sql_on: 1 = 1 ;;
  # }

  # join: test_x_list_string_agg {
  #   relationship: one_to_one
  #   sql_on: 1 = 1 ;;
  # }

  # join: test_x_list_string_agg_dimension {
  #   relationship: one_to_one
  #   sql_on: 1 = 1 ;;
  # }
}

explore: fact_patient_test {
  hidden: yes

  join: patient_esl_test {
    relationship: one_to_one
    sql_on:
          ${fact_patient_test.patient_dw_id} = ${patient_esl_test.patient_dw_id}
      AND ${fact_patient_test.coid} = ${patient_esl_test.coid}
    ;;
  }

  join: denials_eom {
    relationship: one_to_many
    sql_on:
          ${fact_patient_test.patient_dw_id} = ${denials_eom.patient_dw_id}
      AND ${fact_patient_test.coid} = ${denials_eom.coid}
    ;;
  }

  join: facility_dim {
    relationship: many_to_one
    sql_on: ${fact_patient_test.coid} = ${facility_dim.facility_id} ;;
  }

  # join: most_recent_pay {
  #   relationship: many_to_one
  #   sql_on: ${fact_patient_test.patient_dw_id} = ${most_recent_pay.patient_dw_id} ;;
  # }
}

explore: patient_esl_test { hidden: yes }
explore: denials_eom { hidden: yes }
explore: facility_dim { hidden: yes }
explore: most_recent_pay { hidden: yes }
