// import 'ui/agg_table';
// import 'ui/agg_table/agg_table_group';


import 'plugins/kbn_widget_vis/kbn_widget_vis.less';
import 'plugins/kbn_widget_vis/kbn_widget_vis_controller';

import TemplateVisTypeTemplateVisTypeProvider from 'ui/template_vis_type/template_vis_type';
import VisSchemasProvider from 'ui/vis/schemas';
import WidgetVisTemplate from 'plugins/kbn_widget_vis/kbn_widget_vis.html';

require('ui/registry/vis_types').register(WidgetVisProvider);

function WidgetVisProvider(Private) {
  const TemplateVisType = Private(TemplateVisTypeTemplateVisTypeProvider);
  const Schemas = Private(VisSchemasProvider);
  return new TemplateVisType({
    name: 'kbn_widget',
    title: 'Widget',
    icon: 'fa-random',
    description: 'Use this visualiazation for control widgets in dashboards.',
    template: WidgetVisTemplate,
    // params: {
    //   defaults: {
    //     showMetricsAtAllLevels: false
    //   },
    //   editor: '<vislib-basic-options></vislib-basic-options>'
    // },
    // hierarchicalData: function (vis) {
    //   return Boolean(vis.params.showPartialRows || vis.params.showMetricsAtAllLevels);
    // },
    // schemas: new Schemas([
    //   {
    //     group: 'metrics',
    //     name: 'metric',
    //     title: 'Split Size',
    //     min: 0,
    //     max: 0,
    //     defaults: [
    //       {type: 'count', schema: 'metric'}
    //     ]
    //   },
    //   {
    //     group: 'buckets',
    //     name: 'segment',
    //     title: 'Split Slices',
    //     aggFilter: '!geohash_grid',
    //     min: 0,
    //     max: 0
    //   }
    // ]),
    requiresSearch: false
  });
};


