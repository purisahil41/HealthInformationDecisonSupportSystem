import api from './server/routes';
module.exports = function (kibana) {

  return new kibana.Plugin({

    uiExports: {
      visTypes: ['plugins/kbn_widget_vis/kbn_widget_vis']
    },

    // The init method will be executed when the Kibana server starts and loads
    // this plugin. It is used to set up everything that you need.
    init(server, options) {
      // Just call the api module that we imported above (the server/routes.js file)
      // and pass the server to it, so it can register several API interfaces at the server.
      api(server);
    }
          
  });
}
