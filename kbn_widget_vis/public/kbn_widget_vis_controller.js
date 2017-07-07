import d3 from 'd3';
import _ from 'lodash';
import $ from 'jquery';
import dateFormat from './lib/dateformat';
import uiModules from 'ui/modules';
import FilterBarQueryFilterProvider from 'ui/filter_bar/query_filter';
import buildRangeFilter from 'ui/filter_manager/lib/range';
import FilterBarLibMapRangeProvider from 'ui/filter_bar/lib/map_range';
import FilterBarProvider from 'ui/filter_bar/filter_bar';

const module = uiModules.get('kibana/kbn_widget_vis', ['kibana']);

module.controller('KbnWidgetVisController', function($scope, $element, $timeout, Private, $http, $q) {
    $scope.dataLoaded = false;
    var COUNT_VALUE = 20;
    var filterManager = Private(require('ui/filter_manager'));
    var mapRange = Private(FilterBarLibMapRangeProvider);
    const queryFilter = Private(FilterBarQueryFilterProvider);
    const filterBar = Private(FilterBarQueryFilterProvider);
    //var filterBar = Private(FilterBarProvider);
    $scope.outerFunction = function() {

        var allVis = getAllVisualizations();

        $scope.allIndexes = getAllIndexPatterns(allVis);

        $scope.indexFieldTypeCombo = combineIndexFieldType($scope.allIndexes);

        $scope.appliedFilters = [];

        $scope.allFieldTypes = ['Measures', 'Dimensions', 'Dates'];

        $scope.dataLoaded = true;

        $scope.refreshFilters(true);

        $scope.FilterAddEditView = false;
        $timeout(function() {
            $('.OuterDataLoadedDiv:visible')[0].scrollTop = $('#AddFilter').offset().top;
        }, 0, false)


        //var topNValues = getFieldValues(indexFieldTypeCombo[0], COUNT_VALUE);

    }

    $scope.removeQuery = function() {
        var qFilter = {};
        qFilter['query_string'] = {
            'analyze_wildcard': 'true',
            'query': '*'
        };
        angular.element('.kuiLocalSearch').scope().model.query = qFilter;
        $scope.refreshFilters(true);

    }

    $scope.$listen(queryFilter, 'update', function() {
        $scope.refreshFilters(true);
    });

    // $scope.$watch(angular.element('.kuiLocalSearch').scope().model.query.query_string, function (oldValue, newValue) {
    //     refreshFilters();
    // });

    $scope.refreshFilters = function(toCall) {
        $scope.appliedFilters = queryFilter.getFilters();
        if (toCall) {
            var promise = applyQuery();
            promise.then(function() {
                $scope.queryText = angular.element('.kuiLocalSearch').scope().model.query.query_string.query;
            });
        } else {
            $scope.queryText = angular.element('.kuiLocalSearch').scope().model.query.query_string.query;
        }
    }

    $scope.CancelFilter = function() {
        $scope.FilterAddEditView = false;
        $scope.filterUpdateModeOn = false;
        $scope.filterIndexSelected = false;
        $scope.filterFieldTypeSelected = false;
        $scope.filterFieldSelected = false;
        angular.element('.indexList').scope().selectedIndex = null;
        angular.element('.fieldTypeList').scope().selectedFieldType = null;
        angular.element('.fieldList').scope().selectedField = null;
    }

    $scope.updateTheme = function() {
        var darkTheme = angular.element('.kuiLocalNav').scope().model.darkTheme;
        $scope.getStyle(darkTheme);
        

    }

    $scope.getLastRowStyle = function()
    {
        var darkTHeme = angular.element('.kuiLocalNav').scope().model.darkTheme;
        if(darkTHeme)
        {
 return {
                        'background': '#272727'
                    };
        }
        else
        {
             return {
                        'background': 'white'
                    };
        }
    }

    $scope.getStyle = function(filter) {
        var darkTHeme = angular.element('.kuiLocalNav').scope().model.darkTheme;
        if (filter.filter != undefined) {
            var fieldName = filter.filter.meta.key;
            var indexName = filter.filter.meta.index;
            for (var i = 0; i < $scope.indexFieldTypeCombo.length; i++) {
                if ($scope.indexFieldTypeCombo[i].index.id == indexName && $scope.indexFieldTypeCombo[i].field.name == fieldName) {
                    var fieldType = $scope.indexFieldTypeCombo[i].type;
                    break;
                }
            }
            if (!darkTHeme) {
                if (fieldType == "Dimensions") {

                    return {
                        'background': '#dcf6ff'
                    };
                } else if (fieldType == "Measures") {
                    return {
                        'background': '#ffefd6'
                    };
                } else {
                    return {
                        'background': '#e3fde3'
                    };
                }
            } else {

                if (fieldType == "Dimensions") {

                    return {
                        'background': '#015b86'
                    };
                } else if (fieldType == "Measures") {
                    return {
                        'background': '#af6000'
                    };
                } else {
                    return {
                        'background': '#029002'
                    };
                }
            }
        } else {
            if (darkTHeme) {
                return {
                    'background': 'black'
                };
            } else {
                return {
                    'background': 'black'
                };
            }
        }


    }


    $scope.getFontStyle = function(filter) {
        var darkTHeme = angular.element('.kuiLocalNav').scope().model.darkTheme;
        if (filter.filter != undefined) {
            var fieldName = filter.filter.meta.key;
            var indexName = filter.filter.meta.index;
            for (var i = 0; i < $scope.indexFieldTypeCombo.length; i++) {
                if ($scope.indexFieldTypeCombo[i].index.id == indexName && $scope.indexFieldTypeCombo[i].field.name == fieldName) {
                    var fieldType = $scope.indexFieldTypeCombo[i].type;
                    break;
                }
            }
            if (!darkTHeme) {
                if (fieldType == "Dimensions") {

                    return {
                        'color': 'darkblue'
                    };
                } else if (fieldType == "Measures") {
                    return {
                        'color': 'darkorange'
                    };
                } else {
                    return {
                        'color': 'darkgreen'
                    };
                }
            } else {

                if (fieldType == "Dimensions") {

                    return {
                        'color': '#dcf6ff'
                    };
                } else if (fieldType == "Measures") {
                    return {
                        'color': '#ffefd6'
                    };
                } else {
                    return {
                        'color': '#e3fde3'
                    };
                }


            }
        } else {
            if (darkTHeme) {
                return {
                    'color': 'white'
                };
            } else {
                return {
                    'color': 'black'
                };
            }
        }



    }

    $scope.EditFilter = function(index) {
        $scope.FilterAddEditView = true;
        $scope.filterUpdateModeOn = true;
        $scope.filterUpdateModeIndex = index;
        var filter = $scope.appliedFilters[index];
        var indexName = filter.meta.index;
        var fieldName = filter.meta.key;
        var fieldType = "";

        for (var i = 0; i < $scope.indexFieldTypeCombo.length; i++) {
            if ($scope.indexFieldTypeCombo[i].index.id == indexName && $scope.indexFieldTypeCombo[i].field.name == fieldName) {
                fieldType = $scope.indexFieldTypeCombo[i].type;
                var index = $scope.indexFieldTypeCombo[i].index;
                var field = $scope.indexFieldTypeCombo[i];
                break;
            }
        }
        angular.element('.indexList').scope().selectedIndex = index;
        angular.element('.fieldTypeList').scope().selectedFieldType = fieldType;
        $scope.updateFilterFieldType();

        angular.element('.fieldList').scope().selectedField = field;
        var filterPromise = $scope.updateFilterField();

        filterPromise.then(function() {
            if (fieldType == "Measures") {
                var maxVal = filter.range[fieldName].lte;
                var minVal = filter.range[fieldName].gte;
                angular.element('.minValue').scope().minValue = minVal;
                angular.element('.maxValue').scope().maxValue = maxVal;
            } else if (fieldType == "Dimensions") {
                var value = filter.query.match[fieldName].query;
                var esValuesBuckets = angular.element('.fieldValueList').scope().$parent.esValues.aggregations.top_counts.buckets;
                for (var i = 0; i < esValuesBuckets.length; i++) {
                    if (esValuesBuckets[i].key == value) {
                        //angular.element('.fieldValueList').scope().selectedFieldValue = esValuesBuckets[i];       
                        esValuesBuckets[i].isSelected = true;
                    }
                }

            } else if (fieldType == "Dates") {
                var minDate = filter.range[fieldName].gte;
                var maxDate = filter.range[fieldName].lte;
                var dt = new Date(minDate);
                var month = dt.getMonth();
                var day = dt.getDate();
                var hours = dt.getHours();
                var minutes = dt.getMinutes();
                if (hours < 10)
                    hours = '0' + hours.toString();
                var minutes = dt.getMinutes();
                if (minutes < 10)
                    minutes = '0' + minutes.toString();
                var milliSeconds = dt.getSeconds();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();
                $scope.minDateStr = dt.getFullYear() + "-" + month + "-" + day + "T" + hours + ":" + minutes + ":" + milliSeconds;
                dt = new Date(maxDate);
                month = dt.getMonth();
                day = dt.getDate();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();
                var hours = dt.getHours();
                if (hours < 10)
                    hours = '0' + hours.toString();
                var minutes = dt.getMinutes();
                if (minutes < 10)
                    minutes = '0' + minutes.toString();
                var milliSeconds = dt.getSeconds();
                $scope.maxDateStr = dt.getFullYear() + "-" + month + "-" + day + "T" + hours + ":" + minutes + ":" + milliSeconds;
            }
        });



    }

    $scope.ApplyFilter = function() {
        var filters = queryFilter.getFilters(); // returns array of **pinned** filters
        var selectedField = angular.element('.fieldList').scope().selectedField;
        var fieldName = selectedField.field.name;
        fieldName = "" + fieldName;
        var indexName = angular.element('.indexList').scope().selectedIndex.id;
        var filterValue = "";
        if (selectedField.type == "Measures") {
            //filterValue = $scope.esValues.aggregations.min_value.value + " TO " + $scope.esValues.aggregations.max_value.value;
            var minVal = angular.element('.minValue').val();
            if (minVal == "") minVal = angular.element('.minValue').prop("placeholder");
            var maxVal = angular.element('.maxValue').val();
            if (maxVal == "") maxVal = angular.element('.maxValue').prop("placeholder");
            filterValue = minVal + " TO " + maxVal;
            var range = {};
            range[fieldName.toString()] = {
                lte: maxVal,
                gte: minVal
            };
            var meta = {};
            meta['index'] = indexName;
            var filter = {};
            filter['meta'] = {
                index: indexName
            };
            filter['range'] = range;
            if (!$scope.filterUpdateModeOn) {
                var promise = queryFilter.addFilters(filter);
            } else {
                var promise = queryFilter.removeFilter(filters[$scope.filterUpdateModeIndex]);
                promise = queryFilter.addFilters(filter);
            }

        } else if (selectedField.type == "Dimensions") {
            if ($scope.filterUpdateModeOn) {
                var promise = queryFilter.removeFilter(filters[$scope.filterUpdateModeIndex]);
            }

            var fieldValues = angular.element('.fieldValueList').scope().$parent.esValues.aggregations.top_counts.buckets;
            var isMultipleFieldSelected = false;
            var isSingleFieldSelected = false;
            var finalFieldVal = "";
            var fieldValueSingle = "";
            for (var fieldID = 0; fieldID < fieldValues.length; fieldID++) {
                if (fieldValues[fieldID].isSelected && isSingleFieldSelected) {
                    finalFieldVal += " OR \"" + fieldValues[fieldID].key + "\"";
                    isMultipleFieldSelected = true;
                } else if (fieldValues[fieldID].isSelected) {
                    finalFieldVal = "\"" + fieldValues[fieldID].key + "\"";
                    fieldValueSingle = fieldValues[fieldID].key;
                    isSingleFieldSelected = true;
                }
            }
            if (isMultipleFieldSelected) {
                var finQuery = fieldName + " : " + finalFieldVal;
                var qFilter = {};
                if (angular.element('.kuiLocalSearch').scope().model.query.query_string.query == "*") {
                    qFilter['query_string'] = {
                        'analyze_wildcard': 'true',
                        'query': finQuery
                    };
                } else {
                    var currQueryString = angular.element('.kuiLocalSearch').scope().model.query.query_string.query;
                    qFilter['query_string'] = {
                        'analyze_wildcard': 'true',
                        'query': currQueryString + " AND (" + finQuery + ")"
                    };
                }
                //qFilter['query_string'] = { 'analyze_wildcard' : 'true', 'query' : 'gender.keyword: "F" OR "M"'};
                angular.element('.kuiLocalSearch').scope().model.query = qFilter;
                var promise = applyQuery();
            } else {
                var promise = filterManager.add(
                    // The field to filter for, we can get it from the config
                    fieldName,
                    // The value to filter for, we will read out the bucket key from the tag
                    fieldValueSingle,
                    // Whether the filter is negated. If you want to create a negated filter pass '-' here
                    null,
                    // The index pattern for the filter
                    indexName
                );
            }
            //var fieldValue = angular.element('.fieldValueList').scope().selectedFieldValue.key;
            // Add a new filter via the filter manager

        } else if (selectedField.type == "Dates") {
            var minDate = new Date(angular.element('.minDate').val()).getTime();
            var maxDate = new Date(angular.element('.maxDate').val()).getTime();
            filterValue = minVal + " TO " + maxVal;
            var range = {};
            range[fieldName.toString()] = {
                lte: maxDate,
                gte: minDate
            };
            var meta = {};
            meta['index'] = indexName;
            var filter = {};
            filter['meta'] = {
                index: indexName
            };
            filter['range'] = range;
            if (!$scope.filterUpdateModeOn) {
                var promise = queryFilter.addFilters(filter);
            } else {
                var promise = queryFilter.removeFilter(filters[$scope.filterUpdateModeIndex]);
                promise = queryFilter.addFilters(filter);
            }
        }

        // var qFilter = {};
        // qFilter['query_string'] = { 'analyze_wildcard' : 'true', 'query' : 'gender.keyword: "F" OR "M"'};
        // angular.element('.kuiLocalSearch').scope().model.query = qFilter;
        // angular.element('.kuiLocalSearch').scope().filterResults();
        promise.then(function() {
            $scope.refreshFilters(true);
            $scope.FilterAddEditView = false;
            $scope.filterUpdateModeOn = false;
            $timeout(function() {
                $('.OuterDataLoadedDiv:visible')[0].scrollTop = $('#AddFilter').offset().top;
            }, 0, false)
        });

    }

    $scope.checkBoxSelected = function(index) {
        var ob = angular.element('.dimensionCheckBox')[index];
        var allElements = $('.dimensionCheckBox');
        for (var i = 0; i < allElements.length; i++) {
            angular.element(allElements[i]).scope().value.isSelected = false;
        }
        $('.dimensionCheckBox:checked').prop('checked', false);
        angular.element(ob).scope().value.isSelected = true;
        $(ob).prop('checked', true);
    }

    $scope.AddFilter = function() {
        $scope.CancelFilter();

        $scope.FilterAddEditView = true;
    }

    $scope.DeleteFilter = function(index) {
        var allFilters = queryFilter.getAppFilters();
        queryFilter.removeFilter(allFilters[index]);
        $scope.refreshFilters(true);
    }

    $scope.updateFilterIndex = function(index) {
        $scope.filterIndexSelected = true;
    }

    $scope.updateFilterFieldType = function() {
        $scope.allFields = [];
        $scope.filterFieldTypeSelected = true;
        $scope.filterFieldSelected = false;
        for (var i = 0; i < $scope.indexFieldTypeCombo.length; i++) {
            if ($scope.indexFieldTypeCombo[i].index.id == angular.element('.indexList').scope().selectedIndex.id && $scope.indexFieldTypeCombo[i].type == angular.element('.fieldTypeList').scope().selectedFieldType) {
                $scope.allFields.push($scope.indexFieldTypeCombo[i]);
            }
        }
        $scope.filterSelectedFieldType = $scope.allFields[0].type;
    }

    $scope.updateFilterField = function() {
        return $q(function(resolve, reject) {
            var selectedField = angular.element('.fieldList').scope().selectedField;
            var promise = getFieldValues(selectedField, COUNT_VALUE);
            promise.then(function(esValues) {
                $scope.esValues = esValues;
                if (selectedField.type == "Dates") {
                    var minVal = esValues.aggregations.min_value.value;
                    var maxVal = esValues.aggregations.max_value.value;
                    var dt = new Date(minVal);
                    var month = dt.getMonth();
                    var day = dt.getDate();
                    var hours = dt.getHours();
                    var minutes = dt.getMinutes();
                    if (hours < 10)
                        hours = '0' + hours.toString();
                    var minutes = dt.getMinutes();
                    if (minutes < 10)
                        minutes = '0' + minutes.toString();
                    var milliSeconds = dt.getSeconds();
                    if (month < 10)
                        month = '0' + month.toString();
                    if (day < 10)
                        day = '0' + day.toString();
                    $scope.minDateStr = dt.getFullYear() + "-" + month + "-" + day + "T" + hours + ":" + minutes + ":" + milliSeconds;
                    dt = new Date(maxVal);
                    month = dt.getMonth();
                    day = dt.getDate();
                    if (month < 10)
                        month = '0' + month.toString();
                    if (day < 10)
                        day = '0' + day.toString();
                    var hours = dt.getHours();
                    if (hours < 10)
                        hours = '0' + hours.toString();
                    var minutes = dt.getMinutes();
                    if (minutes < 10)
                        minutes = '0' + minutes.toString();
                    var milliSeconds = dt.getSeconds();
                    $scope.maxDateStr = dt.getFullYear() + "-" + month + "-" + day + "T" + hours + ":" + minutes + ":" + milliSeconds;

                }
                $scope.filterSelectedFieldType = selectedField.type;
                $scope.filterFieldSelected = true;
                resolve();
            });
        });

    }

    function applyQuery() {
        return $q(function(resolve, reject) {
            angular.element('.kuiLocalSearch').scope().filterResults();
            resolve();
        });
    }

    function getFieldValues(field, counts) {
        return $q(function(resolve, reject) {
            var indexName = field.index.id;
            var fieldName = field.field.name;
            var type = field.type;

            $http.get(`../api/kbn_widget_vis/fielddata/${indexName}/${fieldName}/${type}/${counts}`).then((response) => {
                resolve(response.data);
            });
        });
    }

    function combineIndexFieldType(allIndexes) {
        var finalList = [];
        for (var i = 0; i < allIndexes.length; i++) {
            var currIndex = allIndexes[i];
            for (var idField = 0; idField < currIndex.fields.length; idField++) {
                var comboIndexField = {};
                var currField = currIndex.fields[idField];
                if (currField.aggregatable) {
                    if (currField.type == "number") {
                        comboIndexField.type = "Measures";
                    } else if (currField.type == "date") {
                        comboIndexField.type = "Dates";
                    } else {
                        comboIndexField.type = "Dimensions";
                    }
                    comboIndexField.index = currIndex;
                    comboIndexField.field = currField;
                    finalList.push(comboIndexField);
                }
            }
        }
        return finalList;
    }

    function getAllVisualizations() {
        var allVis = [];
        var allPanels = angular.element('.panel');
        for (var i = 0; i < allPanels.length; i++) {
            if (angular.element(allPanels[i]).scope().$parent.panel.type == "visualization") {
                allVis.push(allPanels[i]);
            }
        }
        return allVis;
    }

    function getAllIndexPatterns(allVis) {
        var indexPatternList = [];
        var indexPatterNameList = [];
        for (var i = 0; i < allVis.length; i++) {
            var savedVis = angular.element(allVis[i]).scope().$parent.savedObj;
            if (savedVis.vis.indexPattern != null && indexPatterNameList.indexOf(savedVis.vis.indexPattern.id) == -1) {
                indexPatternList.push(savedVis.vis.indexPattern);
                indexPatterNameList.push(savedVis.vis.indexPattern.id);
            }
        }
        return indexPatternList;

    }

});