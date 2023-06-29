view: bm_pre_write_offs {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_write_offs`
    ;;

  dimension: pk {
    primary_key: yes
    group_label: "ID"
    type: string
    sql: ${encounter_id_txt} || '|' || ${coid} ;;
  }

  dimension_group: admission_date {
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
    sql: ${TABLE}.admission_date_time ;;
  }

  dimension: coid {
    type: string
    sql: ${TABLE}.Coid ;;
  }

  dimension: date_sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.date_sid ;;
  }

  dimension: encounter_id_txt {
    type: string
    sql: ${TABLE}.Encounter_Id_Txt ;;
  }

  dimension: write_off_denial_account_amt {
    type: number
    sql: ${TABLE}.Write_Off_Denial_Account_Amt ;;
  }

  dimension: write_off_denial_account_count {
    type: number
    sql: ${TABLE}.Write_Off_Denial_Account_Count ;;
  }

  measure: sum_write_off_count {
    type: sum
    label: "Write Off"
    sql: ${write_off_denial_account_count} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
