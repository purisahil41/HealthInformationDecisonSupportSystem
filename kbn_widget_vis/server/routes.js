export default function(server) {

    //let call = server.plugins.elasticsearch.callWithRequest;
    const { callWithRequest } = server.plugins.elasticsearch.getCluster('data');
    const { callWithInternalUser } = server.plugins.elasticsearch.getCluster('data');
    server.route({
        path: '/api/kbn_widget_vis/fielddata/{indexName}/{fieldName}/{type}/{counts}',
        method: 'GET',
        handler(req, reply) {
            var indexName = req.params.indexName;
            var fieldName = req.params.fieldName;
            var type = req.params.type;
            var counts = req.params.counts;
            if(type == "Measures")
            {
                callWithRequest(req, 'search', {
                index: indexName,
               body: {
                        size: 0,
                        aggs: {
                            min_value: {
                                min: {
                                    field: fieldName
                                }
                            },
                            max_value: {
                                max: {
                                    field: fieldName
                                }
                            }
                        }
                    }
                }).then(function(response) {
                    reply(
                        response
                    );
                });
            }
            else if(type == "Dates")
            {
                callWithRequest(req, 'search', {
                index: indexName,
               body: {
                        size: 0,
                        aggs: {
                            min_value: {
                                min: {
                                    field: fieldName
                                }
                            },
                            max_value: {
                                max: {
                                    field: fieldName
                                }
                            }
                        }
                    }
                }).then(function(response) {
                    reply(
                        response
                    );
                });
            }
            else
            {
                callWithRequest(req, 'search', {
                index: indexName,
                body: {
                        size: 0,
                        aggs: {                               
                             top_counts: {
                                terms: {
                                    field: fieldName,
                                    size: counts
                                }                              
                            },
                            total_buckets: {
                                cardinality: {
                                    field: fieldName
                                }                              
                            }

                        }
                    }
                }).then(function(response) {
                    reply(
                        response
                    );
                });
            }            
        }
    });

   
    // server.route({
    //             path: '/api/elasticsearch_status/GetStats/{indexName}/{fieldName}',
    //             method: 'GET',
    //             handler(req, reply) {
    //                 var indexName = req.params.indexName;
    //                 var fieldName = req.params.fieldName;
    //                 callWithRequest(req, 'search', {
    //                     index: indexName,
    //                     body: {
    //                         size: 0,
    //                         aggs: {
    //                             field_stats: {
    //                                 extended_stats: {
    //                                     field: fieldName
    //                                 }
    //                             },
    //                             field_percentiles: {
    //                                 percentiles: {
    //                                     field: fieldName,
    //                                     percents : [0, 10, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 100]
    //                                 }
    //                             },
    //                             field_cardinality : {
    //                                 cardinality : {
    //                                     field : fieldName
    //                                 }
    //                             },
    //                              top_counts: {
    //                                 terms: {
    //                                     field: fieldName,
    //                                     size: 5
    //                                 }
                              
    //                             }
    //                         }

    //                     }
    //                 }).then(function(response) {
    //                     reply(
    //                         response
    //                     );
    //                 });
    //             }
    //         });


    //     server.route({
    //             path: '/api/elasticsearch_status/GetCategoricalStats/{indexName}/{fieldName}',
    //             method: 'GET',
    //             handler(req, reply) {
    //                 var indexName = req.params.indexName;
    //                 var fieldName = req.params.fieldName;
    //                 callWithRequest(req, 'search', {
    //                     index: indexName,
    //                     body: {
    //                         size: 0,
    //                         aggs: {                               
    //                              top_counts: {
    //                                 terms: {
    //                                     field: fieldName,
    //                                     size: 30
    //                                 }                              
    //                             },
    //                             total_buckets: {
    //                                 cardinality: {
    //                                     field: fieldName
    //                                 }                              
    //                             }

    //                         }
    //                     }
    //                 }).then(function(response) {
    //                     reply(
    //                         response
    //                     );
    //                 });
    //             }
    //         });
  }