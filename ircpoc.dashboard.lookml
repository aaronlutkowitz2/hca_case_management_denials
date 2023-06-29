- dashboard: 1__happy_path_investigation
  title: 1 - Happy Path Investigation
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: btTPFisMGEtLGfXaf0fusD
  elements:
  - title: Encounters
    name: Encounters
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of Patient Encounters
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Happy Path by Day, First 100 Days after Arrival
    name: Happy Path by Day, First 100 Days after Arrival
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [irc_poc.count, irc_poc__status_by_day.status_happy_path, irc_poc__status_by_day.days_since_arrival]
    pivots: [irc_poc__status_by_day.status_happy_path]
    filters:
      irc_poc__status_by_day.days_since_arrival: "<100"
    sorts: [irc_poc__status_by_day.status_happy_path, irc_poc__status_by_day.days_since_arrival]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 5052183a-7510-8587-4c2d-56d238e9c203
        label: Custom
        type: discrete
        colors:
        - "#2E7F18"
        - "#2dc937"
        - "#99c140"
        - "#EFB700"
        - "#e7b416"
        - "#db7b2b"
        - "#cc3232"
        - "#B81D13"
      options:
        steps: 5
        reverse: true
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 38
    col: 0
    width: 24
    height: 11
  - title: "% Happy Path"
    name: "% Happy Path"
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.percent_happy_path]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 49
    col: 0
    width: 4
    height: 2
  - title: Happy Path by Financial Class
    name: Happy Path by Financial Class
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [irc_poc.count, irc_poc.status_happy_path, irc_poc.financial_class_code_text,
      irc_poc.percent_happy_path]
    pivots: [irc_poc.status_happy_path]
    sorts: [irc_poc.status_happy_path, irc_poc.percent_happy_path desc 8]
    limit: 500
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 8593dac6-6062-1eaf-57bc-af642881063e
        label: Custom
        type: discrete
        colors:
        - "#B81D13"
        - "#cc3232"
        - "#db7b2b"
        - "#2dc937"
        - "#2E7F18"
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: irc_poc.percent_happy_path,
            id: irc_poc.percent_happy_path, name: Percent Happy Path}, {axisId: irc_poc.percent_paid_in_full,
            id: irc_poc.percent_paid_in_full, name: Percent Paid In Full}, {axisId: irc_poc.percent_timely_payback,
            id: irc_poc.percent_timely_payback, name: Percent Timely Payback}, {axisId: irc_poc.percent_denied,
            id: irc_poc.percent_denied, name: Percent Denied}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: irc_poc.count,
            id: irc_poc.count, name: "# Encounters"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    hidden_pivots:
      6 Not Paid in Full:
        measure_names:
        - irc_poc.percent_happy_path
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [irc_poc.percent_happy_path]
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 14
    col: 0
    width: 8
    height: 10
  - title: "% Happy Path, Map"
    name: "% Happy Path, Map"
    model: irc-initial-model
    explore: irc_poc
    type: looker_map
    fields: [irc_poc.location, irc_poc.division_name, irc_poc.market_name, irc_poc.facility_name,
      irc_poc.percent_happy_path]
    filters:
      irc_poc.coid: not 30201
      irc_poc.count: ">100"
    sorts: [irc_poc.percent_happy_path desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    map_marker_radius_fixed: 6
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 221dd9c5-819c-8f23-0f51-46c7ac061c1d
        label: Custom
        type: discrete
        colors:
        - "#2E7F18"
        - "#2dc937"
        - "#99c140"
        - "#EFB700"
        - "#e7b416"
        - "#db7b2b"
        - "#cc3232"
        - "#B81D13"
        - grey
      options:
        steps: 5
        reverse: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 49
    col: 4
    width: 18
    height: 6
  - title: Happy Path
    name: Happy Path
    model: irc-initial-model
    explore: irc_poc
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [irc_poc.count, irc_poc.denial_reason_text, irc_poc.denial_concurrent_vs_post,
      irc_poc.p2p_type, irc_poc.status_timely_paid_in_full, irc_poc.sankey_sort]
    sorts: [irc_poc.sankey_sort desc]
    limit: 500
    column_limit: 50
    hidden_fields: [irc_poc.sankey_sort]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#1A73E8", "#12B5CB", "#E52592", "#E8710A", "#F9AB00", "#7CB342",
      "#9334E6", "#80868B", "#079c98", "#A8A116", "#EA4335", "#FF8168"]
    label_type: name
    show_null_points: true
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 221dd9c5-819c-8f23-0f51-46c7ac061c1d
        label: Custom
        type: discrete
        colors:
        - "#2E7F18"
        - "#2dc937"
        - "#99c140"
        - "#EFB700"
        - "#e7b416"
        - "#db7b2b"
        - "#cc3232"
        - "#B81D13"
        - grey
      options:
        steps: 5
        reverse: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    interpolation: linear
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 24
    col: 0
    width: 24
    height: 14
  - title: Happy Path by Division
    name: Happy Path by Division
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [irc_poc.count, irc_poc.status_happy_path, irc_poc.division_name, irc_poc.percent_happy_path]
    pivots: [irc_poc.status_happy_path]
    sorts: [irc_poc.status_happy_path, irc_poc.percent_happy_path desc 8]
    limit: 500
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 8593dac6-6062-1eaf-57bc-af642881063e
        label: Custom
        type: discrete
        colors:
        - "#B81D13"
        - "#cc3232"
        - "#db7b2b"
        - "#2dc937"
        - "#2E7F18"
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: irc_poc.percent_happy_path,
            id: irc_poc.percent_happy_path, name: Percent Happy Path}, {axisId: irc_poc.percent_paid_in_full,
            id: irc_poc.percent_paid_in_full, name: Percent Paid In Full}, {axisId: irc_poc.percent_timely_payback,
            id: irc_poc.percent_timely_payback, name: Percent Timely Payback}, {axisId: irc_poc.percent_denied,
            id: irc_poc.percent_denied, name: Percent Denied}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: irc_poc.count,
            id: irc_poc.count, name: "# Encounters"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    hidden_pivots:
      7 Not Timely:
        measure_names:
        - irc_poc.percent_happy_path
      8 Happy Path:
        is_entire_pivot_hidden: false
        measure_names:
        - irc_poc.percent_happy_path
      undefined:
        is_entire_pivot_hidden: true
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [irc_poc.percent_happy_path]
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 14
    col: 8
    width: 8
    height: 10
  - title: Happy Path by Service Line
    name: Happy Path by Service Line
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [irc_poc.count, irc_poc.status_happy_path, irc_poc.esl_level_2_desc, irc_poc.percent_happy_path]
    pivots: [irc_poc.status_happy_path]
    sorts: [irc_poc.status_happy_path, irc_poc.percent_happy_path desc 8]
    limit: 500
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 8593dac6-6062-1eaf-57bc-af642881063e
        label: Custom
        type: discrete
        colors:
        - "#B81D13"
        - "#cc3232"
        - "#db7b2b"
        - "#2dc937"
        - "#2E7F18"
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: irc_poc.percent_happy_path,
            id: irc_poc.percent_happy_path, name: Percent Happy Path}, {axisId: irc_poc.percent_paid_in_full,
            id: irc_poc.percent_paid_in_full, name: Percent Paid In Full}, {axisId: irc_poc.percent_timely_payback,
            id: irc_poc.percent_timely_payback, name: Percent Timely Payback}, {axisId: irc_poc.percent_denied,
            id: irc_poc.percent_denied, name: Percent Denied}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: irc_poc.count,
            id: irc_poc.count, name: "# Encounters"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    hidden_pivots:
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [irc_poc.percent_happy_path]
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      'Financial Class ': irc_poc.financial_class
      Date Admission Date: irc_poc.admission_date_date
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 14
    col: 16
    width: 8
    height: 10
  - title: Write Off
    name: Write Off
    model: irc-initial-model
    explore: bm_pre_write_offs
    type: single_value
    fields: [bm_pre_write_offs.sum_write_off_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    show_view_names: false
    listen:
      Date Admission Date: bm_pre_write_offs.admission_date_date
    row: 0
    col: 14
    width: 4
    height: 2
  - title: All Days Authorization
    name: All Days Authorization
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.All_Day_Authr_Ind_Sum]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 0
    col: 4
    width: 5
    height: 2
  - title: Authorization Not Required
    name: Authorization Not Required
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Authr_Not_Required_Ind_Sum]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 2
    col: 14
    width: 4
    height: 2
  - title: Authorization Post Discharge  Received
    name: Authorization Post Discharge  Received
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Authorization_Post_Discharge_Received, irc_poc.auth_code]
    filters:
      irc_poc.auth_code: "-%^ %,-%/X%,-%/E%,-%/O%,-%/SOI%,-%/V%,-%/B%,-%PEN%,-%DEN%,-NULL"
    sorts: [irc_poc.Authorization_Post_Discharge_Received desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 0
    col: 18
    width: 6
    height: 2
  - title: IPlan Change
    name: IPlan Change
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [iplanderivedtable.Iplan_Change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 2
    col: 4
    width: 5
    height: 2
  - title: Encounters by Happy Path Status
    name: Encounters by Happy Path Status
    model: irc-initial-model
    explore: irc_poc
    type: looker_bar
    fields: [happy_path_status_helper.irc_poc_status_happy_path, irc_poc.count]
    pivots: [happy_path_status_helper.irc_poc_status_happy_path]
    sorts: [happy_path_status_helper.irc_poc_status_happy_path]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 8
    col: 0
    width: 24
    height: 6
  - title: Admission Status Change
    name: Admission Status Change
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.admission_type_change_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 0
    col: 9
    width: 5
    height: 2
  - title: Authorization Required
    name: Authorization Required
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Authr_Required_Ind_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 2
    col: 9
    width: 5
    height: 2
  - title: Nursing Reconsideration Successful
    name: Nursing Reconsideration Successful
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Nursing_Reconsideration_Successful_Ind_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 2
    col: 18
    width: 6
    height: 2
  - title: Interqual  Met
    name: Interqual  Met
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Interqual_Met_Ind_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 2
    col: 0
    width: 4
    height: 2
  - title: Timely NOA
    name: Timely NOA
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.capture_date_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 4
    col: 0
    width: 4
    height: 2
  - title: Payer Non Response Letter On Account
    name: Payer Non Response Letter On Account
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.Payer_non_response_letter_acct_ind]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 4
    col: 4
    width: 6
    height: 2
  - title: Paid in Full
    name: Paid in Full
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.paid_in_full_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 6
    col: 0
    width: 4
    height: 2
  - title: Billed with All Days Auth
    name: Billed with All Days Auth
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.billed_with_all_days_auth]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 4
    col: 10
    width: 5
    height: 2
  - title: Billed with Partial Days Auth
    name: Billed with Partial Days Auth
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.billed_with_partial_days_auth]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 4
    col: 15
    width: 5
    height: 2
  - title: Billed without Auth
    name: Billed without Auth
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.billed_without_auth]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 4
    col: 20
    width: 4
    height: 2
  - title: Severity of Illness (2)
    name: Severity of Illness (2)
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.apr_severity_of_illness_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 6
    col: 4
    width: 4
    height: 2
  - title: Final denial process in 30 days
    name: Final denial process in 30 days
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [irc_poc.final_denial_process_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Admission Date: irc_poc.admission_date_date
      'Financial Class ': irc_poc.financial_class
      Major Payer Group Desc: irc_poc.major_payor_group_desc
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Status Happy Path: irc_poc.status_happy_path
      Inpatient-Outpatient: irc_poc.admission_type
      Appeal Overturned (Yes / No): irc_poc.is_appeal_overturned
      P2P Overturned (Yes / No): irc_poc.is_p2p_overturned
      Appeal Level 01 (Yes / No): irc_poc.is_appeal_level_num_1
      Appeal Level 02 (Yes / No): irc_poc.is_appeal_level_num_2
      Paid In Full (Yes / No): irc_poc.paid_in_full
      Discharge Date: irc_poc.discharge_date_date
      Severity of Illness: irc_poc.apr_severity_of_illness
    row: 6
    col: 8
    width: 5
    height: 2
  filters:
  - name: Date Admission Date
    title: Date Admission Date
    type: field_filter
    default_value: '2021'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.admission_date_date
  - name: Discharge Date
    title: Discharge Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.discharge_date_date
  - name: 'Financial Class '
    title: 'Financial Class '
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.financial_class
  - name: Major Payer Group Desc
    title: Major Payer Group Desc
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.major_payor_group_desc
  - name: 2 Group
    title: 2 Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.group_name
  - name: 3 Division
    title: 3 Division
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.division_name
  - name: 4 Market
    title: 4 Market
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.market_name
  - name: 5 Facility Name
    title: 5 Facility Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.facility_name
  - name: L2 Service Line
    title: L2 Service Line
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_2_desc
  - name: L3 DRG Superfamily
    title: L3 DRG Superfamily
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_3_desc
  - name: L4 DRG Family
    title: L4 DRG Family
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_4_desc
  - name: L5 DRG Name
    title: L5 DRG Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_5_desc
  - name: Status Happy Path
    title: Status Happy Path
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.status_happy_path
  - name: Inpatient-Outpatient
    title: Inpatient-Outpatient
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.admission_type
  - name: Appeal Overturned (Yes / No)
    title: Appeal Overturned (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.is_appeal_overturned
  - name: P2P Overturned (Yes / No)
    title: P2P Overturned (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.is_p2p_overturned
  - name: Appeal Level 01 (Yes / No)
    title: Appeal Level 01 (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.is_appeal_level_num_1
  - name: Appeal Level 02 (Yes / No)
    title: Appeal Level 02 (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.is_appeal_level_num_2
  - name: Paid In Full (Yes / No)
    title: Paid In Full (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.paid_in_full
  - name: Severity of Illness
    title: Severity of Illness
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.apr_severity_of_illness


- dashboard: 2__benchmark_exercise
  title: 2 - Benchmark Exercise
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GBECOXPImIp8j2eynpheFq
  elements:
  - title: "# Encounters in Benchmark"
    name: "# Encounters in Benchmark"
    model: irc-initial-model
    explore: irc_poc
    type: looker_boxplot
    fields: [irc_poc.dim_dynamic, irc_poc.cohort_size_05, irc_poc.cohort_size_25,
      irc_poc.cohort_size_50, irc_poc.cohort_size_75, irc_poc.cohort_size_95]
    filters:
      irc_poc.count: ">100"
    sorts: [irc_poc.dim_dynamic desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    y_axis_value_format: "#"
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      Date Admission Date: irc_poc.admission_date_date
      Financial Class Code: irc_poc.financial_class_code
      Major Payor Group Desc: irc_poc.major_payor_group_desc
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Dim Selector: irc_poc.dim_selector
      Kpi Selector: irc_poc.kpi_selector
      BM Financial Class: irc_poc.bm_financial_class
      BM Division: irc_poc.bm_division
      BM Adm Qtr: irc_poc.bm_admission_quarter
      BM Major Payor: irc_poc.bm_major_payor
      BM Market: irc_poc.bm_market
      BM Service Line: irc_poc.bm_service_line
      BM Subservice Line: irc_poc.bm_subservice_line
    row: 0
    col: 0
    width: 11
    height: 11
  - title: Performance vs Benchmark
    name: Performance vs Benchmark
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [irc_poc.bm_kpi_actual_vs_expected_abs, irc_poc.dim_dynamic, irc_poc.over_under_performer]
    pivots: [irc_poc.over_under_performer]
    filters:
      irc_poc.count: ">100"
      irc_poc.dim_dynamic: "-NULL"
    sorts: [irc_poc.over_under_performer, irc_poc.bm_kpi_actual_vs_expected_abs desc
        0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      Over - irc_poc.bm_kpi_actual_vs_expected_abs: "#7CB342"
      Under - irc_poc.bm_kpi_actual_vs_expected_abs: "#EA4335"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      2 Group: irc_poc.group_name
      3 Division: irc_poc.division_name
      4 Market: irc_poc.market_name
      5 Facility Name: irc_poc.facility_name
      Date Admission Date: irc_poc.admission_date_date
      Financial Class Code: irc_poc.financial_class_code
      Major Payor Group Desc: irc_poc.major_payor_group_desc
      L2 Service Line: irc_poc.esl_level_2_desc
      L3 DRG Superfamily: irc_poc.esl_level_3_desc
      L4 DRG Family: irc_poc.esl_level_4_desc
      L5 DRG Name: irc_poc.esl_level_5_desc
      Dim Selector: irc_poc.dim_selector
      Kpi Selector: irc_poc.kpi_selector
      BM Financial Class: irc_poc.bm_financial_class
      BM Division: irc_poc.bm_division
      BM Adm Qtr: irc_poc.bm_admission_quarter
      BM Major Payor: irc_poc.bm_major_payor
      BM Market: irc_poc.bm_market
      BM Service Line: irc_poc.bm_service_line
      BM Subservice Line: irc_poc.bm_subservice_line
    row: 0
    col: 11
    width: 13
    height: 11
  filters:
  - name: Dim Selector
    title: Dim Selector
    type: field_filter
    default_value: financial^_class
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.dim_selector
  - name: Kpi Selector
    title: Kpi Selector
    type: field_filter
    default_value: percent^_happy^_path
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.kpi_selector
  - name: Date Admission Date
    title: Date Admission Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.admission_date_date
  - name: Financial Class Code
    title: Financial Class Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.financial_class_code
  - name: Major Payor Group Desc
    title: Major Payor Group Desc
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.major_payor_group_desc
  - name: 2 Group
    title: 2 Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.group_name
  - name: 3 Division
    title: 3 Division
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.division_name
  - name: 4 Market
    title: 4 Market
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.market_name
  - name: 5 Facility Name
    title: 5 Facility Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.facility_name
  - name: L2 Service Line
    title: L2 Service Line
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_2_desc
  - name: L3 DRG Superfamily
    title: L3 DRG Superfamily
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_3_desc
  - name: L4 DRG Family
    title: L4 DRG Family
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_4_desc
  - name: L5 DRG Name
    title: L5 DRG Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.esl_level_5_desc
  - name: BM Adm Qtr
    title: BM Adm Qtr
    type: field_filter
    default_value: in
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_admission_quarter
  - name: BM Division
    title: BM Division
    type: field_filter
    default_value: in
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_division
  - name: BM Financial Class
    title: BM Financial Class
    type: field_filter
    default_value: out
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_financial_class
  - name: BM Major Payor
    title: BM Major Payor
    type: field_filter
    default_value: out
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_major_payor
  - name: BM Market
    title: BM Market
    type: field_filter
    default_value: in
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_market
  - name: BM Service Line
    title: BM Service Line
    type: field_filter
    default_value: in
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_service_line
  - name: BM Subservice Line
    title: BM Subservice Line
    type: field_filter
    default_value: in
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: irc_poc.bm_subservice_line
- dashboard: 3__data_science
  title: 3 - Data Science
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: f80ze6kWxk4zQDsKobqjXS
  elements:
  - title: Actual vs Predicted Performance
    name: Actual vs Predicted Performance
    model: irc-initial-model
    explore: irc_poc
    type: looker_line
    fields: [combined_predictions.predicted_10, combined_predictions.average_actual,
      combined_predictions.average_predicted]
    filters:
      combined_predictions.count: ">5"
    sorts: [combined_predictions.average_actual desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 0
    col: 8
    width: 8
    height: 13
  - title: True Positive
    name: True Positive
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [combined_predictions.percent_total, combined_predictions.is_actual, combined_predictions.is_predicted]
    filters:
      combined_predictions.is_actual: 'Yes'
      combined_predictions.is_predicted: 'Yes'
    sorts: [combined_predictions.percent_total desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 4
    col: 2
    width: 3
    height: 4
  - title: False Negative
    name: False Negative
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [combined_predictions.percent_total, combined_predictions.is_actual, combined_predictions.is_predicted]
    filters:
      combined_predictions.is_actual: 'Yes'
      combined_predictions.is_predicted: 'No'
    sorts: [combined_predictions.percent_total desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 4
    col: 5
    width: 3
    height: 4
  - title: False Positive
    name: False Positive
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [combined_predictions.percent_total, combined_predictions.is_actual, combined_predictions.is_predicted]
    filters:
      combined_predictions.is_actual: 'No'
      combined_predictions.is_predicted: 'Yes'
    sorts: [combined_predictions.percent_total desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#F9AB00"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 8
    col: 2
    width: 3
    height: 4
  - title: True Negative
    name: True Negative
    model: irc-initial-model
    explore: irc_poc
    type: single_value
    fields: [combined_predictions.percent_total, combined_predictions.is_actual, combined_predictions.is_predicted]
    filters:
      combined_predictions.is_actual: 'No'
      combined_predictions.is_predicted: 'No'
    sorts: [combined_predictions.percent_total desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 8
    col: 5
    width: 3
    height: 4
  - title: Status Breakdown Actual
    name: Status Breakdown Actual
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [combined_predictions_wide.count, combined_predictions_wide.status_happy_path_actual]
    pivots: [combined_predictions_wide.status_happy_path_actual]
    filters:
      combined_predictions_wide.status_happy_path_actual: "-%0%"
    sorts: [combined_predictions_wide.status_happy_path_actual]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 680ed124-b86e-9f3b-cb9b-4837d0d56546
        label: Custom
        type: discrete
        colors:
        - "#B81D13"
        - "#cc3232"
        - "#db7b2b"
        - "#e7b416"
        - "#EFB700"
        - "#99c140"
        - "#2dc937"
        - "#2E7F18"
      options:
        steps: 5
        reverse: false
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 0
    col: 16
    width: 4
    height: 13
  - title: Status Breakdown Predicted
    name: Status Breakdown Predicted
    model: irc-initial-model
    explore: irc_poc
    type: looker_column
    fields: [combined_predictions_wide.count, combined_predictions_wide.status_happy_path_predicted]
    pivots: [combined_predictions_wide.status_happy_path_predicted]
    filters:
      combined_predictions_wide.status_happy_path_predicted: "-%0%"
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 4f5cb136-d8fa-e97d-d9e1-fe9c9a8d5137
        label: Custom
        type: discrete
        colors:
        - "#B81D13"
        - "#cc3232"
        - "#db7b2b"
        - "#e7b416"
        - "#EFB700"
        - "#99c140"
        - "#2dc937"
        - "#2E7F18"
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      combined_predictions.average_predicted: "#E8710A"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Model Goal: combined_predictions.model_goal
      Threshold: combined_predictions.threshold
    row: 0
    col: 20
    width: 4
    height: 13
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677866214040},{"type":"p","children":[{"text":""}],"id":1677866214172},{"type":"p","children":[{"text":""}],"id":1677866214318},{"type":"p","children":[{"text":""}],"id":1677866214476},{"type":"p","children":[{"text":""}],"id":1677866214623},{"type":"p","id":1677866239667,"children":[{"text":""}]},{"type":"p","id":1677866239801,"children":[{"text":""}]},{"type":"p","id":1677866220186,"children":[{"text":""}]},{"type":"p","id":1677866220305,"children":[{"text":""}]},{"type":"p","id":1677866220519,"children":[{"text":""}]},{"type":"p","children":[{"text":""}],"id":1677866214925},{"type":"p","children":[{"text":""}],"id":1677866215398},{"type":"p","children":[{"text":""}],"id":1677866215578},{"type":"h1","children":[{"text":"Actual"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 2
    height: 12
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677866217727},{"type":"p","children":[{"text":""}],"id":1677866218054},{"type":"h1","children":[{"text":"Predicted"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 2
    width: 6
    height: 4
  filters:
  - name: Model Goal
    title: Model Goal
    type: field_filter
    default_value: Is Happy Path
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: popover
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: combined_predictions.model_goal
  - name: Threshold
    title: Threshold
    type: field_filter
    default_value: '0.5'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: irc-initial-model
    explore: irc_poc
    listens_to_filters: []
    field: combined_predictions.threshold
