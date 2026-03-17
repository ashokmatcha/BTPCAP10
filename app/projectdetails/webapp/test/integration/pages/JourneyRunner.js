sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/prj/projectdetails/test/integration/pages/ProjectSetList",
	"com/prj/projectdetails/test/integration/pages/ProjectSetObjectPage"
], function (JourneyRunner, ProjectSetList, ProjectSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/prj/projectdetails') + '/test/flp.html#app-preview',
        pages: {
			onTheProjectSetList: ProjectSetList,
			onTheProjectSetObjectPage: ProjectSetObjectPage
        },
        async: true
    });

    return runner;
});

