local grafana = import 'grafonnet/grafana.libsonnet';
local zabbix = grafana.zabbix;

{
  dashboard: grafana.dashboard.new(
    title='CPU utilization',
    schemaVersion=12,
    tags=['zabbix'],
    time_from='now-6h',
  )
  .addPanel(
    grafana.graphPanel.new(
      title='CPU usage',
      datasource='e5c9d618-048f-4b16-abd8-b0c9af3bbbb8',
    )
    .addTarget(
      zabbix.target(
        itemFilter='CPU usage',
        groupFilter='$hostgroup',
        hostFilter='$host',
      )
    )
    .setLegend(
      show=true,
      min=true,
      max=true,
      avg=true,
    )
    // Установка позиции панели должна быть выполнена с правильными параметрами
    .setGridPos(0, 0, 24, 17)
  ),
}
