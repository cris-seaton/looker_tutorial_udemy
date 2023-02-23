- dashboard: monthly_sales
  title: "Monthly Sales Dashboard"
  layout: newspaper
  # preferred_viewer: dashboards-next
  # tile_size: 100
  auto_run: true
  #refresh rates are in seconds
  refresh: 24 hours

  ## cross filtering
  preferred_viewer: dashboards-next
  crossfilter_enabled: yes

  filters:
  - name: state_selection
    title: "Select State"
    type: field_filter
    model: element_rental
    explore: sales
    field: sales.state
    allow_multiple_values: true
    required: false
  - name: customer_selection
    title: "Select Customer Type"
    type: field_filter
    explore: sales
    field: customer.customer_type
    allow_multiple_values: true
    ui_config:
      type: button_group
      display: inline
      options:
        - Long Haul
        - Medium Haul
        - Short Haul
  - name: sales_range_selection
    title: "Select Individual Sales Amount"
    type: field_filter
    model: element_rental
    explore: sales
    field: sales.sales
    allow_multiple_values: true
    default_value: "[0,200000]"
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 200000
  - name: single_customer_type
    title: "Customer Type"
    type: field_filter
    explore: sales
    field: customer.customer_type
    allow_multiple_values: true
    ui_config:
      type: button_toggles
      display: overflow
      options:
        - Long Haul
        - Medium Haul
        - Short Haul
  - name: date_filter
    title: "Data recency"
    type: date_filter
    explore: sales
    # default_value: before 0 days ago

  elements:
  - title: "Total Sales by Office"
    name: total_sales_by_office
    model: element_rental
    explore: sales
    type: looker_bar
    fields: [office.office_name, sales.total_sales, office.office_id]
    sorts: [sales.total_sales desc 0]
    limit: 500
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
      collection_id: sanfran-bikeshare
      palette_id: sanfran-bikeshare-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    ## row and column define the position (top-left point of the element)
    row: 0
    col: 12
    ## height defulats to 8 for newspaper layout
    width: 12
    ## height defaults to 6
    height: 6
    ## listen to the filter generated in the
    listen:
      state_selection: sales.state
      date_filter: sales.transaction_date
      customer_selection: customer.customer_type

  - title: Total Sales by State
    name: total_sales_by_state
    model: element_rental
    explore: sales
    type: looker_google_map
    fields: [sales.total_sales, sales.state]
    sorts: [sales.total_sales desc 0]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
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
    trellis: ''
    stacking: ''
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
      collection_id: sanfran-bikeshare
      palette_id: sanfran-bikeshare-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 0
    series_types: {}
    row: 6
    col: 0
    width: 12
    height: 6
    listen:
      state_selection: sales.state
      date_filter: sales.transaction_date
      customer_selection: customer.customer_type

  - title: "Count by Office"
    name: count_by_office
    model: element_rental
    explore: sales
    type: looker_column
    fields: [office.office_name, sales.count]
    sorts: [sales.total_sales desc 0]
    limit: 500
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
      collection_id: sanfran-bikeshare
      palette_id: sanfran-bikeshare-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    ## row and column define the position (top-left point of the element)
    row: 6
    col: 12
    ## height defulats to 8 for newspaper layout
    width: 12
    ## height defaults to 6
    height: 6
    listen:
      state_selection: sales.state
      date_filter: sales.transaction_date
      customer_selection: customer.customer_type
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"This is an example of a text input"}],"align":"center"},{"type":"p","id":1673616131410,"children":[{"text":"\nWe
      can have a number of different statements"}]},{"type":"p","id":1673616077717,"children":[{"text":""}]},{"type":"h2","id":1673616077864,"children":[{"text":"Technically"}]},{"type":"p","children":[{"text":"We
      can also use Markdown to create these"}],"id":1673616085313},{"type":"p","id":1673616096954,"children":[{"text":""}]},{"type":"h3","id":1673616097181,"children":[{"text":"But…."}]},{"type":"p","children":[{"text":"Markdown
      is annoying to write sometimes so its easier to just use the Scratch dashboard
      technique instead"}],"id":1673616105328}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 12
    height: 6
