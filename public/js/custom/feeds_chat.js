var nvd3Charts = function() {

    var myColors = ["#33414E","#8DCA35","#00BFDD","#FF702A","#DA3610",
        "#80CDC2","#A6D969","#D9EF8B","#FFFF99","#F7EC37","#F46D43",
        "#E08215","#D73026","#A12235","#8C510A","#14514B","#4D9220",
        "#542688", "#4575B4", "#74ACD1", "#B8E1DE", "#FEE0B6","#FDB863",
        "#C51B7D","#DE77AE","#EDD3F2"];
    d3.scale.myColors = function() {
        return d3.scale.ordinal().range(myColors);
    };

    var startChart3 = function() {
        d3.json('assets/plugins/nvd3/stackedAreaData.json', function(data) {
            nv.addGraph(function() {

                var chart = nv.models.stackedAreaChart().margin({
                    top : 30,
                    right : 10,
                    bottom : 20,
                    left : 25
                }).x(function(d) {
                    return d[0];
                }).y(function(d) {
                    return d[1];
                }).forceY([0, 8000]).useInteractiveGuideline(true).color(d3.scale.myColors().range());;
                var options = {
                    showControls : false,
                    showLegend : true
                };
                chart.options(options);
                chart.xAxis.tickFormat(function(d) {
                    return d3.time.format('%x')(new Date(d));
                }).showMaxMin(false);

                chart.yAxis.tickFormat(d3.format(',f'));
                d3.select('#chart-3 svg').datum(data).call(chart);

                nv.utils.windowResize(chart.update);

                return chart;
            });
        });
    };
    var startChart7 = function() {
        d3.json('assets/plugins/nvd3/cumulativeLineData.json', function(data) {
            nv.addGraph(function() {
                var chart = nv.models.cumulativeLineChart().x(function(d) {
                    return d[0];
                }).y(function(d) {
                    return d[1] / 100;
                })//adjusting, 100% is 1.00, not 100 as it is in the data
                    .color(d3.scale.myColors().range()).useInteractiveGuideline(true);

                chart.xAxis.tickValues([1078030800000, 1122782400000, 1167541200000, 1251691200000]).tickFormat(function(d) {
                    return d3.time.format('%x')(new Date(d));
                });

                chart.yAxis.tickFormat(d3.format(',.1%'));

                d3.select('#twitter_chart svg').datum(data).call(chart);

                //TODO: Figure out a good way to do this automatically
                nv.utils.windowResize(chart.update);

                return chart;
            });
        });

    };

    return {
        init : function() {
            startChart3();
            startChart7();
        }
    };
}();

nvd3Charts.init();