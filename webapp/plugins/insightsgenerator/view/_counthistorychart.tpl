{if $i->related_data.vis_data}

<div id="chart_{$i->id}" class="chart"></div>

<script type="text/javascript">
// Load the Visualization API and the standard charts
google.load('visualization', '1.0');
// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawChart{$i->id});
{literal}

function drawChart{/literal}{$i->id}() {literal}{
  var formatter_date = new google.visualization.DateFormat({formatType: 'medium'});
  var formatter = new google.visualization.NumberFormat({fractionDigits: 0});
  {/literal}
  var count_history_data_{$i->id} = new google.visualization.DataTable(
  {$i->related_data.vis_data});
  var c = window.tu.constants.colors;
  var color = c.{$color};
  formatter.format(count_history_data_{$i->id}, 1);
  formatter_date.format(count_history_data_{$i->id}, 0);
{literal}
  var chart_{/literal}{$i->id}{literal} = new google.visualization.ChartWrapper({
  {/literal}
      containerId: 'chart_{$i->id}',
      {literal}
      chartType: 'LineChart',
      dataTable: count_history_data_{/literal}{$i->id}{literal},
      options: {
          height: 200,
          width: 290,
          legend: "none",
          interpolateNulls: true,
          pointSize: 4,
          colors : [color],
          hAxis: {
              baselineColor: '#eee',
              format: 'MMM d',
              textStyle: { color: '#999' },
              gridlines: { color: '#eee' }
          },
          vAxis: {
              baselineColor: '#eee',
              textStyle: { color: '#999' },
              gridlines: { color: '#eee' }
          },
      },
  });
{/literal}
    {include file=$tpl_path|cat:"_chartcallback.tpl"}
{literal}
  chart_{/literal}{$i->id}{literal}.draw();
  }
  {/literal}
</script>
{/if}
