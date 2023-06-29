view: iplanderivedtable {
  derived_table: {
    sql: with IplanData as (
      select
        distinct(concat(coid,"|",Encounter_Id_Txt)) as pk, Coid,Encounter_Id_Txt,Admission_Date_Time,Discharge_Date_Time,RegPF_IPlan_Id,eff_from_date,
        DENSE_RANK() OVER (PARTITION BY coid,Encounter_Id_Txt, admission_date_time, RegPF_IPlan_Id ORDER BY coid,Encounter_Id_Txt, admission_date_time, RegPF_IPlan_Id,eff_from_date DESC) AS finish_rank
      from `IRC_Denials_Views.bm_pre_combined_table_status_values`)
      select Coid,Encounter_Id_Txt,Admission_Date_Time,Discharge_Date_Time,RegPF_IPlan_Id,eff_from_date from IplanData
      where finish_rank=1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Admission_Date_Time ;;
  }

  dimension_group: discharge_date_time {
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
    sql: ${TABLE}.Discharge_Date_Time ;;
  }

  dimension: iplan_change_time_interval {
    type: number
    sql: date_diff(${eff_from_date},${admission_date_time_date},day) ;;
  }

  dimension: is_iplan_changed {
    type: yesno
    sql:  ${iplan_change_time_interval} > 0 and ${iplan_change_time_interval} < 3  ;;
  }

  measure: Iplan_Change {
    type: count_distinct
    sql: ${pk} ;;
    filters: [is_iplan_changed: "Yes"]
  }

  dimension: reg_pf_iplan_id {
    type: number
    sql: ${TABLE}.RegPF_IPlan_Id ;;
  }

  dimension: eff_from_date {
    type: date
    datatype: date
    sql: ${TABLE}.eff_from_date ;;
  }

  set: detail {
    fields: [
      coid,
      encounter_id_txt,
      admission_date_time_time,
      discharge_date_time_time,
      reg_pf_iplan_id,
      eff_from_date
    ]
  }
}
