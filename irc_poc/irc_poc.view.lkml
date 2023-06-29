#### IRC POC corresponds to the first main dashboard

view: irc_poc {
  sql_table_name: `hca-ati-irc-dev.IRC_Denials_Views.bm_pre_combined_table_status_values`
    ;;

###########################################
  ### Dimensions
###########################################

### ID
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
  dimension: payor_dw_id {
    group_label: "ID"
    type: string
    sql: ${TABLE}.Payor_DW_ID ;;
  }
  dimension:  All_Day_Authr_Ind {
    type: number
    sql: ${TABLE}.All_Day_Authr_Ind ;;
  }
  measure: All_Day_Authr_Ind_Sum {
    label: "# All Day Auth"
    type:count_distinct
    filters: [All_Day_Authr_Ind: "<> 0"]
    sql: ${pk} ;;
  }

  dimension:  Authr_Not_Required_Ind{
    type: number
    sql: ${TABLE}.Authr_Not_Required_Ind ;;
  }
  # measure: Authr_Not_Required_Ind_Sum {
  #   label: "# Auth Not Required"
  #   type:count_distinct
  #   sql: ${pk} ;;
  #   filters: [Authr_Not_Required_Ind: "<> 0"]
  # }
  measure: Authr_Not_Required_Ind_Sum {
    label: "# Auth Not Required"
    type:number
    sql: ${count}-${Authr_Required_Ind_count} ;;
  }
  dimension:  Authr_Required_Ind{
    type: number
    sql: ${TABLE}.Authr_Required_Ind ;;
  }
  measure: Authr_Required_Ind_count {
    label: "# Auth Required"
    type:count_distinct
    sql: ${pk} ;;
    filters: [Authr_Required_Ind: "<> 0"]
  }

  dimension:  Nursing_Reconsideration_Successful_Ind{
    type: number
    sql: ${TABLE}.Nursing_Reconsideration_Successful_Ind ;;
  }
  measure: Nursing_Reconsideration_Successful_Ind_count {
    label: "# Nursing Reconsideration Successful"
    type:count_distinct
    sql: ${pk} ;;
    filters: [Nursing_Reconsideration_Successful_Ind: "<> 0"]
  }

  dimension:  Interqual_Met_Ind{
    type: string
    sql: ${TABLE}.Interqual_Met_Ind ;;
  }
  measure: Interqual_Met_Ind_count {
    label: "# Interqual Met"
    type:count_distinct
    sql: ${pk} ;;
    filters: [Interqual_Met_Ind: "Y"]
  }

  dimension: initial_auth_status_code {
    type: string
    sql: ${TABLE}.initial_auth_status_code ;;
  }
  dimension: auth_code  {
    type: string
    sql: ${TABLE}.auth_code ;;
  }
  measure: Authorization_Post_Discharge_Received {
    label: "# Authorization Post Discharge  Received"
    type: count_distinct
    sql: ${pk} ;;
    filters: [initial_auth_status_code: "Pending Authorization",auth_code: "-%PENDING% , NR/I, %/IWB, %/IB, %/I"]
    drill_fields: [validate*]
  }
  dimension: iplan_id {
    group_label: "ID"
    type: string
    sql: ${TABLE}.Iplan_ID ;;
  }

  dimension_group: eff_from_date {
    label: "IPlan Eff from date"
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
    sql: ${TABLE}.eff_from_date ;;
  }

  dimension: eff_from_date_diff {
    type: number
    sql: date_diff(${eff_from_date_date}, ${admission_date_date}, day);;
  }

  dimension: eff_form_date_validate {
    label: "IPlan Validtion"
    type: yesno
    sql: ${eff_from_date_diff} > 0 and ${eff_from_date_diff} <= 3 ;;
  }

  measure: eff_form_date_count {
    label: "# IPlan Change"
    type: count_distinct
    sql: ${pk} ;;
    filters: [eff_form_date_validate: "Yes"]
  }

  dimension_group: capture_date {
    label: "Timely NOA Capture Date"
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
    sql: ${TABLE}.capture_date ;;
  }

  dimension: capture_date_diff {
    type: number
    sql: date_diff( ${capture_date_date}, ${admission_date_date}, day);;
  }

  dimension: capture_date_validate {
    label: "Timely NOA Validation"
    type: yesno
    sql: ${capture_date_diff} <= 1 and ${capture_date_diff}>-1;;
  }

  dimension_group: appeal_closing_date {
    group_label: "Appeal Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Appeal_Closing_Date ;;
  }
  dimension_group: appeal_origination_date {
    group_label: "Appeal Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Appeal_Origination_Date ;;
  }

  dimension: overturned_days {
  type: number
  sql: ${TABLE}.overturned_days ;;

  }

  dimension: final_denial_process {
    group_label: "Appeal Date"
    type: yesno
    sql: ${overturned_days}>1 AND ${overturned_days}<=30 ;;
  }

 # dimension: icd_version_ind {
  #  type: string
  #  sql: ${TABLE}.icd_version_ind ;;
#  }



  measure: final_denial_process_count {
    group_label: "Appeal Date"
    type: count_distinct
    sql: ${pk} ;;
    filters: [final_denial_process: "Yes"]
    drill_fields: [validate*]
  }
dimension: status_code {
  type: string
  sql: ${TABLE}.status_code ;;
}
dimension: cplt_med_rec_ind {
  type: string
  sql: ${TABLE}.cplt_med_rec_ind ;;
}
dimension: itm_bill_ind {
  type: string
  sql: ${TABLE}.itm_bill_ind ;;
}
dimension: med_rec_itm_ind {
  type: yesno
  sql: case
       when ${cplt_med_rec_ind} = 'Y'
       AND
       ${itm_bill_ind} = 'Y'
      AND
      ${status_code} <> 'CANC'
      then true
      else false
      end;;
}
  measure: pre_pay_doc_req {
    label: "Prepay document request"
    type: count_distinct
    sql: ${pk} ;;
    filters: [med_rec_itm_ind: "Yes"]
    drill_fields: [validate*]

  }

  measure: Secondary_Iplan {
    label: "Secondary Iplan Auth Required"
    type: count_distinct
    sql: ${pk} ;;
    filters: {
      field: Denial_Code_Category
      value: "No Auth/Notification"
      }
    filters: {
    field: Payor_Sequence
     value: "2,3"
   }
   drill_fields: [validate*]

  }

  measure: Adjudicated_Auth_Denials {
    label: "Adjudicated_Auth_Denials"
    type: count_distinct
    sql: ${pk} ;;
    filters: {
      field: Denial_Code_Category
      value: "No Auth/Notification"
    }
    drill_fields: [coid,pat_acct_num]
    }
  measure: Adjudicated_Med_Denials {
    label: "Adjudicated_Med_Denials"
    type: count_distinct
    sql: ${pk} ;;
    filters: {
      field: Denial_Code_Category
      value: "Medical Necessity"
    }
    drill_fields: [coid,pat_acct_num]

  }
  measure: Adjudicated_Other_Denials {
    label: "Adjudicated_Other_Denials"
    type: count_distinct
    sql: ${pk} ;;
    filters: {
      field: Denial_Code_Category
      value:  "Information Requested/Other Technical Denial,No Denial Code,All Coding Denial,Timely Filing"
    }
    drill_fields: [coid,pat_acct_num]


  }

dimension: Denial_Code_Category {
  label: "Denial_Code_Category"
  type: string
  sql: ${TABLE}.denial_code_category ;;
}
dimension: Payor_Sequence {
  label: "Payor Sequence"
  type: number
  sql: ${TABLE}.payor_sequence_sid ;;
}
dimension: visit_id {
  label: "Visit ID"
  description: "Using this field to help with validation"
  type: number
  sql: ${TABLE}.visit_id ;;
}
  measure: capture_date_count {
    label: "# Timely NOA"
    type: count
    #sql: ${pk} ;;
    filters: [capture_date_validate: "Yes"]
    drill_fields: [coid,encounter_id_txt, visit_id,admission_date_date ,capture_date_date]
  }

  dimension: total_exp_payment_amt {
    group_label: "Paid in Full"
    type: number
    sql: ${TABLE}.total_exp_payment_amt ;;
  }

  dimension: total_pat_responsibility_amt {
    group_label: "Paid in Full"
    type: number
    sql: ${TABLE}.total_pat_responsibility_amt ;;
  }

  dimension: total_payment_amt {
    group_label: "Paid in Full"
    type: number
    sql: ${TABLE}.total_payment_amt ;;
  }

  dimension: paid_in_full {
    group_label: "Paid in Full"
    type: yesno
    sql: (${total_payment_amt} = (${total_exp_payment_amt} - ${total_pat_responsibility_amt}));;
  }

  measure: paid_in_full_count {
    group_label: "Paid in Full"
    type: count
    #sql: ${pk} ;;
    filters: [paid_in_full: "yes"]
    drill_fields: [validate*]
  }

  dimension: determination_reason_desc {
    group_label: "Billed"
    type: string
    sql: ${TABLE}.determination_reason_desc ;;
  }

  dimension: iplan_change_count {
    type: number
    sql: ${TABLE}.iplan_change_count ;;
  }

  measure: iplan_change_admission_metric {
    label: "Iplan Change - Admission Metric"
    type: sum
    sql: ${iplan_change_count} ;;
    drill_fields: [coid,encounter_id_txt,pat_acct_num]
  }

  measure: billed_with_all_days_auth {
    group_label: "Billed"
    label: "Billed with All Days Auth"
    type: count_distinct
    sql: ${pk} ;;
    filters: [
      determination_reason_desc: "All days approved, All Days Approved - Mom or Bab, Full denial overturn,Partial denial overturn"
    ]
  }

  measure: billed_with_partial_days_auth {
    group_label: "Billed"
    label: "Billed with Partial Days Auth"
    type: count_distinct
    sql: ${pk} ;;
    filters: [
      determination_reason_desc: "Partial denial upheld agree, Partial denial upheld disagree"
    ]
    drill_fields: [coid,encounter_id_txt]
  }

  measure: billed_without_auth {
    group_label: "Billed"
    label: "Billed without Auth"
    type: count_distinct
    sql: ${pk} ;;
    filters: [
      determination_reason_desc: "Auth Auto Close - ePTAC"
    ]
  }

### Hierarchy DRG
  dimension: esl_level_1_desc {
    group_label: "Hierarchy DRG"
    label: "L1 In vs Outpatient"
    drill_fields: [esl_level_2_desc, esl_level_3_desc, division_name, market_name, facility_name, financial_class_code_text, major_payor_group_desc]
  }
  dimension: esl_level_2_desc {
    group_label: "Hierarchy DRG"
    label: "L2 Service Line"
    drill_fields: [esl_level_3_desc, esl_level_4_desc, division_name, market_name, facility_name, financial_class_code_text, major_payor_group_desc]
  }
  dimension: esl_level_3_desc {
    group_label: "Hierarchy DRG"
    label: "L3 DRG Superfamily"
    drill_fields: [esl_level_4_desc, esl_level_5_desc, division_name, market_name, facility_name, financial_class_code_text, major_payor_group_desc]
  }
  dimension: esl_level_4_desc {
    group_label: "Hierarchy DRG"
    label: "L4 DRG Family"
    drill_fields: [esl_level_5_desc, division_name, market_name, facility_name, financial_class_code_text, major_payor_group_desc]
  }
  dimension: esl_level_5_code {
    group_label: "Hierarchy DRG"
    label: "xL5 DRG Code"
  }
  dimension: esl_level_5_desc {
    group_label: "Hierarchy DRG"
    label: "L5 DRG Name"
    drill_fields: [division_name, market_name, facility_name, financial_class_code_text, major_payor_group_desc]
  }
  dimension: drg_code_hcfa {
    group_label: "Hierarchy DRG"
    label: "Z - DRG Code HCFA"
    type: string
    sql: ${TABLE}.DRG_Code_HCFA ;;
  }
  dimension: drg_code_payor {
    group_label: "Hierarchy DRG"
    label: "Z - DRG Code Payor"
    type: string
    sql: ${TABLE}.DRG_Code_Payor ;;
  }

### Hierarchy Facility
  dimension: enterprise_name {
    group_label: "Hierarchy Facility"
    label: "1 Enterprise"
    type: string
    sql: 'HCA' ;;
    drill_fields: [group_name, division_name]
  }
  dimension: group_name {
    group_label: "Hierarchy Facility"
    label: "2 Group"
    drill_fields: [division_name, market_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, financial_class_code_text, major_payor_group_desc]
  }
  dimension: division_name {
    group_label: "Hierarchy Facility"
    label: "3 Division"
    drill_fields: [market_name, facility_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, financial_class_code_text, major_payor_group_desc]
    sql: left(${TABLE}.division_name, length(${TABLE}.division_name) - 9) ;;
  }
  dimension: market_name {
    group_label: "Hierarchy Facility"
    label: "4 Market"
    drill_fields: [facility_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, financial_class_code_text, major_payor_group_desc]
  }
  dimension: facility_name {
    group_label: "Hierarchy Facility"
    label: "5 Facility Name"
    drill_fields: [facility_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, financial_class_code_text, major_payor_group_desc]
  }
  dimension: lat {
    hidden: yes
    type: number
  }
  dimension: long {
    hidden: yes
    type: number
  }
  dimension: location {
    group_label: "Hierarchy Facility"
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${long} ;;
  }

### Dates
  dimension_group: arrival_date {
    label: "Date Arrival"
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
    sql: ${TABLE}.Arrival_Date_Time ;;
  }
  dimension_group: admission_date {
    label: "Date Admission"
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
  dimension_group: discharge_date {
    label: "Date Discharge"
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
  dimension_group: bill {
    label: "Date Bill"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Bill_Date ;;
  }
  dimension_group: first_appeal {
    label: "Date First Appeal"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.First_Appeal_Date ;;
  }
  dimension_group: first_denial {
    label: "Date First Denial"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.First_Denial_Date ;;
  }
  dimension_group: cc_appeal_origination {
    label: "Date Appeal Origination"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CC_Appeal_Origination_Date ;;
  }
  dimension_group: final_payment {
    label: "Date Final Payment"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Final_Payment_Date ;;
  }
  dimension_group: p2p_date {
    label: "Date P2P"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.First_P2P_Determination_Date ;;
  }


### Denial
  dimension: first_denial_first_denial {
    group_label: "Denial"
    type: string
    sql: ${TABLE}.First_Denial_First_Denial ;;
  }
  dimension: first_denial_iplan {
    group_label: "Denial"
    type: string
    sql: ${TABLE}.First_Denial_Iplan ;;
  }
  dimension: denial_reason {
    group_label: "Denial"
    type: string
    sql: case when ${irc_poc__appeal_detail.is_min_date} then ${irc_poc__appeal_detail.appeal_code_child} else NULL end ;;
  }
  dimension: denial_code {
    group_label: "Denial"
    type: string
    sql: case when ${irc_poc__appeal_detail.is_min_date} then ${irc_poc__appeal_detail.appeal_code} else NULL end ;;
  }
  dimension: is_denial_code {
    group_label: "Denial"
    hidden: yes
    type: yesno
    sql: ${denial_code} is not null ;;
  }
  dimension: is_denial_code_num {
    group_label: "Denial"
    type: number
    sql: case when ${is_denial_code} then 1 else 0 end ;;
  }
  dimension: denial_reason_text {
    group_label: "Denial"
    type: string
    sql:
      case
        when ${first_denial_date} is null then '2 No Denial'
        when ${denial_reason} = 'No Denial' then '2 No Denial'
        when left(${denial_reason},2) = 'MN' then '1c Medical Necessity'
        when ${denial_reason} in ('No_Pre-Cert','No_Re-Cert') then '1b Prior Auth'
        else '1a Other'
      end ;;
  }
  dimension: denial_concurrent_vs_post {
    group_label: "Denial"
    type: string
    sql:
      case
        when ${first_denial_date} > ${discharge_date_date} then '2 Post-Discharge Denial'
        when ${first_denial_date} <= ${discharge_date_date} then '1 Concurrent Denial'
        else '3 No Denial'
      end ;;
  }


### Payor Info
  dimension: major_payor_group_desc {
    group_label: "Payor"
    type: string
    sql: ${TABLE}.Major_Payor_Group_Desc ;;
    drill_fields: [group_name, division_name, market_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, financial_class_code_text]
  }
  dimension: financial_class_code {
    group_label: "Payor"
    type: string
    sql: ${TABLE}.Financial_Class_Code ;;
  }
  dimension: financial_class_code_text {
    group_label: "Payor"
    type: string
    sql: ${TABLE}.Financial_Class_Code_text ;;
    drill_fields: [group_name, division_name, market_name, esl_level_3_desc, esl_level_4_desc, esl_level_5_desc, major_payor_group_desc]
  }

  dimension: financial_class {
    type: string
    sql: CONCAT(format("%02d",CAST(${financial_class_code} AS INT64)), ' - ' , ${financial_class_code_text});;
  }

  dimension: authorization_required_ind {
    group_label: "Payor"
    type: string
    sql: ${TABLE}.Authorization_Required_Ind ;;
  }
dimension: non_response_letter_acct_ind {
  label: "Payer Non Response Letter Indicator"
  type: number
  sql: ${TABLE}.Non_Response_Letter_Acct_Ind ;;
}
  measure: Payer_non_response_letter_acct_ind{
    label: "Payer Non Response Letter On Acccount"
    type:count_distinct
    sql: ${pk} ;;
    filters: [non_response_letter_acct_ind: "<> 0"]
    drill_fields: [coid,encounter_id_txt,admission_date_date]
  }
### Clinical Info
  dimension: advisory_board_service_line {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.Advisory_Board_Service_Line ;;
  }
  dimension: advisory_board_sub_service_line {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.Advisory_Board_Sub_Service_Line ;;
  }
  dimension: apr_risk_of_mortality {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.APR_Risk_of_Mortality ;;
  }
  dimension: apr_severity_of_illness {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.APR_Severity_of_Illness ;;
  }
  dimension: is_severity_of_illness {
    label: "Severity of Illness"
    type: yesno
    sql: ${apr_severity_of_illness} = "2" ;;
  }
  measure: apr_severity_of_illness_count {
    group_label: "Severity of Illness (2)"
    type: count_distinct
    sql: ${pk} ;;
    filters: [apr_severity_of_illness: "2"]
    drill_fields: [coid,encounter_id_txt,pat_acct_num]
  }
  dimension: reason_for_visit_txt {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.Reason_For_Visit_Txt ;;
  }

## NPI
  dimension: facility_physician_num_attend {
    group_label: "NPI"
  }
  dimension: facility_physician_attend_npi {
    group_label: "NPI"
  }
  dimension: facility_physician_num_admit {
    group_label: "NPI"
  }
  dimension: facility_physician_admit_npi {
    group_label: "NPI"
  }
  dimension: facility_physician_num_pcp {
    group_label: "NPI"
  }
  dimension: facility_physician_pcp_npi {
    group_label: "NPI"
  }
## Patient_Condition_Code - XCode for IP billed as OP
dimension: patient_condition_code {
  type: string
  sql: ${TABLE}.Patient_Condition_Code ;;
}
dimension: isXCode {
  type: yesno
  hidden: yes
  sql: ${patient_condition_code}='XG' OR ${patient_condition_code}='XF' ;;
}
dimension: pat_acct_num {
  type: number
  sql: ${TABLE}.pat_acct_num ;;
}
dimension: admission_type {
  type: string
  sql: ${TABLE}.admission_patient_type_code ;;
}
dimension: admission_prev_pat_type_code {
  type: string
  sql: ${TABLE}.Admission_Prev_Pat_Type_Code ;;
}
dimension: admission_type_change {
  type: yesno
  sql: ${admission_type} <> ${admission_prev_pat_type_code} ;;
}

  measure: admission_type_change_count {
    label: "Admission Type Change"
    type: count_distinct
    sql: ${pk} ;;
    filters: [admission_type_change: "Yes"]
  }
### P2P
  dimension: p2p_ind {
    group_label: "P2P"
    type: string
  }
  dimension: p2p_ind_table {
    type: number
    sql: ${TABLE}.P2P_Ind;;
  }
  dimension: peer_review_status_code {
    group_label: "P2P"
    type: string
    sql: ${TABLE}.Peer_Review_Status_Code ;;
  }
  dimension: hcm_appeal_status_id {
    group_label: "P2P"
    type: string
    sql: ${TABLE}.HCM_Appeal_Status_Id ;;
  }
  dimension: hcm_appeal_status_name {
    group_label: "P2P"
    type: string
    sql: ${TABLE}.HCM_Appeal_Status_Name ;;
  }
  dimension: had_p2p {
    group_label: "P2P"
    type: yesno
    sql: ${p2p_ind} is null or (${p2p_ind} = 0 and ${p2p_date_raw} is null) ;;
  }
  dimension: p2p_type {
    group_label: "P2P"
    type: string
    sql:
        case
          when ${p2p_ind} is null or (${p2p_ind} = 0 and ${p2p_date_raw} is null) then '4 No P2P'
          when ${p2p_date_date} >= coalesce(${discharge_date_date},'1999-01-01') then '2 P2P Before Discharge'
          when ${p2p_date_date} < coalesce(${discharge_date_date},'1999-01-01') then '3 P2P After Discharge'
          when ${p2p_ind} >= 1 then '1 P2P Unknown Date'
          else '0 Unknown'
        end
          ;;
  }

  dimension: p2p_overturned {
    group_label: "P2P"
    type: number
    sql: ${TABLE}.P2P_Overturned ;;
  }

  dimension: is_p2p_overturned {
    group_label: "P2P"
    type: yesno
    sql: ${TABLE}.P2P_Overturned <> 0;;
  }

  parameter: P2P_overturned_p {
    view_label: "P2P Overturned"
    type: string
    default_value: "yes"
    allowed_value: {label: "Yes" value: "yes"}
    allowed_value: {label: "No" value: "no"}
  }
  dimension: P2P_overturned_value {
    hidden: yes
    view_label: "P2P Overturned"
    type: string
    sql:
      case
        when {% parameter P2P_overturned_p %} = 'yes' then ${is_p2p_overturned} <> 0
        when {% parameter P2P_overturned_p %} = 'no' then not (${is_p2p_overturned} <> 0)
      end ;;
  }

  dimension: is_p2p_upheld {
    group_label: "P2P"
    hidden: yes
    type: number
    sql: ${TABLE}.P2P_Upheld ;;
  }

  parameter: P2P_upheld {
    view_label: "P2P Upheld"
    type: string
    default_value: "yes"
    allowed_value: {label: "Yes" value: "yes"}
    allowed_value: {label: "No" value: "no"}
  }
  dimension: P2P_upheld_value {
    hidden: yes
    view_label: "P2P Upheld"
    type: string
    sql:
      case
        when {% parameter P2P_upheld %} = 'yes' then ${is_p2p_upheld} <> 0
        when {% parameter P2P_upheld %} = 'no' then not (${is_p2p_upheld} <> 0)
      end ;;
  }

  dimension: appeal_overturned {
    group_label: "P2P"
    type: number
    sql: ${TABLE}.Appeal_Overturned ;;
  }

  dimension: is_appeal_overturned {
    group_label: "P2P"
    type: yesno
    sql: ${TABLE}.Appeal_Overturned <> 0;;
  }

  dimension: appeal_overturned_yes {
    group_label: "P2P"
    type: number
    sql: ${TABLE}.Appeal_Overturned <> 0;;
  }

  dimension: appeal_overturned_no {
    group_label: "P2P"
    type: number
    sql: not (${TABLE}.Appeal_Overturned <> 0);;
  }

  parameter: appeal_overturned_parameter {
    view_label: "Appeal Overturned"
    type: string
    default_value: "yes"
    allowed_value: {label: "Yes" value: "yes"}
    allowed_value: {label: "No" value: "no"}
  }

  dimension: appeal_overturned_value {
    view_label: "Appeal Overturned"
    hidden: yes
    type: string
    sql:
      {% if    appeal_overturned_parameter._parameter_value == 'yes' %}
        ${appeal_overturned_yes}
      {% elsif appeal_overturned_parameter._parameter_value == 'no' %}
        ${appeal_overturned_no}
      {% endif %}
    ;;

  }

  dimension: p2p_appeal_upheld {
    group_label: "P2P"
    hidden: yes
    type: number
    sql: ${TABLE}.Appeal_Upheld ;;
  }

  parameter: appeal_upheld {
    view_label: "Appeal Upheld"
    type: string
    default_value: "yes"
    allowed_value: {label: "Yes" value: "yes"}
    allowed_value: {label: "No" value: "no"}
  }
  dimension: appeal_upheld_value {
    hidden: yes
    view_label: "Appeal Upheld"
    type: string
    sql:
      case
        when {% parameter appeal_upheld %} = 'yes' then ${p2p_appeal_upheld} <> 0
        when {% parameter appeal_upheld %} = 'no' then not (${p2p_appeal_upheld} <> 0)
      end ;;
  }

dimension: Write_Off_Denial_Account_Amt {
  hidden: yes
  type: number
  sql: ${TABLE}.Write_Off_Denial_Account_Amt ;;
}
measure: Write_Off {
  label: "# Write Off"
  type: sum
  sql: ${TABLE}.Write_Off_Denial_Account_Count ;;
  #filters: [Write_Off_Denial_Account_Amt: "> 0"]
  #value_format_name: custom_named_value_format
}
measure: Write_Offs_New{
  type: sum
  sql: ${TABLE}.Write_Off_Denial_Account_Count ;;
  }
### KPIs (Dimensions)
  ### # update this later ###
  dimension: total_billed_charges {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.Total_Billed_Charges ;;
  }
  dimension: total_payments {
    group_label: "KPIs"
    type: number
    sql: ${TABLE}.Total_Payments ;;
  }
  dimension: total_account_balance_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_anc_charges {
    group_label: "KPIs"
    type: number
  }
  dimension: total_rb_charges {
    group_label: "KPIs"
    type: number
  }
  dimension: total_adjustment_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_contract_allow_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_write_off_bad_debt_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_write_off_other_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_write_off_other_adj_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_uninsured_discount_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_charity_write_off_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_patient_liability_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: total_patient_payment_amt {
    group_label: "KPIs"
    type: number
  }
  dimension: days_discharge_payment {
    group_label: "KPIs"
    type: number
    sql: date_diff(${final_payment_date}, coalesce(${discharge_date_date}, coalesce(${admission_date_date},${arrival_date_date})), day) ;;
  }

### KPIs (Happy Path)
  parameter: paid_in_full_low {
    group_label: "Happy Path"
    type: number
    default_value: "0.95"
  }
  parameter: paid_in_full_high {
    group_label: "Happy Path"
    type: number
    default_value: "1.05"
  }
  dimension: is_paid_in_full {
    group_label: "Happy Path"
    type: yesno
    sql: ${total_payments} / nullif(${total_account_balance_amt} + ${total_payments},0) between {% parameter ${paid_in_full_low} %} and {% parameter ${paid_in_full_high} %} ;;
  }
  dimension: is_timely_payment {
    group_label: "Happy Path"
    type: yesno
    sql: (${final_payment_date} is null AND ${is_paid_in_full}) OR ${days_discharge_payment} < 60 ;;
  }
  dimension: is_denied {
    group_label: "Happy Path"
    type: yesno
    # sql: ${first_denial_raw} is not null  ;;
    sql: ${irc_poc__appeal_detail.is_min_date} is not null ;;
  }
  dimension: is_happy_path_old {
    hidden: yes
    group_label: "Happy Path"
    type: yesno
    sql: not ${is_paid_in_full} and not ${is_timely_payment} and not (${is_denied}) ;;
  }
  dimension: is_happy_path {
    group_label: "Happy Path"
    type: yesno
    sql: ${is_concurrent_denial} or ${is_postbill_denial} or ${isXCode} or ${is_p2p_performed};;
  }

  dimension: is_paid_in_full_num {
    hidden: yes
    type: number
    sql: case when ${is_paid_in_full} then 1 else 0 end ;;
  }
  dimension: is_denied_num {
    hidden: yes
    type: number
    sql: case when ${is_denied} then 1 else 0 end ;;
  }
  dimension: is_timely_payment_num {
    hidden: yes
    type: number
    sql: case when ${is_timely_payment} then 1 else 0 end ;;
  }

  dimension: status_timely_paid_in_full {
    group_label: "Happy Path"
    type: string
    sql:
      case
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 then '4 Paid in Full Timely'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 then '3 Paid in Full, Not Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 then '2 Not Paid in Full, Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 then '1 Not Paid in Full, Not Timely'
        else '0 Unknown'
      end
    ;;
  }

  dimension: status_happy_path_old {
    hidden: yes
    group_label: "Happy Path"
    type: string
    sql:
      case
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '8 Happy Path'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '7 Not Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '6 Not Paid in Full'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '5 Not Paid in Full, Not Timely'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '4 Denied'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '3 Denied, Not Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '2 Denied, Not Paid in Full'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '1 Denied, Not Paid in Full, Not Timely'
        else '0 Unknown'
      end
    ;;
  }
  dimension: concurrent_denial_ind {
    type: number
    sql: ${TABLE}.Concurrent_Denial_Ind ;;
  }
  dimension: is_concurrent_denial {
    type: yesno
    hidden: yes
    sql: ${concurrent_denial_ind} <> 0  ;;
  }
  dimension: postbill_denial_ind {
    type: number
    sql: ${TABLE}.Postbill_Denial_Ind ;;
  }
  dimension: is_postbill_denial {
    type: yesno
    hidden: yes
    sql: ${postbill_denial_ind} <> 0 ;;
#    sql:  ${is_denial_code_num} = 1 and (${first_denial_date} > ${discharge_date_date}) ;;
  }
#  dimension: is_not_paid_correctly {
#    type: yesno
#    hidden: yes
#    sql: ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 ;;
#  }
  dimension: is_p2p_performed {
    type: yesno
   # hidden: yes
    sql: ${p2p_ind_table} <> 0 ;;
  }
  # dimension: auth_date {
  #   type: string
  #   sql: ${TABLE}.auth_date ;;
  # }
  # dimension: is_auth_date {
  #   type: yesno
  #   sql: ${auth_date} is NULL ;;
  # }
  dimension: appeal_level_num {
    type: number
    sql: ${TABLE}.appeal_level_num ;;
  }
  dimension: is_appeal_level_num_1 {
    label: "Appeal Level 01"
    type: yesno
    sql: ${appeal_level_num} = 1 ;;
  }
  dimension: is_appeal_level_num_2 {
    label: "Appeal Level 02"
    type: yesno
    sql: ${appeal_level_num} = 2 ;;
  }
  dimension: status_happy_path {
    group_label: "Happy Path"
    type: string
    sql:
      case
        when ${is_concurrent_denial} then '1 Concurrent Denial'
        when ${is_postbill_denial}  then '2 Postbill Denial'
        when ${isXCode} then '3 Is XF/XG code'
        when ${is_p2p_performed} then '4 P2P Performed'
      end
    ;;
  }

  #when ${is_denial_code_num} = 1 and ${is_timely_payment_num} = 1 then '3 Not xCode'
  #when ${is_denial_code_num} = 1 and ${is_timely_payment_num} = 1 then '4 Paid correctly'
  #when ${is_denial_code_num} = 1 and ${is_timely_payment_num} = 1 then '5 P2P Not Performed'

  dimension: sankey_sort {
    group_label: "Z"
    # sql: left(${denial_reason_text},1) || '|' || left(${denial_concurrent_vs_post},1) || '|' || left(${p2p_type},1) || '|' || left(${status_timely_paid_in_full},1) ;;
    sql: left(${status_timely_paid_in_full},1) || '|' || left(${p2p_type},1) || '|' || left(${denial_concurrent_vs_post},1) || '|' || left(${denial_reason_text},2) ;;
  }

## Status by day buildup
  dimension: days_denial_arrival {
    group_label: "ZStatus by Day"
    type: number
    sql: date_diff(${first_denial_date}, coalesce(${arrival_date_date},${admission_date_date}), day) ;;
  }
  dimension: days_discharge_arrival {
    group_label: "ZStatus by Day"
    type: number
    sql: date_diff(${discharge_date_date}, coalesce(${arrival_date_date},${admission_date_date}), day) ;;
  }
  dimension: days_payment_arrival {
    group_label: "ZStatus by Day"
    type: number
    sql: date_diff(${final_payment_date}, coalesce(${arrival_date_date},${admission_date_date}), day) ;;
  }
  dimension: days_denial {
    group_label: "ZStatus by Day"
    type: number
    sql:
      case
        when ${is_denied} AND ${days_denial_arrival} is not null then ${days_denial_arrival}
        when ${is_denied} AND ${days_denial_arrival} is null and ${days_discharge_arrival} is not null then ${days_discharge_arrival} + 10 -- if not date, assume 10 days after discharge
        when ${is_denied} AND ${days_denial_arrival} is null and ${days_discharge_arrival} is null then 20 -- if no date 2x, assume 20 days after arrival
        when ${is_denied} then 20 -- if nothing else, if it's denied, call it at 20
        else 99999 -- if never denied, never happen
      end
    ;;
  }
  dimension: days_denialz2 {
    type: number
    sql:
      case
        when ${days_denial} < 0 then -1
        when ${days_denial} > 365 then 365
        else ${days_denial}
      end

      ;;

  }
  dimension: days_full_payment {
    group_label: "ZStatus by Day"
    type: number
    sql:
      case
        when ${is_paid_in_full} AND ${days_payment_arrival} is not null then ${days_payment_arrival}
        when ${is_paid_in_full} AND ${days_payment_arrival} is null then 60 -- if no date, assume 60 days after arrival
        else 99999 -- if never paid in full, never happen
      end
    ;;
  }
  dimension: days_timely_payment {
    group_label: "ZStatus by Day"
    type: number
    sql:
      case
        when ${is_timely_payment} AND ${days_payment_arrival} is not null then ${days_payment_arrival}
        when ${is_timely_payment} AND ${days_payment_arrival} is null then 60 -- if no date, assume 60 days after arrival
        else 99999 -- if never paid in full, never happen
      end
    ;;
  }

### Dim Selector
  parameter: dim_selector {
    type: unquoted
    default_value: "division"
    allowed_value: {label: "Major Payor" value: "major_payor"}
    allowed_value: {label: "Financial Class" value: "financial_class"}
    allowed_value: {label: "Division" value: "division"}
    allowed_value: {label: "Market" value: "market"}
    allowed_value: {label: "Facility" value: "facility"}
    allowed_value: {label: "NPI" value: "npi"}
    allowed_value: {label: "Service Line" value: "service_line"}
    allowed_value: {label: "Subservice Line" value: "sub_service_line"}
  }
  dimension: dim_dynamic {
    type: string
    sql:
      {% if    dim_selector._parameter_value == 'major_payor' %}      ${major_payor_group_desc}
      {% elsif dim_selector._parameter_value == 'financial_class' %}  ${financial_class_code_text}
      {% elsif dim_selector._parameter_value == 'division' %}         ${division_name}
      {% elsif dim_selector._parameter_value == 'market' %}           ${market_name}
      {% elsif dim_selector._parameter_value == 'facility' %}         ${facility_name}
      {% elsif dim_selector._parameter_value == 'npi' %}              ${facility_physician_attend_npi}
      {% elsif dim_selector._parameter_value == 'service_line' %}     ${esl_level_2_desc}
      {% elsif dim_selector._parameter_value == 'sub_service_line' %} ${esl_level_3_desc}
      {% else %}                                                      ${division_name}
      {% endif %}
    ;;
    drill_fields: [esl_level_3_desc, esl_level_4_desc, division_name, market_name, facility_name, irc_poc__npi.attending_practitioner_npi]
  }

### Hidden Struct Joins
  dimension: appeal_detail {
    hidden: yes
    sql: ${TABLE}.appeal_detail ;;
  }
  dimension: diag_code {
    hidden: yes
    sql: ${TABLE}.diag_code ;;
  }
  dimension: proc_code {
    hidden: yes
    sql: ${TABLE}.proc_code ;;
  }
  dimension: status_by_day {
    hidden: yes
    sql: ${TABLE}.status_by_day ;;
  }

###########################################
  ### Measures
###########################################

### Set
  set: drill {
    fields: [
      encounter_id_txt
      , coid
      , esl_level_3_desc
      , esl_level_4_desc
      , esl_level_5_code
      , division_name
      , market_name
      , facility_name
      ,patient_condition_code
    ]
  }
  set: validate {
    fields: [
      coid
      ,pat_acct_num
    ]
  }
### Count
  measure: count {
    label: "# Encounters"
    type: count_distinct
    sql: ${pk} ;;
    #value_format_name: custom_named_value_format
    drill_fields: [drill*]
  }

### Happy Path
  measure: count_paid_in_full {
    group_label: "Happy Path"
    type: count
    filters: [is_paid_in_full: "Yes"]
  }
  measure: count_denied {
    group_label: "Happy Path"
    type: count
    filters: [is_denied: "Yes"]
  }
  measure: count_timely_payment {
    group_label: "Happy Path"
    type: count
    filters: [is_timely_payment: "Yes"]
  }
  measure: count_happy_path {
    group_label: "Happy Path"
    type: count
    filters: [is_happy_path: "No"]
  }
  measure: count_unhappy_path {
    hidden: yes
    group_label: "Happy Path"
    type: count
    filters: [is_happy_path: "Yes"]
  }
  measure: percent_paid_in_full {
    group_label: "Happy Path"
    type: number
    sql: ${count_paid_in_full} / nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: percent_denied {
    group_label: "Happy Path"
    type: number
    sql: ${count_denied} / nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: percent_timely_payback {
    group_label: "Happy Path"
    type: number
    sql: ${count_timely_payment} / nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: percent_happy_path {
    group_label: "Happy Path"
    type: number
    sql: ${count_happy_path} / nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: average_happy_path_score {
    group_label: "Happy Path"
    type: average
    sql: left(${status_happy_path},1) ;;
    value_format_name: decimal_1
  }

### Clinical
  measure: count_proc {
    group_label: "Clinical"
    type: count_distinct
    sql: ${irc_poc__proc_code.proc_code} ;;
  }
  measure: count_diag {
    group_label: "Clinical"
    type: count_distinct
    sql: ${irc_poc__diag_code.diag_code} ;;
  }

###########################################
  ### Benchmark
###########################################

## Step 1: Create benchmark values for all dimensions to benchmark on
  parameter: bm_division { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_division_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_division %} = 'out' then 'x' else coalesce(safe_cast(${division_name} as string),'unknown_') end ;; }

  parameter: bm_market { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_market_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_market %} = 'out' then 'x' else coalesce(safe_cast(${market_name} as string),'unknown_') end ;; }

  parameter: bm_admission_quarter { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_admission_quarter_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_admission_quarter %} = 'out' then 'x' else coalesce(safe_cast(${admission_date_quarter} as string),'unknown_') end ;; }

  parameter: bm_service_line { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_service_line_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_service_line %} = 'out' then 'x' else coalesce(safe_cast(${esl_level_2_desc} as string),'unknown_') end ;; }

  parameter: bm_subservice_line { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_subservice_line_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_subservice_line %} = 'out' then 'x' else coalesce(safe_cast(${esl_level_3_desc} as string),'unknown_') end ;; }

  parameter: bm_financial_class { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_financial_class_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_financial_class %} = 'out' then 'x' else coalesce(safe_cast(${financial_class_code} as string),'unknown_') end ;; }

  parameter: bm_major_payor { view_label: "Z - BM Demo" type: string default_value: "out" allowed_value: {label: "In" value: "in"} allowed_value: {label: "Out" value: "out"} }
  dimension: bm_major_payor_value {hidden: yes view_label: "Z - BM Demo" type: string sql: case when {% parameter bm_major_payor %} = 'out' then 'x' else coalesce(safe_cast(${major_payor_group_desc} as string),'unknown_') end ;; }

  dimension: bm_combined {
    view_label: "Z - BM Demo"
    type: string
    sql: ${bm_division_value} || '-' || ${bm_market_value} || '-' || ${bm_admission_quarter_value} || '-' || ${bm_service_line_value} || '-' || ${bm_subservice_line_value} || '-' || ${bm_financial_class_value} || '-' || ${bm_major_payor_value} ;;
  }

## Step 2: Create measures - actual, exp, abs diff, % diff
  parameter: kpi_selector {
    view_label: "Z - BM Demo"
    type: unquoted
    default_value: "happy_path"
    allowed_value: {label: "% Happy Path" value: "percent_happy_path"}
    allowed_value: {label: "% Paid in Full" value: "percent_paid_in_full"}
    allowed_value: {label: "% Denied" value: "percent_denied"}
    allowed_value: {label: "% Timely Payback" value: "percent_timely_payback"}
  }
  measure: bm_kpi_actual {
    view_label: "Z - BM Demo"
    type: number
    sql:
        {% if    kpi_selector._parameter_value == 'percent_happy_path' %}            ${percent_happy_path}
        {% elsif kpi_selector._parameter_value == 'percent_paid_in_full' %}       ${percent_paid_in_full}
        {% elsif kpi_selector._parameter_value == 'percent_denied' %}     ${percent_denied}
        {% elsif kpi_selector._parameter_value == 'percent_timely_payback' %} ${percent_timely_payback}
        {% else %}                                                            ${percent_happy_path}
        {% endif %}
      ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: bm_kpi_expected {
    view_label: "Z - BM Demo"
    type: average
    sql: ${benchmark_table_irc.bm_kpi_expected} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }
  measure: bm_kpi_actual_vs_expected_abs {
    view_label: "Z - BM Demo"
    type: number
    sql: ${bm_kpi_actual} - ${bm_kpi_expected} ;;
    value_format_name: percent_1
    html:
      <a href="#drillmenu" target="_self">
        {{ rendered_value }} ({{ bm_kpi_actual._rendered_value }} vs {{ bm_kpi_expected._rendered_value }})
      </a>
    ;;
    drill_fields: [drill*]
  }
  measure: bm_kpi_actual_vs_expected_perc {
    view_label: "Z - BM Demo"
    type: number
    sql: ${bm_kpi_actual_vs_expected_abs} / nullif(${bm_kpi_actual},0) ;;
    value_format_name: percent_1
    html:
      <a href="#drillmenu" target="_self">
      {{ rendered_value }} ({{ bm_kpi_actual._rendered_value }} vs {{ bm_kpi_expected._rendered_value }})
      </a>
    ;;
    drill_fields: [drill*]
  }

## Step 3: Calculate size of cohorts
  dimension: x {
    view_label: "Z - BM Demo"
    type: string
    sql: 'x' ;;
  }
  dimension: cohort_size {
    hidden: yes
    type: number
    sql: ${benchmark_table_irc.count} ;;
  }
  measure: cohort_size_05 {
    view_label: "Z - BM Demo"
    type: percentile
    sql: ${cohort_size} ;;
    percentile: 5
  }
  measure: cohort_size_25 {
    view_label: "Z - BM Demo"
    type: percentile
    sql: ${cohort_size} ;;
    percentile: 25
  }
  measure: cohort_size_50 {
    view_label: "Z - BM Demo"
    type: percentile
    sql: ${cohort_size} ;;
    percentile: 50
  }
  measure: cohort_size_75 {
    view_label: "Z - BM Demo"
    type: percentile
    sql: ${cohort_size} ;;
    percentile: 75
  }
  measure: cohort_size_95 {
    view_label: "Z - BM Demo"
    type: percentile
    sql: ${cohort_size} ;;
    percentile: 95
  }

## Step 4: Over & Under Performer
  dimension: over_under_performer {
    view_label: "Z - BM Demo"
    type: string
    sql:
    {% if    kpi_selector._parameter_value == 'percent_happy_path' %}     case when ${benchmark_table_irc_over_under.bm_kpi_actual} > ${benchmark_table_irc_over_under.bm_kpi_expected} then 'Over' else 'Under' end
    {% elsif kpi_selector._parameter_value == 'percent_paid_in_full' %}   case when ${benchmark_table_irc_over_under.bm_kpi_actual} > ${benchmark_table_irc_over_under.bm_kpi_expected} then 'Over' else 'Under' end
    {% elsif kpi_selector._parameter_value == 'percent_denied' %}         case when ${benchmark_table_irc_over_under.bm_kpi_actual} < ${benchmark_table_irc_over_under.bm_kpi_expected} then 'Over' else 'Under' end
    {% elsif kpi_selector._parameter_value == 'percent_timely_payback' %} case when ${benchmark_table_irc_over_under.bm_kpi_actual} > ${benchmark_table_irc_over_under.bm_kpi_expected} then 'Over' else 'Under' end
    {% else %}                                                                    case when ${benchmark_table_irc_over_under.bm_kpi_actual} > ${benchmark_table_irc_over_under.bm_kpi_expected} then 'Over' else 'Under' end
    {% endif %}
    ;;
  }
}

# view: irc_poc__npi {
#   dimension: admitting_practitioner_npi {
#     group_label: "NPI"
#     type: string
#     sql: Admitting_Practitioner_NPI ;;
#   }

#   dimension: attending_practitioner_npi {
#     group_label: "NPI"
#     type: string
#     sql: Attending_Practitioner_NPI ;;
#   }

#   dimension: irc_poc__npi {
#     type: string
#     hidden: yes
#     sql: irc_poc__npi ;;
#   }

#   dimension: consulting_practitioner_npi {
#     group_label: "NPI"
#     type: string
#     sql: Consulting_Practitioner_NPI ;;
#   }

#   dimension: referring_practitioner_npi {
#     group_label: "NPI"
#     type: string
#     sql: Referring_Practitioner_NPI ;;
#   }
# }

view: irc_poc__proc_code {

  dimension: irc_poc__proc_code {
    type: string
    hidden: yes
    sql: irc_poc__proc_code ;;
  }

  dimension: proc_code {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.Procedure_Code ;;
  }

  dimension: proc_type_code {
    group_label: "Clinical"
    type: number
    sql: ${TABLE}.Procedure_Type_Code ;;
  }

  dimension: proc_description {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.Procedure_Desc ;;
  }
}

view: irc_poc__diag_code {

  dimension: irc_poc__diag_code {
    type: string
    hidden: yes
    sql: irc_poc__diag_code ;;
  }

  dimension: diag_code {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.diag_Code ;;
  }

  dimension: diag_description {
    group_label: "Clinical"
    type: string
    sql: ${TABLE}.description ;;
  }
}

# view: irc_poc__status_by_day {
#   dimension: irc_poc__status_by_day {
#     type: string
#     hidden: yes
#     sql: irc_poc__status_by_day ;;
#   }

#   dimension: days_since_arrival {
#     group_label: "Status"
#     type: number
#     sql: ${TABLE}.days_since_arrival ;;
#   }

#   # dimension: status_billing {
#   #   group_label: "Status"
#   #   type: string
#   #   sql: status_billing ;;
#   # }

#   # dimension: status_clinical {
#   #   group_label: "Status"
#   #   type: string
#   #   sql: status_clinical ;;
#   # }

#   # dimension: status_denial {
#   #   group_label: "Status"
#   #   type: string
#   #   sql: status_denial ;;
#   # }

#   # dimension: status_p2p {
#   #   group_label: "Status"
#   #   type: string
#   #   sql: status_p2p ;;
#   # }

#   # parameter: status_selector {
#   #   group_label: "Status"
#   #   type: unquoted
#   #   default_value: "billing"
#   #   allowed_value: {label: "Billing" value: "billing"}
#   #   allowed_value: {label: "Clinical" value: "clinical"}
#   #   allowed_value: {label: "Denial" value: "denial"}
#   #   allowed_value: {label: "P2P" value: "p2p"}
#   # }

#   # dimension: status_dynamic {
#   #   group_label: "Status"
#   #   type: string
#   #   sql:
#   #     {% if    status_selector._parameter_value == 'billing' %}   ${status_billing}
#   #     {% elsif status_selector._parameter_value == 'clinical' %}  ${status_clinical}
#   #     {% elsif status_selector._parameter_value == 'denial' %}    ${status_denial}
#   #     {% elsif status_selector._parameter_value == 'p2p' %}       ${status_p2p}
#   #     {% else %}                                                  ${status_billing}
#   #     {% endif %}
#   #   ;;
#   # }

#   dimension: paid_in_full_lk {
#     group_label: "Status"
#     type: yesno
#     sql: ${days_since_arrival} >= ${irc_poc.days_full_payment} ;;
#   }

#   dimension: denied_lk {
#     group_label: "Status"
#     type: yesno
#     sql: ${days_since_arrival} >= ${irc_poc.days_denial} ;;
#   }

#   dimension: timely_payment_lk {
#     group_label: "Status"
#     type: yesno
#     sql: ${days_since_arrival} >= ${irc_poc.days_timely_payment} ;;
#   }

#   dimension: paid_in_full {
#     hidden: yes
#     group_label: "Status"
#     type: yesno
#   }

#   dimension: denied {
#     hidden: yes
#     group_label: "Status"
#     type: yesno
#   }

#   dimension: timely_payment {
#     hidden: yes
#     group_label: "Status"
#     type: yesno
#   }
#   dimension: is_paid_in_full_num {
#     hidden: yes
#     type: number
#     sql: case when ${paid_in_full_lk} then 1 else 0 end ;;
#   }
#   dimension: is_denied_num {
#     hidden: yes
#     type: number
#     sql: case when ${denied_lk} then 0 else 1 end ;;
#   }
#   dimension: is_timely_payment_num {
#     hidden: yes
#     type: number
#     sql: case when ${timely_payment_lk} then 1 else 0 end ;;
#   }
#   dimension: status_happy_path {
#     group_label: "Status"
#     type: string
#     sql:
#       case
#         when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '8 Happy Path'
#         when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '7 Not Timely'
#         when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '6 Not Paid in Full'
#         when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '5 Not Paid in Full, Not Timely'
#         when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '4 Denied'
#         when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '3 Denied, Not Timely'
#         when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '2 Denied, Not Paid in Full'
#         when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '1 Denied, Not Paid in Full, Not Timely'
#         else '0 Unknown'
#       end
#     ;;
#   }


# }

view: irc_poc__status_by_day {
#   sql_table_name: `hca-sandbox-aaron-argolis.irc.bm_pre_combined_every_distinct_value_365_array`
#     ;;

dimension: irc_poc__status_by_day {
  type: string
  hidden: yes
  sql: irc_poc__status_by_day ;;
}

dimension: days_since_arrival {
  group_label: "Status by Day"
  type: number
  sql: ${TABLE}.days_since_arrival ;;
}

dimension: paid_in_full_lk {
  hidden: yes
  type: yesno
  # sql: ${days_since_arrival} >= ${irc_poc.days_full_payment} ;;
}
dimension: denied_lk {
  hidden: yes
  type: yesno
  # sql: ${days_since_arrival} >= ${irc_poc.days_denial} ;;
}
dimension: timely_payment_lk {
  hidden: yes
  type: yesno
  # sql: ${days_since_arrival} >= ${irc_poc.days_timely_payment} ;;
}
dimension: is_paid_in_full_num {
  hidden: yes
  type: number
  sql: case when ${paid_in_full_lk} then 1 else 0 end ;;
}
dimension: is_denied_num {
  hidden: yes
  type: number
  sql: case when ${denied_lk} then 1 else 0 end ;;
}
dimension: is_timely_payment_num {
  hidden: yes
  type: number
  sql: case when ${timely_payment_lk} then 1 else 0 end ;;
}
dimension: status_happy_path {
  hidden: yes
  type: string
  sql:
      case
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '8 Happy Path'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '7 Not Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 0 then '6 Not Paid in Full'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 0 then '5 Not Paid in Full, Not Timely'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '4 Denied'
        when ${is_paid_in_full_num} = 1 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '3 Denied, Not Timely'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 1 and ${is_denied_num} = 1 then '2 Denied, Not Paid in Full'
        when ${is_paid_in_full_num} = 0 and ${is_timely_payment_num} = 0 and ${is_denied_num} = 1 then '1 Denied, Not Paid in Full, Not Timely'
        else '0 Unknown'
      end
    ;;
}

dimension: days_since_arrival_05 {
  group_label: "Status by Day"
  type: number
  sql: round(${days_since_arrival} / 5,0) * 5 ;;
}

dimension: days_since_arrival_10 {
  group_label: "Status by Day"
  type: number
  sql: round(${days_since_arrival} / 10,0) * 10 ;;
}

dimension: days_since_arrival_25 {
  group_label: "Status by Day"
  type: number
  sql: round(${days_since_arrival} / 25,0) * 25 ;;
}

parameter: days_since_arrival_selector {
  group_label: "Status by Day"
  type: unquoted
  default_value: "daily"
  allowed_value: { label: "Daily" value: "daily"}
  allowed_value: { label: "Every 5 Days" value: "every_5"}
  allowed_value: { label: "Every 10 Days" value: "every_10"}
  allowed_value: { label: "Every 25 Days" value: "every_25"}
}

dimension: days_since_arrival_dynamic {
  group_label: "Status by Day"
  type: number
  sql:
    {% if    days_since_arrival_selector._parameter_value == 'daily' %}    ${days_since_arrival}
    {% elsif days_since_arrival_selector._parameter_value == 'every_5' %}  ${days_since_arrival_05}
    {% elsif days_since_arrival_selector._parameter_value == 'every_10' %} ${days_since_arrival_10}
    {% elsif days_since_arrival_selector._parameter_value == 'every_25' %} ${days_since_arrival_25}
    {% else %}                                                             ${days_since_arrival}
    {% endif %}
    ;;
}
}


view: irc_poc__appeal_detail {
  dimension: appeal_code {
    group_label: "Denial"
    type: string
    sql: appeal_code ;;
  }

  dimension: appeal_code_child {
    group_label: "Denial"
    type: string
    sql: appeal_code_child ;;
  }

  dimension: appeal_code_parent {
    group_label: "Denial"
    type: string
    sql: appeal_code_parent ;;
  }

  dimension: appeal_code_sid {
    group_label: "Denial"
    type: number
    value_format_name: id
    sql: Appeal_Code_Sid ;;
  }

  dimension: irc_poc__appeal_detail {
    type: string
    hidden: yes
    sql: irc_poc__appeal_detail ;;
  }

  dimension: is_min_date {
    group_label: "Denial"
    type: yesno
    sql: is_min_date ;;
  }

  dimension: date_sid {
    group_label: "Denial"
    type: number
    sql: date_sid ;;
  }
}

#### Benchmark corresponds to the seoncd benchmark dashboard

view: benchmark_table_irc {
  derived_table: {
    explore_source: irc_poc {
      bind_all_filters: yes
      column: bm_combined {}
      column: bm_kpi_actual {}
      column: count {}
    }
  }
  dimension: bm_combined {
    primary_key: yes
    type: string
    hidden: yes
  }
  dimension: bm_kpi_expected {
    hidden: yes
    type: number
    sql: ${TABLE}.bm_kpi_actual ;;
  }
  dimension: count {
    hidden: yes
    type: number
  }
}

view: benchmark_table_irc_over_under {
  derived_table: {
    explore_source: irc_poc {
      bind_all_filters: yes
      column: dim_dynamic {}
      column: bm_kpi_actual {}
      column: bm_kpi_expected {}
    }
  }
  dimension: dim_dynamic {
    primary_key: yes
    hidden: yes
  }
  dimension: bm_kpi_actual {
    hidden: yes
    type: number
  }
  dimension: bm_kpi_expected {
    hidden: yes
    type: number
  }
}


# view: status_by_day_happy_path {
#   derived_table: {
#     persist_for: "24 hours"
#     explore_source: irc_poc {
#       column: days_since_arrival { field: irc_poc__status_by_day.days_since_arrival }
#       column: status_happy_path { field: irc_poc__status_by_day.status_happy_path }
#       column: encounter_id_txt {}
#       column: coid {}
#     }
#   }
#   dimension: pk {
#     primary_key: yes
#     hidden: yes
#     type: string
#     sql: ${encounter_id_txt} || '|' || ${coid} ;;
#   }
#   dimension: days_since_arrival {
#     group_label: "Status by Day"
#     type: number
#   }
#   dimension: status_happy_path {
#     group_label: "Status by Day"
#   }
#   dimension: encounter_id_txt {
#     hidden: yes
#   }
#   dimension: coid {
#     hidden: yes
#     type: number
#   }
#   dimension: days_since_arrival_05 {
#     group_label: "Status by Day"
#     type: number
#     sql: round(${days_since_arrival} / 5,0) * 5 ;;
#   }

#   dimension: days_since_arrival_10 {
#     group_label: "Status by Day"
#     type: number
#     sql: round(${days_since_arrival} / 10,0) * 10 ;;
#   }

#   dimension: days_since_arrival_25 {
#     group_label: "Status by Day"
#     type: number
#     sql: round(${days_since_arrival} / 25,0) * 25 ;;
#   }

#   parameter: days_since_arrival_selector {
#     group_label: "Status by Day"
#     type: unquoted
#     default_value: "daily"
#     allowed_value: { label: "Daily" value: "daily"}
#     allowed_value: { label: "Every 5 Days" value: "every_5"}
#     allowed_value: { label: "Every 10 Days" value: "every_10"}
#     allowed_value: { label: "Every 25 Days" value: "every_25"}
#   }

#   dimension: days_since_arrival_dynamic {
#     group_label: "Status by Day"
#     type: number
#     sql:
#     {% if    days_since_arrival_selector._parameter_value == 'daily' %}    ${days_since_arrival}
#     {% elsif days_since_arrival_selector._parameter_value == 'every_5' %}  ${days_since_arrival_05}
#     {% elsif days_since_arrival_selector._parameter_value == 'every_10' %} ${days_since_arrival_10}
#     {% elsif days_since_arrival_selector._parameter_value == 'every_25' %} ${days_since_arrival_25}
#     {% else %}                                                             ${days_since_arrival}
#     {% endif %}
#     ;;
#   }
# }



# ### Happy Score
# dimension: percent_paidback_dim {
#   group_label: "Happy Score"
#   type: number
#   sql: coalesce(${total_payments} / nullif(${total_billed_charges},0),0) ;;
#   value_format_name: decimal_1
# }
# dimension: percent_non_denial_dim {
#   group_label: "Happy Score"
#   type: number
#   sql: case when ${first_denial_raw} is null then 1 else 0 end ;;
#   value_format_name: decimal_1
# }
# dimension: percent_timely_payment_dim {
#   group_label: "Happy Score"
#   type: number
#   sql:
#       case
#         when ${days_discharge_payment} is null then 0
#         when ${days_discharge_payment} < 0 then 1
#         when ${days_discharge_payment} > 300 then 0
#         else (300 - ${days_discharge_payment})/300
#       end
#     ;;
#   value_format_name: decimal_1
# }

# measure: sum_payments {
#   type: sum
#   sql: ${total_payments} ;;
#   value_format_name: usd_0
# }
# measure: sum_owed {
#   type: sum
#   sql: ${total_billed_charges} ;;
#   value_format_name: usd_0
# }
# measure: average_days_discharge_payment {
#   type: average
#   sql: ${days_discharge_payment} ;;
#   value_format_name: decimal_1
# }
