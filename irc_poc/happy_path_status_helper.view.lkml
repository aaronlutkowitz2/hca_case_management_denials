view: happy_path_status_helper {
  derived_table: {
    sql: SELECT
          case
              when (Concurrent_Denial_Ind <> 0) then '1 Concurrent Denial'
              when (Postbill_Denial_Ind <> 0)  then '2 Postbill Denial'
              --when (Patient_Condition_Code IN ('XG','XF')) then '3 Is XF/XG code'
              --when (irc_poc.P2P_Ind <> 0) then '4 P2P Performed'
              --when (appeal_level_num = 1) then "5 Appeal Level 01"
              --when (appeal_level_num = 2) then "6 Appeal Level 02"
              when (initial_auth_status_code not in('Pending Authorization') and auth_code is not null) then '7 Authorization Post Discharge Not Received'
              else '9 Happy Path'
            end
            AS irc_poc_status_happy_path,
          coid, Encounter_Id_Txt, Admission_Date_Time
      FROM `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_status_values`
      UNION ALL
      SELECT
          '4 P2P Performed' AS irc_poc_status_happy_path,
          coid, Encounter_Id_Txt, Admission_Date_Time
      FROM `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_status_values` WHERE P2P_Ind <> 0
      UNION ALL
      SELECT
          '3 Is XF/XG code' AS irc_poc_status_happy_path,
          coid, Encounter_Id_Txt, Admission_Date_Time
      FROM `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_XCode` WHERE Condition_Code IN ('XG','XF')
      UNION ALL
      SELECT
          '8 Is NU code' AS irc_poc_status_happy_path,
          coid, Encounter_Id_Txt, Admission_Date_Time
      FROM `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_XCode` WHERE Condition_Code IN ('NU');;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: irc_poc_status_happy_path {
    type: string
    sql: ${TABLE}.irc_poc_status_happy_path ;;
  }

  dimension: pk {
    primary_key: yes
    group_label: "ID"
    type: string
    sql: ${encounter_id_txt} || '|' || ${coid} ;;
  }
  dimension: coid {
    group_label: "ID"
    type: number
    value_format_name: id
    sql: CAST(${TABLE}.Coid AS INT64) ;;
  }
  dimension: encounter_id_txt {
    group_label: "ID"
    type: string
    sql: ${TABLE}.Encounter_Id_Txt ;;
  }

  measure: encounter {
    type: count_distinct
    sql: ${pk} ;;
    label: "# Encounter"
    drill_fields: [detail*]
  }

  dimension_group: admission_date_time {
    type: time
    sql: ${TABLE}.Admission_Date_Time ;;
  }
  set: detail {
    fields: [coid, encounter_id_txt, admission_date_time_time]
  }
}
